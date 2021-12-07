function plot_gaussian(mu,sigma,color)
% PLOT_GAUSSIAN -
%
  [w, v] = eig(sigma)
  v=2*sqrt(2)*sqrt(v)
  u = w;
  t=linspace(0,2*pi);
  x=v*[cos(t);sin(t)];
  angle=-atan2(w(1),w(2));
  x=[sin(angle) cos(angle);-cos(angle) sin(angle)]*x;
  x=x+mu;

  patch(x(1,:),x(2,:),'g','FaceColor','none','EdgeColor',color);
end
