function [re,ham]=hsegap(a,mu,delta,vz,alpha_R,gamma,vc,omega,n,beta,dim,randlist)
t=25/a^2;
sx=[0,1;1,0];
sy=[0,-1i;1i,0];
sz=[1,0;0,-1];
alpha=alpha_R/(2*a);
band11sm=(spdiags([ones(dim,1) ones(dim,1)],[-1,1],dim,dim));
band1m1sm=(spdiags([ones(dim,1) -ones(dim,1)],[-1,1],dim,dim));
eyesm=speye(dim);
eye4sm=speye(4*dim);

deltalist=randlist*(sqrt(1-(vz/vc)^2))*(vz<vc);

ham=kron(sz,(kron(eye(2),-t*band11sm+(2*t-mu)*eyesm)+kron(sy,1i*alpha*band1m1sm)))+kron(speye(2),kron(sz,vz*eyesm))...
    -gamma*(kron(speye(4),spdiags(omega./sqrt(deltalist.^2-omega^2-sign(omega+1e-9)*1e-9i),0,dim,dim))+kron(sx,kron(speye(2),spdiags(deltalist./sqrt(deltalist.^2-omega^2-sign(omega+1e-9)*1e-9i),0,dim,dim))));
%  try 
%        eigo=eigs(ham,10,'SM','Tolerance',1e-6,'MaxIterations',10000);  
%        eigo=eigo(eigo>0);
%         if (length(eigo)<n)
%             disp("Here goes 1");
%             error("1 is not enough");
%         end
%    catch            
%        try 
%            eigo=eigs(ham,20,'SM','Tolerance',1e-6,'MaxIterations',10000);
%            eigo=eigo(eigo>0);
%             if (length(eigo)<n)
%                  disp("Here goes 20");
%                  error("20 is not enough");
%             end
%        catch
%            eigo=eigs(ham,40,'SM','Tolerance',1e-6,'MaxIterations',10000);
%            eigo=eigo(eigo>0);
%             if (length(eigo)<n)
%                 disp("Here goes 40");
%                 error("40 is not enough");
%             end
%        end
%  end
% re=(eigo(n)+beta*omega)/(beta+1);
re=0;
end