h = 0.01;
t = 0:h:100;

Y = [ 1.01, 1.01 ];


function xdot = f (x, t)
  a = 1; b = 3;
  xdot = zeros (2,1);
  xdot(1) = 1-(b+1)*x(1)+a*(x(1)^2)*x(2);
  xdot(2) = b*x(1) - a*(x(1)^2)*x(2);
endfunction

y = lsode('f',Y,t);

[y(:,1)(end), y(:,2)(end)]

% plot(t, y)

 plot(y(:,1), y(:,2), 'g');

function p = periodo(r,h)
% r es un vector con las posiciones y
% h es el paso de tiempo entre valores de r
T=[];r = r-mean(r);
for k = 1:length(r)-1
if r(k+1)*r(k)<0
T = [T;k*h];
end
end
T=T(1:2:end);
p=mean(diff(T));
endfunction

periodo(y(:,1),h)

