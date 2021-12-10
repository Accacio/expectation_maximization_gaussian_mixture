clear;close all;

PI=pi;
emMaxIter=70;
N=500;
M=3;
colors={'b','g','r'};

%% Generate and plot data
[pi,mu,Sigma,z,x]=generate_data(N,2);

figure(1)
subplot(2,1,1)
cla
hold on
for i=1:M
    z_i=find(z==i);
    x_i=x(:,z_i);
    scatter(x_i(1,:),x_i(2,:),10,colors{i})
end

% Plot gaussians for comparison
for i=1:M
    plot_gaussian(mu(:,i),Sigma(:,:,i),colors{i})
end
title("Ground Truth")
hold off

%% Initialize estimated parameters

% Initalize uniform prior 1/M
pi_hat=repmat(1/M,1,M);
mu_hat=randn(2,3);
Sigma_hat(:,:,1:3)=repmat(eye(2),1,1,3);

% getxz % set x and z equal to python code

%% EM Algo
for emInd=1:emMaxIter
    % Calculate the responsabilites
    responsabilities=calculate_responsabilities(x,mu_hat,Sigma_hat,pi_hat);

    % Plot based on responsabilites
    figure(1)
    subplot(2,1,2)
    cla
    plot_responsibles(x, responsabilities, mu_hat, Sigma_hat, pi,colors)
    title("EM")

    % Update parameters
    [mu_hat, Sigma_hat, pi_hat] = update_parameters(x, responsabilities, mu_hat, Sigma_hat, pi_hat);
    for i=1:M
    if ~isempty(find(eig(Sigma_hat(:,:,i))<=0))
      Sigma_hat(:,:,i)=eye(2);
    end
    end
    % Calculate Log-marginal likelihood
    LML(:,emInd)=calculate_LML(x,mu_hat,Sigma_hat,pi_hat);
end

figure(1)
subplot(2,1,2)
cla
plot_responsibles(x, responsabilities, mu_hat, Sigma_hat, pi,colors)
title("EM")

%% Analyses
figure(3)
plot(1:emMaxIter,LML)
title("log-marginal likelihood")

[~,z_hat]=max(responsabilities,[],1);
% Find the respective gaussian using the mean
[~, idx] = min(sum((reshape(repmat(mu_hat,3,1),2,3,3)-mu).^2));
for i=1:M
  z_hat_mod(find(z_hat==i))=idx(i);
end

display(['Correctly estimated z: ' num2str(sum(z_hat_mod==z)/N*100) '%'])
