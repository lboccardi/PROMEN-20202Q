loglog(H(:,1), GE_RK(:, 1), ";Error-RK4;", H(:,1), GE_HE(:,1), ";Error-HEUN;");
xlabel ("Valor H del paso");
ylabel ("Error Global Absoluto en Y(T)");

printf("Aproximacion al orden en RK4 \n");
diff(log(GE_RK))./diff(log(H))

printf("Aproximacion al orden en HEUN \n");
diff(log(GE_HE))./diff(log(H))
