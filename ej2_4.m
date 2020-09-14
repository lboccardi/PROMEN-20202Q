brus = @(t,X,P) [ 1-(P(2)+1)*X(1)+P(1)*(X(1)^2)*X(2) , P(2)*X(1) - P(1)*(X(1)^2).*X(2)  ];

x_0 = 0;
x_f = 100;
h = 0.01;
M = x_f/h;

a = 1; b = 3;

[T0 Y] = rk4p(brus, x_0, x_f,[ 1.001,1.001], M, [a,b]);


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

periodo(Y(:,1),h)

