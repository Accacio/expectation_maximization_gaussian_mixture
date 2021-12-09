function [prob, mean, covar, z, x] = generate_data(N, D)
% GENERATE_DATA - generate Bayes Adventures data
%   [PROB, MEAN, COVAR, Z, X] = GENERATE_DATA(N, D) 
%


  M=3;
  prob = repmat(1/M,1,M);

  mean = [[2; 5],[4; 4],[5.5; 4]];

  covar(:,:,1) = [0.2, -0.25; -0.25, 1];
  covar(:,:,2) = [0.5, 0.3;0.3, 1];
  covar(:,:,3) = [0.3, -0.2;-0.2, 0.5];

  z=zeros(1,N);
  x=zeros(D,N);

  z(1:N)=(mod(find(mnrnd(1,prob,N)')-1,3)+1)';
  for i=1:N
    x(:,i) = mvnrnd(mean(:,z(i))',covar(:,:,z(i)),1)';
  end
  

end
