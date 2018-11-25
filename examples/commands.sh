#com.jg.spongeminds.preschooldemo 
1
monkey -p com.jg.spongeminds.preschooldemo -v 1050 -s 42 ;
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv
-e L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-store-misses,L1-icache-loads 
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set1.csv
2
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo --csv
 -e L1-icache-load-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses  
 --duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set2.csv
3
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo --csv 
-e dTLB-load-misses,dTLB-store-misses,iTLB-load-misses,iTLB-store-misses,branch-loads 
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set3.csv
4
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e branch-load-misses,branch-stores,branch-store-misses,cpu-cycles,instructions  
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set4.csv
5
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e cache-references,cache-misses,branch-instructions,branch-misses,bus-cycles 
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set5.csv
6
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e raw-l1-icache-refill,raw-l1-dcache-refill,raw-l1-dcache,raw-l1-dtlb-refill,raw-load-retired  
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set6.csv
7
monkey -p com.jg.spongeminds.preschooldemo   -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo --csv 
-e raw-store-retired,raw-instruction-retired,raw-exception-taken,raw-exception-return,raw-pc-write-retired  
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set7.csv
8
monkey -p com.jg.spongeminds.preschooldemo  -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e raw-br-immed-retired,raw-unaligned-ldst-retired,raw-br-mis-pred,raw-cpu-cycles,raw-br-pred  
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set8.csv
9
monkey -p com.jg.spongeminds.preschooldemo -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e raw-mem-access,raw-l1-icache,raw-l1-dcache-wb,raw-l2-dcache,raw-l2-dcache-refill 
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set9.csv
10
monkey -p com.jg.spongeminds.preschooldemo -v 1050 -s 42 ; 
./simpleperf stat --app com.jg.spongeminds.preschooldemo  --csv 
-e raw-l2-dcache-wb,raw-bus-access,raw-bus-cycles 
--duration 30 --interval 50 -o test/com.jg.spongeminds.preschooldemo_set10.csv
