img = im2double(imread("LENA256.pgm"));

# 劣化作用素を生成
A = mk_deg_mat(256, 15);

# 画像を劣化させる
img_deg = A * img;

# 画像を復元する
img_rest = inv(A) * img_deg;

subplot(1, 2, 1);
imshow(img_deg);
subplot(1, 2, 2);
imshow(img_rest);

# ファイルへ書き込む
imwrite(img_deg, "P10_DEG.pgm");
imwrite(img_rest, "P10_REST.pgm");