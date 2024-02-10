let bimap f g (x, y) = (f x, g y)
let first f = bimap f Fun.id
let second g = bimap Fun.id g
