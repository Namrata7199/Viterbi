%%convolutional coding (2, 1, 9)
A = [0 0 0 0 0 0 0 0 0];        % buffer of length 9
B = [1 0 1 1];                  % chosen dataword = 1011
for i=1:4
    bit = B(5-i);
    A = [bit, A(1 : end-1)];        
    codeword(i, 1) = xor(xor(xor(xor(A(1), A(2)), A(4)), A(5)), A(6));   
    codeword(i, 2) = xor(xor(xor(xor(A(1), A(2)), A(3)), A(5)), A(6)); 
end
%codeword
%codeword=[1 1;0 0;1 0;0 0;];
codew=codeword;
dataword=decoding(codeword);    % function decoding() called

disp(dataword);
disp(path);
correct=0;
detect=0;
n=0;
for i=1:4   %one bit error
    for j=1:2
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
        dataw=decoding(codew);
        disp(path);
        disp(dataw);
        if(path~=0) %detected
            if(dataw==dataword) %corrected
                correct=correct+1;
                detect=detect+1;
            end
        end
        if(path~=0) %detected
            if(dataw~=dataword) %not corrected
                detect=detect+1;
            end
        end
        n=n+1;
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
    end
end
percentc1=correct*100/n;    %percent error corrected
percentd1=detect*100/n;     %percent error detected
correct=0;
detect=0;
n=0;
for i=1:4   %two bit error detection and correction
    for j=1:2
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
        for k=1:4
            for l=1:2
                if(codew(k,l))
                    codew(k,l)=0;
                else
                    codew(k,l)=1;
                end
                dataw=decoding(codew);
                if(path~=0)
                    if(dataw==dataword)
                        correct=correct+1;
                        detect=detect+1;
                    end
                end
                if(path~=0)
                    if(dataw~=dataword)
                        detect=detect+1;
                    end
                end
                n=n+1;
                if(codew(k,l))
                    codew(k,l)=0;
                else
                    codew(k,l)=1;
                end
            end
        end
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
    end
end
percentc2=correct*100/n;
percentd2=detect*100/n;
correct=0;
detect=0;
n=0;
for i=1:4   %three bit error correction and detection
    for j=1:2
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
        for k=1:4
            for l=1:2
                if(codew(k,l))
                    codew(k,l)=0;
                else
                    codew(k,l)=1;
                end
                for x=1:4
                    for y=1:2
                        if(codew(x,y))
                            codew(x,y)=0;
                        else
                            codew(x,y)=1;
                        end
                        dataw=decoding(codew);
                        if(path~=0)
                            if(dataw==dataword)
                                correct=correct+1;
                                detect=detect+1;
                            end
                        end
                        if(path~=0)
                            if(dataw~=dataword)
                                detect=detect+1;
                            end
                        end
                        n=n+1;
                        if(codew(x,y))
                            codew(x,y)=0;
                        else
                            codew(x,y)=1;
                        end
                    end
                end
                if(codew(k,l))
                    codew(k,l)=0;
                else
                    codew(k,l)=1;
                end
            end
        end
        if(codew(i,j))
            codew(i,j)=0;
        else
            codew(i,j)=1;
        end
    end
end
percentc3=correct*100/n;
percentd3=detect*100/n;

x = [1:3];      %% # of bit errors
y = [percentc1, percentc2, percentc3];    %% percentage error correction in each case
z = [percentd1, percentd2, percentd3];
%%plot(x, y, 'b', x, z, 'r'), legend('Percentage Error Correction', 'Percentage Error Detection')
plot(x, y, 'b'), xlabel('No. of erroneous bits'), ylabel('Percentage Error Correction'), title('Bit Error v/s Percentage Correction'), grid on
plot(x, z, 'r'), xlabel('No. of erroneous bits'), ylabel('Percentage Error Detection'), title('Bit Error v/s Percentage Detection'), grid on