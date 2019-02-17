#!/bin/sh


page_get()
{
	fileDL="$@"
	fileDL=${fileDL/http:\/\/caminantes-grafico.org\/}
	#echo ${fileDL}
	$(wget -r --accept=css,jpeg,jpg,bmp,gif,png --page-requisites http://caminantes-grafico.org/"$fileDL")
	$(wget "http://caminantes-grafico.org/$fileDL" -O "./caminantes-grafico.org/$fileDL")
}


single_get()
{
	fileDL="$@"
	fileDL=${fileDL/http:\/\/caminantes-grafico.org\/}

	$(wget "http://caminantes-grafico.org/$fileDL" -O "./caminantes-grafico.org/$fileDL")
}


short_page() 
{
	page_get "http://caminantes-grafico.org/dyn_text.php?id=$@&type=10&L=0"
	page_get "http://caminantes-grafico.org/dyn_text.php?id=$@&type=10&L=2"
	page_get "http://caminantes-grafico.org/dyn_text.php?id=$@&type=10&L=3"

}



# ---- sh -------------------------
page_get "http://caminantes-grafico.org/index.php"
mv "./caminantes-grafico.org/index.php" "./caminantes-grafico.org/index.html"


# ---- michi -------------------------
# alle css und js ohne ?000000
# single_get "http://caminantes-grafico.org/t3/fileadmin/setup/css/style.css"
# page_get "http://caminantes-grafico.org/dyn_text.php?id=84&type=10&L=2"


single_get "http://caminantes-grafico.org/t3/typo3temp/stylesheet_5d370599a3.css"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/css/style.css"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/css/layout.css"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/js/jquery-1.4.4.min.js"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/js/jquery-ui-1.8.7.custom.min.js"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/js/mapall.js"
single_get "http://caminantes-grafico.org/t3/typo3temp/javascript_a708894199.js"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/a0928efdfb.png&m=typo3temp/GB/4e535f55f1.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/21be447bf8.png&m=typo3temp/GB/04b8760e7f.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/2bcfe56c8b.png&m=typo3temp/GB/f0098848b9.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/c04c4f2580.png&m=typo3temp/GB/dcdaa577a6.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/2cfe5b9e81.png&m=typo3temp/GB/b0e01e996e.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/e5979cedca.png&m=typo3temp/GB/a1a887dc5d.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/42e0a2e73c.png&m=typo3temp/GB/9ef8b7fe6c.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/4f10d61f90.png&m=typo3temp/GB/bf3d589f37.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/5829e4aed7.png&m=typo3temp/GB/b4a8f60dfa.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/3648013979.png&m=typo3temp/GB/6a4f015149.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/6add9834ce.png&m=typo3temp/GB/6fe48d85c8.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/f964f72b2b.png&m=typo3temp/GB/d1f713de09.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/af55614aa0.png&m=typo3temp/GB/ea08f4ab54.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/247c8d9bec.png&m=typo3temp/GB/43346a6938.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/bb2e8286cf.png&m=typo3temp/GB/408ed9f444.png"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/img/line.png"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/img/cgbutton.png"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/img/minus.png"
single_get "http://caminantes-grafico.org/t3/fileadmin/setup/img/plus.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/1234c314a1.png&m=typo3temp/GB/825c495c99.png"
single_get "http://caminantes-grafico.org/img/nav/pointer_star_k.png"
single_get "http://caminantes-grafico.org/t3/png.php?i=./typo3temp/GB/0fb74fdf88.png&m=typo3temp/GB/2c9a107a07.png"


#page_get "http://caminantes-grafico.org/dyn_text.php?id=7&type=10&L=0"

short_page 1
short_page 2
short_page 3
short_page 4
short_page 5
short_page 6
short_page 7
short_page 8
short_page 9
short_page 10
short_page 11
short_page 12
short_page 13
short_page 14
short_page 15
short_page 16
short_page 17
short_page 18
short_page 19
short_page 20
short_page 21
short_page 22
short_page 23
short_page 24
short_page 25
short_page 26
short_page 27
short_page 28
short_page 29
short_page 30
short_page 31
short_page 32
short_page 33
short_page 34
short_page 35
short_page 36
short_page 37
short_page 38
short_page 39
short_page 40
short_page 41
short_page 42
short_page 43
short_page 44
short_page 45
short_page 46
short_page 47
short_page 48
short_page 49
short_page 50
short_page 51
short_page 52
short_page 53
short_page 54
short_page 55
short_page 56
short_page 57
short_page 58
short_page 59
short_page 60
short_page 61
short_page 62
short_page 63
short_page 64
short_page 65
short_page 66
short_page 67
short_page 68
short_page 69
short_page 70
short_page 71
short_page 72
short_page 73
short_page 74
short_page 75
short_page 76
short_page 77
short_page 78
short_page 79
short_page 80
short_page 81
short_page 82
short_page 83
short_page 84
short_page 85
short_page 86
short_page 87
short_page 88
short_page 89
short_page 90
short_page 91
short_page 92
short_page 93
short_page 94
short_page 95
short_page 96
short_page 97
short_page 98
short_page 99
short_page 100
short_page 101
short_page 102
short_page 103
short_page 104
short_page 105
short_page 106
short_page 107
short_page 108
short_page 109
short_page 110
short_page 111
short_page 112
short_page 113
short_page 114
short_page 115
short_page 116
short_page 117
short_page 118
short_page 119
short_page 120
short_page 121
short_page 122
short_page 123
short_page 124
short_page 125
short_page 126
short_page 127
short_page 128
short_page 129
short_page 130
short_page 131
short_page 132
short_page 133
short_page 134
short_page 135
short_page 136
short_page 137
short_page 138
short_page 139
short_page 140
short_page 141
short_page 142
short_page 143
short_page 144
short_page 145
short_page 146
short_page 147
short_page 148
short_page 149
short_page 150
short_page 151
short_page 152
short_page 153
short_page 154
short_page 155
short_page 156
short_page 157
short_page 158
short_page 159
short_page 160
short_page 161
short_page 162
short_page 163
short_page 164
short_page 165
short_page 166
short_page 167
short_page 168
short_page 169
short_page 170
short_page 171
short_page 172
short_page 173
short_page 174
short_page 175
short_page 176
short_page 177
short_page 178
short_page 179
short_page 180
short_page 181
short_page 182
short_page 183
short_page 184
short_page 185
short_page 186
short_page 187
short_page 188
short_page 189
short_page 190
short_page 191
short_page 192
short_page 193
short_page 194
short_page 195
short_page 196
short_page 197
short_page 198
short_page 199
short_page 200
short_page 201
short_page 202
short_page 203
short_page 204
short_page 205
short_page 206
short_page 207
short_page 208
short_page 209
short_page 210
short_page 211
short_page 212
short_page 213
short_page 214
short_page 215
short_page 216
short_page 217
short_page 218
short_page 219
short_page 220
short_page 221
short_page 222
short_page 223
short_page 224
short_page 225
short_page 226
short_page 227
short_page 228
short_page 229
short_page 230
short_page 231
short_page 232
short_page 233
short_page 234
short_page 235
short_page 236
short_page 237
short_page 238
short_page 239
short_page 240
short_page 241
short_page 242
short_page 243
short_page 244
short_page 245
short_page 246
short_page 247
short_page 248
short_page 249
short_page 250
short_page 251
short_page 252
short_page 253
short_page 254
short_page 255
short_page 256
short_page 257
short_page 258
short_page 259
short_page 260
short_page 261
short_page 262
short_page 263
short_page 264
short_page 265
short_page 266
short_page 267
short_page 268
short_page 269
short_page 270
short_page 271
short_page 272
short_page 273
short_page 274
short_page 275
short_page 276
short_page 277
short_page 278
short_page 279
short_page 280
short_page 281
short_page 282
short_page 283
short_page 284
short_page 285
short_page 286
short_page 287
short_page 288
short_page 289
short_page 290
short_page 291
short_page 292
short_page 293
short_page 294
short_page 295
short_page 296
short_page 297
short_page 298
short_page 299
short_page 300
short_page 301
short_page 302
short_page 303
short_page 304
short_page 305
short_page 306
short_page 307
short_page 308
short_page 309
short_page 310
short_page 311
short_page 312
short_page 313
short_page 314
short_page 315
short_page 316
short_page 317
short_page 318