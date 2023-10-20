EuclidsAlgorithm: EuclidsAlgorithm.o
	ld -o EuclidsAlgorithm EuclidsAlgorithm.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

EuclidsAlgorithm.o: EuclidsAlgorithm.s
	as -arch arm64 -o EuclidsAlgorithm.o EuclidsAlgorithm.s
