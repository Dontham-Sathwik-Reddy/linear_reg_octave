function [X_norm, mu, sigma] = featureNormalize(X)
mu = mean(X);
sigma = std(X);
X = (X - mu)./sigma;
X_norm = X;

end
