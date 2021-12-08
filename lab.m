clear;close all;

% Generate and plot data
[prob,mu,sigma,z,x]=generate_data(500,2);
figure(1)
hold on
colors={'b','g','r'};
for i=1:3
    z_i=find(z==i);
    x_i=x(:,z_i);
    scatter(x_i(1,:),x_i(2,:),10,colors{i})
end

% Plot gaussians for comparison
for i=1:3
    plot_gaussian(mu(:,i),sigma(:,:,i),colors{i})
end
title("Ground Truth")
ylim([1 7.5])
xlim([0.1 7.5])
hold off

figure(2)
hold on
for i=1:3
    z_i=find(z==i);
    x_i=x(:,z_i);
    scatter(x_i(1,:),x_i(2,:),10,colors{i})
end
hold off
