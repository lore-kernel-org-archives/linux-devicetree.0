From: Vasant Hegde <hegdevasant-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: 3.13.0-rc3 kernel : ERROR: Bad of_node_put()
Date: Fri, 13 Dec 2013 16:19:00 +0530
Message-ID: <52AAE61C.8060304@linux.vnet.ibm.com>
References: <52AAD091.4020604@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52AAD091.4020604-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

I observed "Bad of_node_put()" related traces on 3.13.0-rc3 kernel. Can you 
please look into below trace and help to fix this issue?


-Vasant


Call trace:
-----------

     0.671725] pci 0005:02:09.0: [10b5:8624] type 01 class 0x060400
[    0.671938] pci 0005:02:09.0: PME# supported from D0 D3hot D3cold
[    0.672029] pci 0005:01:00.0: PCI bridge to [bus 02-bf]
[    0.672098] pci 0005:01:00.0:   bridge window [io  0x2870000-0x288ffff]
[    0.672105] pci 0005:01:00.0:   bridge window [mem 0x3da080000000-0x3da083ffffff]
[    0.672119] pci 0005:01:00.0:   bridge window [mem
0x3da085000000-0x3da088ffffff 64bit pref]
[    0.672149] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0
[    0.672257] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.672363] Call Trace:
[    0.672385] [c000001ff5187260] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.672494] [c000001ff5187350] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.672587] [c000001ff51873d0] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.672694] [c000001ff5187460] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.672800] [c000001ff5187510] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.672907] [c000001ff51875b0] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.673013] [c000001ff5187680] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.673121] [c000001ff5187700] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.673231] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.673338] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.673445] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.673552] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.673659] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.673767] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.673856] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.673963] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.674045] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.674087] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.674154] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0
[    0.674204] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.674253] Call Trace:
[    0.674263] [c000001ff5187260] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.674313] [c000001ff5187350] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.674355] [c000001ff51873d0] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.674405] [c000001ff5187460] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.674455] [c000001ff5187510] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.674505] [c000001ff51875b0] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.674555] [c000001ff5187680] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.674605] [c000001ff5187700] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.674655] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.674705] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.674755] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.674805] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.674855] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.674904] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.674947] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.674997] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.675047] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.675089] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.675152] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0
[    0.675202] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.675251] Call Trace:
[    0.675260] [c000001ff5187260] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.675310] [c000001ff5187350] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.675352] [c000001ff51873d0] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.675403] [c000001ff5187460] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.675452] [c000001ff5187510] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.675502] [c000001ff51875b0] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.675552] [c000001ff5187680] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.675602] [c000001ff5187700] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.675652] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.675702] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.675752] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.675802] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.675855] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.675905] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.675947] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.675997] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.676048] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.676090] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.676287] pci 0005:02:04.0: PCI bridge to [bus 20-3f]
[    0.676484] pci 0005:02:05.0: PCI bridge to [bus 40-5f]
[    0.676523] pci 0005:02:05.0:   bridge window [io  0x2870000-0x287ffff]
[    0.676530] pci 0005:02:05.0:   bridge window [mem 0x3da080000000-0x3da080ffffff]
[    0.676543] pci 0005:02:05.0:   bridge window [mem
0x3da085000000-0x3da085ffffff 64bit pref]
[    0.676724] pci 0005:60:00.0: [1014:0339] type 00 class 0x010400
[    0.676767] pci 0005:60:00.0: reg 0x10: [mem 0x3da081000000-0x3da08103ffff 64bit]
[    0.676799] pci 0005:60:00.0: reg 0x18: [mem 0x3da086000000-0x3da086ffffff
64bit pref]
[    0.676859] pci 0005:60:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    0.676980] pci 0005:60:00.0: PME# supported from D0 D3hot D3cold
[    0.677063] pci 0005:02:06.0: PCI bridge to [bus 60-7f]
[    0.677107] pci 0005:02:06.0:   bridge window [mem 0x3da081000000-0x3da081ffffff]
[    0.677120] pci 0005:02:06.0:   bridge window [mem
0x3da086000000-0x3da087ffffff 64bit pref]
[    0.677315] pci 0005:80:00.0: [10b5:8112] type 01 class 0x060400
[    0.677584] pci 0005:80:00.0: supports D1
[    0.677585] pci 0005:80:00.0: PME# supported from D0 D1 D3hot
[    0.677677] pci 0005:02:08.0: PCI bridge to [bus 80-9f]
[    0.677722] pci 0005:02:08.0:   bridge window [mem 0x3da082000000-0x3da082ffffff]
[    0.677925] pci 0005:90:01.0: [1033:0035] type 00 class 0x0c0310
[    0.677979] pci 0005:90:01.0: reg 0x10: [mem 0x3da082000000-0x3da082000fff]
[    0.678237] pci 0005:90:01.0: supports D1 D2
[    0.678238] pci 0005:90:01.0: PME# supported from D0 D1 D2 D3hot
[    0.678347] pci 0005:90:01.1: [1033:0035] type 00 class 0x0c0310
[    0.678402] pci 0005:90:01.1: reg 0x10: [mem 0x3da082001000-0x3da082001fff]
[    0.678660] pci 0005:90:01.1: supports D1 D2
[    0.678661] pci 0005:90:01.1: PME# supported from D0 D1 D2 D3hot
[    0.678755] pci 0005:90:01.2: [1033:00e0] type 00 class 0x0c0320
[    0.678810] pci 0005:90:01.2: reg 0x10: [mem 0x3da082002000-0x3da0820020ff]
[    0.679067] pci 0005:90:01.2: supports D1 D2
[    0.679068] pci 0005:90:01.2: PME# supported from D0 D1 D2 D3hot
[    0.679134] pci 0005:80:00.0: PCI bridge to [bus 90-9f]
[    0.679177] pci 0005:80:00.0:   bridge window [mem 0x3da082000000-0x3da082ffffff]
[    0.679198] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0/pci@8/pci@0
[    0.679248] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.679297] Call Trace:
[    0.679307] [c000001ff5186f60] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.679358] [c000001ff5187050] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.679400] [c000001ff51870d0] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.679450] [c000001ff5187160] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.679500] [c000001ff5187210] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.679550] [c000001ff51872b0] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.679599] [c000001ff5187380] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.679649] [c000001ff5187400] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.679699] [c000001ff51874a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.679749] [c000001ff5187580] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.679799] [c000001ff5187620] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.679849] [c000001ff5187700] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.679899] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.679948] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.679998] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.680049] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.680098] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.680148] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.680190] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.680241] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.680323] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.680412] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.680746] pci 0005:a0:00.0: [14e4:1657] type 00 class 0x020000
[    0.680790] pci 0005:a0:00.0: reg 0x10: [mem 0x3da088200000-0x3da08820ffff
64bit pref]
[    0.680823] pci 0005:a0:00.0: reg 0x18: [mem 0x3da088210000-0x3da08821ffff
64bit pref]
[    0.680856] pci 0005:a0:00.0: reg 0x20: [mem 0x3da088220000-0x3da08822ffff
64bit pref]
[    0.680877] pci 0005:a0:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.681044] pci 0005:a0:00.0: PME# supported from D0 D3hot D3cold
[    0.681185] pci 0005:a0:00.1: [14e4:1657] type 00 class 0x020000
[    0.681229] pci 0005:a0:00.1: reg 0x10: [mem 0x3da088230000-0x3da08823ffff
64bit pref]
[    0.681262] pci 0005:a0:00.1: reg 0x18: [mem 0x3da088240000-0x3da08824ffff
64bit pref]
[    0.681295] pci 0005:a0:00.1: reg 0x20: [mem 0x3da088250000-0x3da08825ffff
64bit pref]
[    0.681317] pci 0005:a0:00.1: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.681483] pci 0005:a0:00.1: PME# supported from D0 D3hot D3cold
[    0.681602] pci 0005:a0:00.2: [14e4:1657] type 00 class 0x020000
[    0.681646] pci 0005:a0:00.2: reg 0x10: [mem 0x3da088260000-0x3da08826ffff
64bit pref]
[    0.681679] pci 0005:a0:00.2: reg 0x18: [mem 0x3da088270000-0x3da08827ffff
64bit pref]
[    0.681712] pci 0005:a0:00.2: reg 0x20: [mem 0x3da088280000-0x3da08828ffff
64bit pref]
[    0.681733] pci 0005:a0:00.2: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.681900] pci 0005:a0:00.2: PME# supported from D0 D3hot D3cold
[    0.682021] pci 0005:a0:00.3: [14e4:1657] type 00 class 0x020000
[    0.682064] pci 0005:a0:00.3: reg 0x10: [mem 0x3da088290000-0x3da08829ffff
64bit pref]
[    0.682098] pci 0005:a0:00.3: reg 0x18: [mem 0x3da0882a0000-0x3da0882affff
64bit pref]
[    0.682131] pci 0005:a0:00.3: reg 0x20: [mem 0x3da0882b0000-0x3da0882bffff
64bit pref]
[    0.682152] pci 0005:a0:00.3: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.682318] pci 0005:a0:00.3: PME# supported from D0 D3hot D3cold
[    0.682379] pci 0005:02:09.0: PCI bridge to [bus a0-bf]
[    0.682447] pci 0005:02:09.0:   bridge window [io  0x2880000-0x288ffff]
[    0.682454] pci 0005:02:09.0:   bridge window [mem 0x3da083000000-0x3da083ffffff]
[    0.682468] pci 0005:02:09.0:   bridge window [mem
0x3da088000000-0x3da088ffffff 64bit pref]
[    0.682476] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0/pci@9
[    0.682584] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.682690] Call Trace:
[    0.682709] [c000001ff51870e0] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.682815] [c000001ff51871d0] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.682905] [c000001ff5187250] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.683011] [c000001ff51872e0] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.683118] [c000001ff5187390] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.683225] [c000001ff5187430] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.683332] [c000001ff5187500] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.683438] [c000001ff5187580] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.683545] [c000001ff5187620] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.683652] [c000001ff5187700] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.683759] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.683865] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.683972] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.684079] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.684187] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.684293] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.684382] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.684489] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.684596] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.684685] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.684768] ERROR: Bad of_node_put() on
/io-hub@3efe00000000/pciex@3efe00080000/pci@0/pci@0/pci@9
[    0.684819] CPU: 60 PID: 1 Comm: swapper/60 Not tainted
3.13.0-rc3DUMP-00079-g4b406fe-dirty #6
[    0.684868] Call Trace:
[    0.684877] [c000001ff51870e0] [c000000000016080] .show_stack+0x170/0x290
(unreliable)
[    0.684927] [c000001ff51871d0] [c0000000008930b0] .dump_stack+0x88/0xb4
[    0.684969] [c000001ff5187250] [c00000000074ee58] .of_node_release+0xe8/0x100
[    0.685020] [c000001ff51872e0] [c000000000754f6c] .of_irq_parse_one+0xcc/0x1f0
[    0.685069] [c000001ff5187390] [c000000000756208] .of_irq_parse_pci+0x48/0x1e0
[    0.685119] [c000001ff5187430] [c00000000003f044]
.pcibios_setup_device+0x94/0x190
[    0.685169] [c000001ff5187500] [c000000000040770]
.pcibios_setup_bus_devices+0x50/0x80
[    0.685219] [c000001ff5187580] [c000000000489e84] .pci_scan_child_bus+0x134/0x150
[    0.685269] [c000001ff5187620] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.685319] [c000001ff5187700] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.685369] [c000001ff51877a0] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.685419] [c000001ff5187880] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.685468] [c000001ff5187920] [c00000000048995c] .pci_scan_bridge+0x24c/0x640
[    0.685518] [c000001ff5187a00] [c000000000489e24] .pci_scan_child_bus+0xd4/0x150
[    0.685568] [c000001ff5187aa0] [c000000000041310] .pcibios_scan_phb+0x270/0x310
[    0.685618] [c000001ff5187b60] [c000000000c0ecf0] .pcibios_init+0x7c/0xd4
[    0.685660] [c000001ff5187bf0] [c00000000000bcf4] .do_one_initcall+0x164/0x1c0
[    0.685710] [c000001ff5187ce0] [c000000000c048b4]
.kernel_init_freeable+0x25c/0x33c
[    0.685760] [c000001ff5187db0] [c00000000000c514] .kernel_init+0x24/0x170
[    0.685802] [c000001ff5187e30] [c00000000000a160]
.ret_from_kernel_thread+0x5c/0x7c
[    0.685932] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to bf
[    0.686242] pci 0000:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01]
add_size 10000
[    0.686246] pci 0000:00:00.0: res[7]=[io  0x10000-0xffff] get_res_add_size
add_size 10000
[    0.686248] pci 0000:00:00.0: BAR 8: assigned [mem 0x3da580000000-0x3da580ffffff]
[    0.686291] pci 0000:00:00.0: BAR 9: assigned [mem
0x3da581000000-0x3da581ffffff pref]
[    0.686333] pci 0000:00:00.0: BAR 7: assigned [io  0x20000-0x2ffff]
[    0.686367] pci 0000:01:00.0: BAR 2: assigned [mem
0x3da580000000-0x3da5807fffff 64bit]
[    0.686427] pci 0000:01:00.0: BAR 6: assigned [mem
0x3da581000000-0x3da58107ffff pref]
[    0.686470] pci 0000:01:00.0: BAR 0: assigned [mem
0x3da580800000-0x3da580800fff 64bit]
[    0.686530] pci 0000:01:00.0: BAR 4: assigned [mem
0x3da580801000-0x3da580801fff 64bit]
[    0.686590] pci 0000:00:00.0: PCI bridge to [bus 01]
[    0.686617] pci 0000:00:00.0:   bridge window [io  0x20000-0x2ffff]
[    0.686657] pci 0000:00:00.0:   bridge window [mem 0x3da580000000-0x3da580ffffff]
[    0.686704] pci 0000:00:00.0:   bridge window [mem
0x3da581000000-0x3da581ffffff pref]
[    0.686755] pci_bus 0000:00: resource 4 [io  0x10000-0x80ffff]
[    0.686756] pci_bus 0000:00: resource 5 [mem 0x3da580000000-0x3da5fffeffff]
[    0.686757] pci_bus 0000:01: resource 0 [io  0x20000-0x2ffff]
[    0.686758] pci_bus 0000:01: resource 1 [mem 0x3da580000000-0x3da580ffffff]
[    0.686759] pci_bus 0000:01: resource 2 [mem 0x3da581000000-0x3da581ffffff pref]
[    0.686777] pci 0001:00:00.0: BAR 8: assigned [mem 0x3da480000000-0x3da480ffffff]
[    0.686819] pci 0001:00:00.0: BAR 9: assigned [mem
0x3da481000000-0x3da481ffffff pref]
[    0.686860] pci 0001:00:00.0: BAR 7: assigned [io  0x830000-0x83ffff]
[    0.686895] pci 0001:01:00.0: BAR 6: assigned [mem
0x3da481000000-0x3da48103ffff pref]
[    0.686937] pci 0001:01:00.1: BAR 6: assigned [mem
0x3da481040000-0x3da48107ffff pref]
[    0.686979] pci 0001:01:00.0: BAR 2: assigned [mem
0x3da480000000-0x3da480003fff 64bit]
[    0.687038] pci 0001:01:00.1: BAR 2: assigned [mem
0x3da480004000-0x3da480007fff 64bit]
[    0.687098] pci 0001:01:00.0: BAR 0: assigned [mem
0x3da480008000-0x3da480008fff 64bit]
[    0.687158] pci 0001:01:00.1: BAR 0: assigned [mem
0x3da480009000-0x3da480009fff 64bit]
[    0.687218] pci 0001:01:00.0: BAR 4: assigned [io  0x830000-0x8300ff]
[    0.687257] pci 0001:01:00.1: BAR 4: assigned [io  0x830100-0x8301ff]
[    0.687296] pci 0001:00:00.0: PCI bridge to [bus 01]
[    0.687327] pci 0001:00:00.0:   bridge window [io  0x830000-0x83ffff]
[    0.687368] pci 0001:00:00.0:   bridge window [mem 0x3da480000000-0x3da480ffffff]
[    0.687413] pci 0001:00:00.0:   bridge window [mem
0x3da481000000-0x3da481ffffff pref]
[    0.687464] pci_bus 0001:00: resource 4 [io  0x820000-0x101ffff]
[    0.687465] pci_bus 0001:00: resource 5 [mem 0x3da480000000-0x3da4fffeffff]
[    0.687466] pci_bus 0001:01: resource 0 [io  0x830000-0x83ffff]
[    0.687467] pci_bus 0001:01: resource 1 [mem 0x3da480000000-0x3da480ffffff]
[    0.687468] pci_bus 0001:01: resource 2 [mem 0x3da481000000-0x3da481ffffff pref]
[    0.687486] pci 0002:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01]
add_size 10000
[    0.687487] pci 0002:00:00.0: bridge window [mem 0x01000000-0x00ffffff 64bit
pref] to [bus 01] add_size 1000000
[    0.687489] pci 0002:00:00.0: bridge window [mem 0x01000000-0x00ffffff] to
[bus 01] add_size 1000000
[    0.687490] pci 0002:00:00.0: res[8]=[mem 0x01000000-0x00ffffff]
get_res_add_size add_size 1000000
[    0.687492] pci 0002:00:00.0: res[9]=[mem 0x01000000-0x00ffffff 64bit pref]
get_res_add_size add_size 1000000


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
