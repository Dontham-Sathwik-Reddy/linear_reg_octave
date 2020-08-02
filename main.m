data = load('train8.txt');
X = data(:, 1:4);
y = data(:, 5);
m = length(y);

fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];

fprintf('Running gradient descent ...\n');

alpha = 0.001;
num_iters = 50000;

theta = zeros(5, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

%figure;
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

fprintf("Evaluating Test Data.......Please Wait\n");

test_X = load('test8.txt');

n=length(test_X);

filename = "text_solved.csv";
fid = fopen (filename, "w");

for i=1:n
price = 0;
temp = [1 test_X(i,1) test_X(i,2) test_X(i,3) test_X(i,4)];
temp(1,2) = (temp(1,2) - mu(1,1))/(sigma(1,1));
temp(1,3) = (temp(1,3) - mu(1,2))/(sigma(1,2));
temp(1,4) = (temp(1,4) - mu(1,3))/(sigma(1,3));
temp(1,5) = (temp(1,5) - mu(1,4))/(sigma(1,4));
price = temp * theta;
t=strcat(num2str(test_X(i,1)),",",num2str(test_X(i,2)),",",num2str(test_X(i,3)),",",num2str(test_X(i,4)),",",num2str(price),"\n");
fputs (fid,t);
end

fclose (fid);

fprintf("Test data is evaluated.\n");
