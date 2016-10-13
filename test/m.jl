macro test()
  return :(println("Test!"))
end

@test

macro twostep(arg)
  println("I execute at parse time. The argument is: ", arg)
  return :(println("I execute at runtime. The argument is: ", $arg))
end

@twostep 1,2,3

macro showarg(x)
  show(x)
end

@showarg(a)
@showarg(1 + 1)
@showarg(println("Yo!"))

macro assert(ex)
  return :( $ex ? nothing : throw(AssertionError($(string(ex)))) )
end

@assert 1 == 1.0 && @assert 1 == 2
