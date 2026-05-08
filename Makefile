# Makefile for Kalah Game

CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2 -g
LDFLAGS = -lncurses

TARGET = kalah
SOURCES = main.cpp kalah.cpp ui.cpp
OBJECTS = $(SOURCES:.cpp=.o)
HEADERS = kalah.h ui.h

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

help:
	@echo "Kalah Game - Build Instructions"
	@echo "================================"
	@echo ""
	@echo "Targets:"
	@echo "  make        - Build the game"
	@echo "  make clean  - Remove build files"
	@echo "  make run    - Build and run the game"
	@echo "  make help   - Show this help message"
	@echo ""
	@echo "Requirements:"
	@echo "  - g++ with C++17 support"
	@echo "  - ncurses library"
	@echo ""
	@echo "Install ncurses on:"
	@echo "  Ubuntu/Debian: sudo apt-get install libncurses5-dev"
	@echo "  Fedora/RHEL:   sudo yum install ncurses-devel"
	@echo "  macOS:         brew install ncurses"
