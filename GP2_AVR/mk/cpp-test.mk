TSTSRCS	:= $(shell python $(MK)/pyfind.py tests .cpp)
TSTOBJS	:= $(TSTSRCS:.cpp=.o)
DOBJS	+= $(TSTOBJS)
TSTOBJS	:= $(filter-out test_main.o, $(TSTOBJS))

TSTTGT	:= testapp$(EXT)

.PHONY:	test
test:	$(TSTTGT)	## Run project unit tests using catch.hpp
	$(PREFIX)$(TSTTGT)

$(TSTTGT):  tests/src/test_main.o $(TSTOBJS) $(LIBDIR)/$(LIB)
	$(CXX) -o $@ $^ $(LFLAGS)
