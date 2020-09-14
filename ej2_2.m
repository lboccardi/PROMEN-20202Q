h = 0.01; t = 0:h:10;

Y0 = [ 1.01, 1.01 ];

function resp = f (x, t)
  a = 3; b = 3;
  resp = zeros (2,1);
  resp(1) = 1-(b+1)*x(1)+a*(x(1).^2)*x(2);
  resp(2) = b*x(1) - a*(x(1).^2)*x(2);
endfunction

Y = lsode('f',Y0,t);

plot(t, Y(:,1), 'b;x(t);',t, Y(:,2), 'r;y(t);');
xlabel("Valor del tiempo t");
ylabel("Valor de la aproximacion");

plot(Y(:,1), Y(:,2), 'g;y(x);');
xlabel("Valor de la coordenada x");
ylabel("Valor de la coordenada y");
