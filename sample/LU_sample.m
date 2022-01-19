function [L,U,P,sg] = LU( A )

  [r,c] = size( A );
  P = eye(r,r);
  L = zeros(r,r);
  U = A;
  sg = 1;

  for i=1:r-1

    % search max pivot
    maxval = abs( U(i,i) );
    maxpos = i;
    for j=i+1:r
      % i��ɂ����āAi�s�ȍ~�Ő�Βl���ő�̏ꏊ��T���A
      % ���̃C���f�b�N�X�� maxpos �Ɋi�[

    end

    % row exchange
    if( maxpos ~= i )
      % U, P, L �̂��ꂼ��ŁA����̍s����
      % sg �̕����𔽓]
    end

    % elimination
    pivot = U(i,i);
    if( abs( pivot ) < 0.0000000000000001 )
      return;
    end

    for j=i+1:r
      L(j,i) = U(j,i) / pivot;
      U(j,:) = U(j,:) - L(j,i) * U(i,:);
    end

  end
  % �s�����̂Ƃ��Ɏז��ɂȂ�̂ŁAL �̑Ίp�v�f(1)��
  % �Ō�ɕt������B(P�̍s�������H�v����΁A�ŏ�����
  % �Ίp�v�f��1�����Ă������Ƃ��\)
  L = L + eye(r,r);
  
end
