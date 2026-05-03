
Improvements from V1 : [DV-Memory-Module-Verification](https://github.com/HannaXTX/DV-Memory-Module-Verification)
+ Added interface-based connectivity
+ clocking blocks (posedge)
+ checker to prevent simultaneous read/write. 
+ Refactored testbench into program
+ OOP transaction package
+ task/queue-based generator, driver, monitor, and checker.

## Compilation & Simulation

Run the following commands:

```
vcs -full64 -sverilog -debug_access+all -kdb -l compile.log -f flist.f
./simv -l run.log
```

## View Waveforms (Verdi)

```
verdi -ssf waves.fsdb &
```
