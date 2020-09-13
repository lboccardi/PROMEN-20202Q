% cosas que varian para encontrar las soluciones
% hay que hacer variar h, el extremo final de t
% Y que es el vector de condiciones iniciales
% a y b que son constantes
% el primer plot muestra ambas f en función del tiempo
% el segundo, y en función de x

h = 0.01;
t = 0:h:20;

Y = [ 12, 20 ];


function xdot = f (x, t)
  a = 1; b = 1;
  xdot = zeros (2,1);
  xdot(1) = 1-(b+1)*x(1)+a*(x(1)^2)*x(2);
  xdot(2) = b*x(1) - a*(x(1)^2)*x(2);
endfunction

y = lsode('f',Y,t);

[y(:,1)(end), y(:,2)(end)]

plot(t, y)

% plot(y(:,1), y(:,2), 'g');