function plot_gaussian(mu,sigma,color)
% PLOT_GAUSSIAN -
  [w, v] = eig(sigma)

  % Define max and min diameters and radii
  diameters=2*sqrt(2)*sqrt(v)
  radii=diameters/2;

  % Define 0 centered ellipse points
  t=linspace(0,2*pi);
  x=radii*[cos(t);sin(t)];

  % Rotate using eigenvec
  x=w*x;

  % Translate using mean
  x=x+mu;

  patch(x(1,:),x(2,:),'g','FaceColor','none','EdgeColor',color);
end
