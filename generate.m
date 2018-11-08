a=1;
mu=0.2;
vzlist=linspace(0,0.6,10000);
delta=0.2;
alpha_R=5;
dim=300;
sp=zeros(length(vzlist),dim);
nv=6;
index=1;
parfor i=1:length(vzlist)
    vz=vzlist(i);
    wfabs=WF(a,mu,delta,vz,alpha_R,dim,index);
    sp(i,:)=wfabs.';
end
