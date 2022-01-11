module MatrixDepotTemplate

using LinearAlgebra
using MatrixDepot
using MatrixDepot: include_generator, FunctionName, Group, publish_user_generators

"""
random Orthogonal matrix
========================
*Input options:*
+ n: the dimension of the matrix
"""
randorth(n) = Matrix(qr(randn(n,n)).Q)

"""
random symmetric matrix
=======================
*Input options:* 
+ n: the dimension of the matrix
"""
function randsym(n)
    A = zeros(n, n)
    for j = 1:n
    for i = j:n
        A[i,j] = randn()
        if i != j; A[j,i] = A[i,j] end
    end
    end
    return A
end

function __init__()
    include_generator(FunctionName, "randsym", randsym)
    include_generator(FunctionName, "randorth", randorth)
    include_generator(Group, :symmetric, randsym)
    include_generator(Group, :random, randsym)
    publish_user_generators()
end

end
