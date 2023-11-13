
emacs = emacs

.PHONY: test
test:
	emacs -Q -batch -L . -l ert -l ./test/macrostep-julia-tests.el \
	-f ert-run-tests-batch-and-exit
