y=@(t)((10+t^2)*e^(-t)/(t+1));
y_prime=@(t,y)((2*t*e^-t-(t+2)*y) / (t+1));

GE_HE = []; GE_RK = []; H = []; Y = [];
x_0 = 0; x_f = 5; ya = 10;
rk4_solved = false; he_solved = false;

for r=1:8
  N = 2^r;
  H = [H; x_f/N];
  
  [T_1,X_1]=rk4p(y_prime,x_0,x_f,ya,N,[]);
  [T_2,X_2]=heunp(y_prime,x_0,x_f,ya,N,[]);
  
  printf("h: %f, y(T) con RK4: %.5f, y(T) con HEUN: %.5f\n", H(r,:), X_1(end), X_2(end));
  
  GE_RK = [GE_RK;abs(X_1(end) - y(x_f))];
  GE_HE = [GE_HE;abs(X_2(end) - y(x_f))];
 
  if (r == 7) % aca ponemos el valor para ver cómo se comporta f en función de la aproximación
    t = x_0:H(end):x_f;
    F =[];
    for i=t
      F=[F;y(i)];
    end
    plot(t, X_1(:, 1), "og;RK4;", t, X_2(:,1), "xb;HEUN;", t, F(:,1), "-r;Y;");
  end
  
  if ( abs(X_1(end) - y(x_f)) < 10^-4 && rk4_solved == false)
      printf("En la iteracion %d, RK4 tuvo error aceptable \n", r);
      rk4_solved = true;
  end
  if ( abs(X_2(end) - y(x_f)) < 10^-4 && he_solved == false)
      printf("En la iteracion %d, HEUN tuvo error aceptable \n", r);
      he_solved = true;
  end  
end

[H, GE_RK, GE_HE]