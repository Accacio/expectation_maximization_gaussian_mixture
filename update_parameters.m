function [mu_new, Sigma_new, pi_new] = update_parameters(x, responsabilities, mu, Sigma, pi)
% UPDATE_PARAMETERS -

  N=size(x,2);
  M=size(mu,2);
  N_k=sum(responsabilities,2);
  pi_new(:)=N_k/N;
  for i=1:M
    mu_new(:,i)=(sum(responsabilities(i,:).*x,2))/N_k(i);
    center_x=x-mu_new(:,i);
    Sigma_new(:,:,i)=(responsabilities(i,:).*center_x)*center_x'/N_k(i);
  end
end
