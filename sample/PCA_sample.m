function [P,c,a] = PCA( data )
  
% �f�[�^�T�C�Y�擾
[n,d] = size( data );
% ���U�����U�s��Z�o
cov_mat = cov( data );

% �X�y�N�g������
[P,L] = EIG( cov_mat );
% ��^���Z�o

% �ݐϊ�^���Z�o

end
