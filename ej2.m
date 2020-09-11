% y=@(t)((10+t^2)*e^(-t)/(t+1));
% y_prime=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));

f=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));
N=2;H=[];F=[];y0=10;

for k=1:8;
  [t,y]=rk4_orig(f,0,5,y0,N);
  [t,y1]=rk4_orig(f,5,0,y(end),N);
  H=[H;5/N];
  N=2*N;
  F=[F;y1(end)];
  printf("Para h: %.5f, F(0): %.5f\n",H(k), F(k));
  if (abs(F(k)-10) < 10^-6)
  printf("El error relativo fue de %d\n", abs(F(k)-10));
  end
 end;
