function prob13(imgfilename, gamma)
    # 画像読み込み
    img = im2double(imread(imgfilename));
    
    # 劣化作用素を生成
    A = mk_deg_mat(256, 15);
    
    # 画像を復元する
    I = eye(size(A' * A));
    img_rest = inv(A' * A + gamma * I) * A' * img;
    
    # 画像表示
    imshow(img_rest);
    
    # ファイルへ書き込み
    imwrite(img_rest, "P13_REST.pgm");
end