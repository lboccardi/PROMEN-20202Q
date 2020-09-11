% ax = plotyy (H, GE_RK, H, GE_HE, @plot, @loglog);
ax = loglog(H, GE_RK, H, GE_HE);
xlabel ("H");
ylabel (ax(1),"Runge Kutta 4");
ylabel (ax(2),"Heun");