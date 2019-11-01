function outputEigenfaces(vectors, h, w)        
    for i = 1:size(vectors, 2)
        img = vectors(:, i);
        img = reshape(img, h, w);
               
        img = mat2gray(img);

        num = convertStringsToChars(num2str(i, '%02d'));
        filename = ['.\ans(a)-i\' num '.bmp'];
        imwrite(img, filename);
    end
end