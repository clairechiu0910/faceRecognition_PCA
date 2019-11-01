function projectTestImage(TestImage, TrainImage, vectors, h, w)
    for p = 1:100
        randNum = rand()*1000;
        randNum = uint8(mod(randNum, 13)) + 14;
        randImg = TestImage(:, (p-1)*13 + randNum);

        d = [1 5 9];
         for t = 1:size(d, 2)
            d_vectors = vectors(:, 1:d(t));
            projData = randImg.' * d_vectors;

            projFace = zeros(h*w, 1);
            for i=1:size(projData, 2)
                tmp = d_vectors(:, i) * projData(i);
                projFace = projFace + tmp;
            end
            
            projFace = projFace + mean(TrainImage.').';
            projFace = reshape(projFace, h, w);
            projFace = mat2gray(projFace);

            if p <= 50
                gender = 'm';
            else
                gender = 'w';
            end
            if p >= 100
                personNum = convertStringsToChars(num2str(p, '%04d'));
            else
                personNum = convertStringsToChars(num2str(p, '%03d'));
            end

            num = convertStringsToChars(num2str(d(t), '%02d'));
            filename = ['.\ans(a)-ii\' gender '-' personNum '-' num '.bmp'];
            imwrite(projFace, filename);
         end
    end
end
