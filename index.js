var request = require("request");
var crypto = require("crypto");
var url = require("url");
var cheerio = require("cheerio");
path = require("path");
var fs = require("fs");
const rootURL = "http://caminantes-grafico.org/";
const TEXT_NODE = 3;
const ELEMENT_NODE = 1;

console.log("need node v11 otherwise no recursive mkdir");

const htmlDecode = encoded => encoded.replace(/&amp;/g, "&");
const htmlEncode = decode => decode.replace(/&/g, "&amp;");

const getByTagProp = (content, tag, key) => {
  let returnResource = [];

  $ = cheerio.load(content);
  resources = $(tag).toArray();
  resources.forEach(function(resource) {
    //console.log(img.attribs.src)
    if (resource.attribs[key]) {
      returnResource.push(resource.attribs[key]);
    }
  });
  return returnResource;
};

function getCSSImages(content) {
  let imgUrl = [];

  $ = cheerio.load(content);

  $("*").each(function(i, node) {
    if (node.nodeType === ELEMENT_NODE) {
      let bgImage = $(node).css("background-image");
      if (bgImage) {
        bgImage = /^url\((['"]?)(.*)\1\)$/.exec(bgImage);
        if (bgImage) {
          imgUrl.push(bgImage[2]);
        }
      }
    }

    // imgUrl.push($(node).css("background-image").replace("url(\"", "").replace("\")", ""));
  });

  return imgUrl;
}

const save = (location, content) => {
  let finalPaht = "./offline/" + location;
  let basedir = path.dirname(finalPaht);

  if (!fs.existsSync(basedir)) {
    fs.mkdirSync(basedir, { recursive: true }, err => {
      if (err) throw err;
    });
  }

  fs.writeFileSync(finalPaht, content);
};

function dl(uri, location, cb) {
  return request(uri, function(error, response, body) {
    if (!error && response.statusCode == 200) {
      save(location, body);
      cb && cb(body);
    } else {
      console.log("DL error", uri);
    }
  });
}

// function getImages(uri) {
//
//     request(uri, function (error, response, body) {
//         if (!error && response.statusCode == 200) {
//             $ = cheerio.load(body)
//             imgs = $('img').toArray()
//             console.log("Downloading...")
//             imgs.forEach(function (img) {
//                 //console.log(img.attribs.src)
//                 process.stdout.write(".");
//                 img_url = img.attribs.src
//                 if (/^https?:\/\//.test(img_url)) {
//                     img_name = path.basename(img_url)
//                     request(img_url).pipe(fs.createWriteStream(img_name))
//                 }
//             })
//             console.log("Done!")
//         }
//     })
// }

const buildFilenames = filename => {
  return filename.map(item => {
    let urlParsed = url.parse(item);

    let dir = path.dirname(urlParsed.pathname);
    let ext = path.extname(urlParsed.pathname);
    let basename = path.basename(urlParsed.pathname, ext);
    let search = urlParsed.search;

    if (search) {
      if (ext === ".js") {
        search = "";
      }
      if (ext === ".css") {
        search = "";
      }
      if (ext === ".php") {
        let lastExt = search.substr(-4);

        if (lastExt === ".png" || lastExt === ".jpg" || lastExt === ".png") {
          var shasum = crypto.createHash("sha1");
          console.log("--- search", search);
          shasum.update(search);
          basename = basename + "_" + shasum.digest("hex").substr(-6);
          search = "";
          ext = lastExt;
        }
      }
    }

    const replace = `./${dir}/${basename}${ext}${search ? search : ""}`;

    return [item, replace];
  });
};

function escapeRegExp(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"); // $& means the whole matched string
}

dl(rootURL, "index.html", content => {
  // getImages(content, images => console.log(images));

  let allURL = [
    ...getCSSImages(content),
    ...getByTagProp(content, "link", "href"),
    ...getByTagProp(content, "script", "src"),
    ...getByTagProp(content, "img", "src")
  ];

  allURL = buildFilenames(allURL);
  let newContent = content;
  console.log(allURL);
  allURL.map(item => {
    dl(`${rootURL}/${item[0]}`, item[1]);
  });

  allURL.forEach(item => {
    console.log("sr", item[0], item[1]);
    // newContent = newContent.split(item[0]).join(item[1]);
    newContent = newContent.replace(
      new RegExp(escapeRegExp(htmlEncode(item[0])), "g"),
      item[1]
    );
  });
  save("index.html", newContent);
});
