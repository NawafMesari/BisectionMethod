clc
fprintf('>>> Bisection <<< \n');

fprintf(' instruction  to write the equations :\n ');
fprintf(' when you write a symbol in the equation like ( ^ , * , +  , / , - )\n ');
fprintf(' you must write dot ( . ) befor the symbol like (.*) or (./)\n');
fprintf(' -Example of equation ( x.^3.+4.*x.^2.-10 )\n');

Function = input ('Enter the equation\n' , 's');
f = inline (Function,'x');

A=input('Enter the START of the interval  a :');
B=input('Enter the END of the interval b :');

acc=input('Enter the TOL:');

while( (f(A)*f(B)) > 0)  
    fprintf('>>> NO Solution in this interval try again !!! <<< \n');
    A=input('Enter a :');
    B=input('Enter b :');
end

fprintf('__________________________________________________________________________________\n');
fprintf('         n      A          B         P       F(A)       F(P)    |Pn - Pn-1|  \n');
fprintf('__________________________________________________________________________________\n');
n=0;

while((abs(A-B)) > acc)
    
    P=(A+B)/2;
    
    disp([ n',A',B',P',f(A)',f(P)',(abs(A-P)/P)']);
    
    if((f(A)*f(P)) < 0)
        B=P;
    else
        A=P;
    end
    n=n+1;
    
end
fprintf('__________________________________________________________________________________\n');

y=linspace(A,B,100);

plot(y,f(y));
grid on

fprintf('-----------------------------------\n');
fprintf(' the Root =  %f',P);



