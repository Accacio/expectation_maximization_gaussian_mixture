function responsabilities = calculate_responsabilities(x, mu, Sigma, pi)
% CALCULATE_RESPONSABILITIES -

  M=size(mu,2);
  N=size(x,2);
  respNum=zeros(size(x,2),M);
  for i=1:M
    likelihood=mvnpdf(x',mu(:,i)',Sigma(:,:,i));
    prior=pi(i);
    respNum(:,i)=prior*likelihood;
  end
  normalizing_constant=sum(respNum,2);
  rate=(respNum./normalizing_constant)';
  responsabilities = rate;
end
