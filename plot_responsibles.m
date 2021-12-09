function plot_responsibles(x, responsabilities, mu, Sigma, pi,colors)
% PLOT_RESPONSIBLES -
  [~,z_hat]=max(responsabilities,[],1);
  N=size(x,2);
  M=size(mu,2);
  for i=1:M
    plot_gaussian(mu(:,i),Sigma(:,:,i),colors{i})
  end
  hold on
  for i=1:3
    z_i=find(z_hat==i);
    x_i=x(:,z_i);
    scatter(x_i(1,:),x_i(2,:),10,colors{i})
  end
  hold off
end
