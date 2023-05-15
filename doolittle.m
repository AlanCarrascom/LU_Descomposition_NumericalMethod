A = input('Matriz de coeficientes: ');
B = input('Vector terminos independientes: ');
N=length(A);
L=zeros(N,N);
U=zeros(N,N);

for a = 1:N
    L(a,a) = 1;
end

U(1,:) = A(1,:);
L(:,1)=A(:,1)/U(1,1);

for i = 2:N
    for j = i:N
      U(i,j)=A(i,j)-L(i,1:i-1)*U(1:i-1,j);
    end

    for k = i+1:N
      L(k,i)=(A(k,i)-L(k,1:i-1)*U(1:i-1,i))/U(i,i);
    end
end

D=zeros(N,1);
D(1)=B(1)/L(1,1);

for k = 2:N
    D(k)=B(k)-L(k,1:k-1)*D(1:k-1);
end

X=zeros(N,1);
X(N)=D(N)/U(N,N);

for i = N-1 : -1 : 1
    X(i)=(D(i)-U(i,i+1:N)*X(i+1:N))/U(i,i);
end

L,U,D,X

