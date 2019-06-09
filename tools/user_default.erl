% For further information about the original skeleton template please visit https://github.com/Pouriya-Jahanbakhsh/estuff

-module(user_default).
-export([c/0, r/0, cr/0, cl/0, test/0]).


c() ->
    io:format(os:cmd("make compile")).


r() ->
    % If you have Erlang source files not just in "src", modify erlang_source_files/0
    Modules  = [module(X) || X <- erlang_source_files()],
    lists:foreach(fun reload/1, lists:sort(Modules)).

cr() ->
    c(),
    r().


cl() ->
    io:format("\033[2J\033[u").


test() ->
    io:format("Running ./test/shell_quick_test.script\n"),
    Result = file:script("./test/shell_quick_test.script"),
    io:nl(),
    Result.


erlang_source_files() ->
    SrcFiles = filelib:wildcard("**/*.erl", "src"),
    lists:filter(fun is_erlang_source_file/1, SrcFiles).


is_erlang_source_file(File) ->
    case filename:extension(File) of
        ".erl" ->
            true;
        _ ->
            false
    end.


module(File) ->
    % remove ".erl" from the end of file:
     erlang:list_to_atom(lists:reverse(lists:reverse(filename:basename(File)) -- "lre.")).


reload(Mod) ->
    io:format("Reloading ~tp\n", [Mod]),
    code:soft_purge(Mod),
    code:load_file(Mod).
