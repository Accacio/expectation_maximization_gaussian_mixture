% clear;close all;

% Generate and plot data
[prob,mu,sigma,z,x]=generate_data(500,2);
scatter(x(1,:),x(2,:),10)

% Plot gaussians for comparison
hold on
plot_gaussian(mu(:,1),sigma(:,:,1),'b')
plot_gaussian(mu(:,2),sigma(:,:,2),'g')
plot_gaussian(mu(:,3),sigma(:,:,3),'r')
title("Ground Truth")
ylim([1 7.5])
xlim([0.1 7.5])
hold off
