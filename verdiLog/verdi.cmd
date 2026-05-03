simSetSimulator "-vcssv" -exec "/home/st104/HW4/simv" -args
debImport "-dbdir" "/home/st104/HW4/simv.daidir"
debLoadSimResult /home/st104/HW4/waves.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.intf.DUT" -win $_nTrace1
srcSetScope "top.intf.DUT" -delim "." -win $_nTrace1
srcHBSelect "top.intf.DUT" -win $_nTrace1
srcSignalViewSelect "top.intf.DUT.write"
verdiSetActWin -dock widgetDock_<Signal_List>
srcSignalViewSelect "top.intf.DUT.clk"
srcSignalViewSelect "top.intf.DUT.clk"
srcSignalViewSelect "top.intf.DUT.clk" "top.intf.DUT.write" "top.intf.DUT.read" \
           "top.intf.DUT.data_in\[7:0\]" "top.intf.DUT.address\[15:0\]" \
           "top.intf.DUT.data_out\[8:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
