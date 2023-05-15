A = input('Matriz de coeficientes A: ');
b = input('Vector de terminos independientes b: ');
N = length(b); %determina la dimensión de la matriz según la cantidad de datos ingresados

L = zeros(N,N); %inicializa la matriz L y U
U = zeros(N,N);

for a = 1:N % es un contador que va de 1 a N
    U(a,a) = 1;
end

L(:,1) = A(:,1); %cuando el : se encuentra en el primer término de la matriz significa "todo el renglón", recorre el renglón
U(1,:) = A(1,:)/L(1:1); % en esta posición significa "toda la columna", recorre la columna
for i = 2:N
    for k = i:N
        L(k,i)= A(k,i)-L(k,1:i-1)*U(1:i-1,i); % los contadores van asignando el número de "casilla" a utilizar
    end
    for j = i+1:N
        U(i,j) = (A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end

L,U %imprime las matrices
D = zeros(N,1);
D(1) = b(1)/L(1,1);

for k=2:N
    D(k) =(b(k) - L(k,1:k-1)*D(1:k-1))/L(k,k);
end
D

X = zeros(N,1);
X(N) = D(N)/U(N,N);

for k= N-1 : -1 : 1
    X(k) = D(k)-U(k,k+1:N)*X(k+1:N);
end
X
