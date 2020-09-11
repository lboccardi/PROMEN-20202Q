y=@(t)((10+t^2)*e^(-t)/(t+1));
y_prime=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));

for r=1:8
  x_0 = 0;
  x_f = 5;
  ya = 10;
  N = 2^r;
  
  H(r) = x_f/N;
  
  [T_1,X_1]=rk4_orig(y_prime,x_0,x_f,ya,N);
  RK(r) = X_1(end);
  
  [T_2,X_2]=heun_orig(y_prime,x_0,x_f,ya,N);
  HE(r) = X_2(end);
  
  printf("h: %f, y(T) con RK4: %.5f, y(T) con HEUN: %.5f\n", H(r), RK(r), HE(r));
  printf("RK4 relative error is: %d \n", abs(RK(r) - y(x_f)));
  printf("HEUN relative error is: %d \n", abs(HE(r) - y(x_f)));
  if ( abs(RK(r) - y(x_f)) < 10^-4)
      printf("En la iteracion %d, RK4 tuvo error aceptable \n", r);
  end
  if ( abs(HE(r) - y(x_f)) < 10^-4)
      printf("En la iteracion %d, HEUN tuvo error aceptable \n", r);
  end
  printf("\n\n");
  
end
