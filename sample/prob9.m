# 画像読み込み
img = im2double(imread("LENA256.pgm"));
# 画像を多変量データに変換
data = img2data(img, 8);

[datareconst, num] = PCA_represent(data, 0.98);

imgreconst = data2img(datareconst, 256, 256);

subplot(1, 2, 1);
imshow(img);
subplot(1, 2, 2);
imshow(imgreconst);

num

# 画像読み込み
img = im2double(imread("ROOM256.pgm"));
# 画像を多変量データに変換
data = img2data(img, 8);

[datareconst, num] = PCA_represent(data, 0.98);
imgreconst = data2img(datareconst, 256, 256);

subplot(1, 2, 1);
imshow(img);
subplot(1, 2, 2);
imshow(imgreconst);

num