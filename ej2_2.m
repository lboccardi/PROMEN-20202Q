h = 0.01;
t = 0:h:10;

Y = [ 1.01, 1.01 ];


function xdot = f (x, t)
  a = 3; b = 3;
  xdot = zeros (2,1);
  xdot(1) = 1-(b+1)*x(1)+a*(x(1).^2)*x(2);
  xdot(2) = b*x(1) - a*(x(1).^2)*x(2);
endfunction

y = lsode('f',Y,t);

plot(t, y)

plot(y(:,1), y(:,2), 'g');
