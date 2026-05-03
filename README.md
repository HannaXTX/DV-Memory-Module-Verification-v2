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
