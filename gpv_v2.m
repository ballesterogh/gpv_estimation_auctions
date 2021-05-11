%Gonzalo Ballestero Septiembre-2020
%Universidad de San Andrés
%Examen de Empirical IO

%Atención: Cargar la base de datos para ejecutar el código
%% Inferir las valuaciones privadas por el método GPV
% Definición de variables
a = [Bidder1; Bidder2];
a = sort(a) ;
b = sort(a);
r = [];

% Calcula el cociente entre la distribución y la densidad de las ofertas observadas
for i = 1:length(b)
     r(end+1) = ksdensity(b,b(i),'Support','positive','Function','cdf')/ksdensity(b, b(i));
end

%Recupera las pseudo-valuaciones privadas
v = [];
for i = 1:length(b)
    v(end+1) = b(i)+r(i);
end
%% Graficar densidad de las pseudo-valuaciones privadas
[F,vi] = ksdensity(v);
plot(vi,F, 'LineWidth',2); 
xlabel('Valuación privada');
ylabel('Función de densidad de probabilidad');
legend('Distribución de las valuaciones privadas','Location','northwest');
