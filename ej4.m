y=@(t)((10+t^2)*e^(-t)/(t+1));
y_prime=@(y,t)((2*t*e^-t-(t+2)*y) / (t+1));

format long

y0 = 10;
iter = 0;
h=2.5;

finished = false;

while (finished == false)
  finished = true;
  aproximation = lsode(y_prime,y0,0:h:5);
  aux =1;
  for i=0:h:5
    if (abs(y(i)-aproximation(aux++)) > 10^-5)
      finished = false;
    end
  end
  aproximation
  h/=2;
  iter++;
end

printf("En la iteracion %d la aproximacion fue la correcta \n", iter-1);


