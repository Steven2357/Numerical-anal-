clear;
n=60;%指定迭代次數
n1=zeros(n+1,1);


for i=0:n
    for j=0:i
        tmp=0;
        for k=0:j
            tmp=tmp+(-1)^k*nchoosek(j,k)*(16*(1/5)^(2*k+1)-4*(1/239)^(2*k+1))/(2*k+1);
        end
        n1(i+1)=n1(i+1)+tmp/2^(j+1);
    end
    fprintf("n1(%2.0f)=%1.13f\n",i,n1(i+1));
    fprintf("n=%2.0f DONE!\n",i);
end
pis=zeros(n+1,1);
for i=1:n+1
    pis(i)=pi;
end

n1=abs(n1-pis);

figure(1)
plot((1:n),log(n1(1:n))/log(10),'r-x','LineWidth',2);
hold on
legend({"trasheulertransform"})
xlabel('log N','FontSize',14)
ylabel('log error','FontSize',14)
grid on
hold off
