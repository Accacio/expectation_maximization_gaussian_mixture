function LML = calculate_LML(x,mu,Sigma,pi)
% CALCULATE_LML - Calculate log marginal likelihood for gaussian mixture
%
% Calculate LML
  LML=0;
  N=size(x,2);
  M=size(mu,2);
  LMLtemp=zeros(N,1);
  for i=1:M
    LMLtemp=LMLtemp+pi(i)*mvnpdf(x',mu(:,i)',Sigma(:,:,i));
  end
  LML= mean(reallog(LMLtemp));

end
