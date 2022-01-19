# 画像読み込み
my_img_deg = im2double(imread("P10_DEG.pgm"));
img_deg = im2double(imread("LENA256DEG.pgm"));

subplot(1, 2, 1);
imshow(my_img_deg);
subplot(1, 2, 2);
imshow(img_deg);

# 劣化作用素を生成
A = mk_deg_mat(256, 15);

# 画像を復元する
img_rest = inv(A) * img_deg;

my_img_rest = im2double(imread("P10_REST.pgm"));

subplot(1, 2, 1);
imshow(my_img_rest);
subplot(1, 2, 2);
imshow(img_rest);

# ファイルへ書き込む
imwrite(img_rest, "P11_REST.pgm");