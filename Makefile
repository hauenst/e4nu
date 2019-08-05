ROOTCFLAGS  := $(shell root-config --cflags)
ROOTLDFLAGS := $(shell root-config --ldflags)
ROOTLIBS    := $(shell root-config --libs) -lEG
ROOTGLIBS   := $(shell root-config --glibs)

INCLUDES    := -I../include

CXX       := g++
CXXFLAGS  += -std=c++11 -Wall -fPIC $(ROOTCFLAGS)
LD        := g++
LDFLAGS   := $(ROOTLDFLAGS)

OBJECTS   := e2a_ep_neutrino6_united4_radphot.o run_e2a_ep_neutrino6_united4_radphot.o

all: run_e2a_ep

run_e2a_ep: $(OBJECTS)
	$(CXX) -o run_e2a_ep $(OBJECTS) $(ROOTCFLAGS) $(ROOTLDFLAGS) $(ROOTLIBS)

clean:
	@echo 'Removing all build files'
	@rm -rf *.o run_e2a_ep *~

%.o: %.C
	$(CXX) -c $< -O2 $(ROOTCFLAGS) $(INCLUDES)
