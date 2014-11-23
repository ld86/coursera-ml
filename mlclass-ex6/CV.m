function _ = CV()

load('ex6data3.mat')

values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
for i = 1:size(values)
    for j = 1:size(values)
        sigma = values(i);
        C = values(j);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        m = mean(double(svmPredict(model, Xval) ~= yval));
        fprintf('%f %f %f\n', m, sigma, C);
    end
end

end
