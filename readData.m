function [TrainImage, TestImage, h, w] =  readData()
    %read train image
    %read test image
    TrainImage = [];
    TestImage = [];
    for p = 1:100
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
        
        floder = '.\AR_Train_image\';
        for i = 1:13
            num = convertStringsToChars(num2str(i, '%02d'));
            filename = [floder gender '-' personNum '-' num '.bmp'];
            image = imread(filename);
            image = rgb2gray(image);

            [h w] = size(image);
            image = reshape(image, h*w, 1);
            image = single(image);
            TrainImage = [TrainImage image];
        end
        
        floder = '.\AR_Test_image\';
        for i = 14:26
            num = convertStringsToChars(num2str(i, '%02d'));
            filename = [floder gender '-' personNum '-' num '.bmp'];
            image = imread(filename);
            image = rgb2gray(image);

            [h w] = size(image);
            image = reshape(image, h*w, 1);
            image = single(image);
            TestImage = [TestImage image];
        end
    end
end