% y=@(t)((10+t^2)*e^(-t)/(t+1));
% y_prime=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));

f=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));
H=[];F=[]; ER = [];
y0=10; x_0 = 0; x_f = 5;
finished = false;
for k=1:8;
  N=2^k;
  H=[H;x_f/N];
  [t,y]=rk4p(f,x_0,x_f,y0,N,[]);
  [t,y1]=rk4p(f,x_f,x_0,y(end),N,[]);
  
  F=[F;y1(end)];
  
  ER = [ER; abs(F(end)-y0)];
  if (ER(end) < 10^-6 && finished == false)
  printf("En la iteracion %d el error relativo fue de %d \n", k, ER(end));
  finished = true;
  end
end

[ H, F, ER ]