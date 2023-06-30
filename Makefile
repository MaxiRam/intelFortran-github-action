.SUFFIXES:

# Set teh compiler
FC = ifort

# Compiler flags
FFLAGS = -O2

# Link with MKL libraries
LIBS  = -mkl

# Define directories

BASE = $(CURDIR)

TARGET = main.x

EXEC = $(BASE)/$(TARGET)
OBJD = $(BASE)/build
SRCD = $(BASE)/src

# Define variables containing the source files list
SOURCES = $(addprefix $(SRCD)/, main.f90) 
MODS    = $(addprefix $(SRCD)/, commonvars.f90)

OBJS    = $(SOURCES:.f90=.o)
MODOBJS = $(MODS:.f90=.o)

###############################################################
# Define rules for building each set of sources
all: $(MODOBJS) $(OBJS)
	@echo Building executable
	cd $(OBJD); $(FC) $(FFLAGS) $(LIBS) $(notdir $(OBJS)) $(notdir $(MODOBJS)) -o $(EXEC)
$(MODOBJS): %.o : %.f90
	@echo Building modules
	cd $(OBJD); $(FC) $(FFLAGS) -c -o $(notdir $@) $<
$(OBJS): %.o : %.f90
	@echo Building $*.o
	cd $(OBJD); $(FC) $(FFLAGS) -c -o $(notdir $@) $<

clean:
	rm -f $(OBJD)/*.o $(OBJD)/*.mod main.x

