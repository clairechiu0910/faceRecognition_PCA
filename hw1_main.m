clear;
tic

[TrainImage, TestImage, h, w] = readData();

vectors = computeEigenface(TrainImage, 20);
    
outputEigenfaces(vectors, h, w);
    
projectTestImage(TestImage, TrainImage, vectors, h, w);
    
%compute projData of train image and test image
d = [1:20];
reg = [];
for i = 1:size(d, 2)
    projDataTrain = TrainImage.' * vectors(:, 1:d(i));
    projDataTest = TestImage.' * vectors(:, 1:d(i));

    index = knnsearch(projDataTrain, projDataTest);
    reg = [reg index];
    regPer = uint8(ceil(reg / 13));
end

errorRate = computeErrorRate(regPer)
plot([1:size(errorRate, 2)], errorRate, '--*')
xlabel('d largest eigenvectors');
ylabel('error rate (%)');

fprintf('d = 1, error rate = %.2f%%\n', errorRate(1));
fprintf('d = 5, error rate = %.2f%%\n', errorRate(5));
fprintf('d = 9, error rate = %.2f%%\n', errorRate(9));

toc