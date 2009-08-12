From: "Thirumalai" <thirumalai.p-0ZFwKFrCjf3djTIvvxD1Tp/QNRX+jHPU@public.gmane.org>
Subject: Regarding PCI Device tree binding
Date: Wed, 12 Aug 2009 19:05:58 +0530
Message-ID: <B28B5AD4F15643BAB9D73F5C658F0BE2@itd210>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
    I just want to know is there any changes has happened on pci device tree 
binding of powerpc. Because the device tree what ever i have used to boot 
the linux kernel 2.6.23 on my mpc7448 based custom board is not booting my 
latest linux kernel 2.6.30. Means the kernel is getting hanged at ethernet 
initialization. Also one more thing is the PCI MEM/IO space is getting 
assigned to my board. The debug message and my device tree is attached below 
for your reference.
   One thing i infered from the source code was the PCI implementation is 
now ported for 64bit implementation.


DP-0447> bootm 0x400000 - 0x4000000
## Booting kernel from Legacy Image at 00400000 ...
   Image Name:   Linux-2.6.30
   Created:      2009-08-04  14:20:46 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    1470650 Bytes =  1.4 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
WARNING: adjusting available memory to 10000000
## Flattened Device Tree blob at 04000000
   Booting using the fdt blob at 0x4000000
   Loading Device Tree to 007fc000, end 007ffdc2 ... OK
Using DPVME0447 machine description
Total memory = 512MB; using 1024kB for hash table (at cff00000)
Linux version 2.6.30 (root-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org) (gcc version 4.0.0 (DENX 
ELDK 4.1 4.0.0)) #60 Tue Aug 4 19:50:43 IST 2009
console [udbg0] enabled
setup_arch: bootmem
dpvme0447_setup_arch():set_bridge
Found tsi108 PCI host bridge at 0x50001000. Firmware bus number: 0->0
PCI host bridge /tsi108@50000000/pci@1000  ranges:
__________func 1 pci_space 2000000 pci_addr 0 cpu_addr e0000000 size 
ffffffff
__________func 1 pci_space 42000000 pci_addr 0 cpu_addr 80000000 size 
ffffffff
__________func 1 pci_space 1000000 pci_addr 0 cpu_addr 0 size ffffffff
__________after the while loop
tsi108: resources set
Datapatterns DPVME0447 Platform
Enabling L2 cache then enabling the HID0 prefetch engine.
arch: exit
Zone PFN ranges:
  DMA      0x00000000 -> 0x00020000
  Normal   0x00020000 -> 0x00020000
Movable zone start PFN for each node
early_node_map[1] active PFN ranges
    0: 0x00000000 -> 0x00020000
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 130048
Kernel command line: console=ttyS0,115200 root=/dev/nfs rw mem=512M 
nfsroot=10.5.18.3:/ppc/netfs/fc5fs-rfs 
ip=10.5.18.201:10.5.18.3:10.5.18.3:255.0.0.0:dpppc301::off
NR_IRQS:512
mpic: Setting up MPIC "Tsi108_PIC" version 1.2 at 50007400, max 4 CPUs
mpic: ISU size: 24, shift: 5, mask: 1f
mpic: Initializing for 24 sources
PID hash table entries: 2048 (order: 11, 8192 bytes)
clocksource: timebase mult[5fcef23] shift[22] registered
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 515200k/524288k available (2852k kernel code, 8640k reserved, 124k 
data, 86k bss, 160k init)
Kernel virtual memory layout:
  * 0xffffe000..0xfffff000  : fixmap
  * 0xfcfe1000..0xfe000000  : early ioremap
  * 0xe1000000..0xfcfe1000  : vmalloc & ioremap
SLUB: Genslabs=13, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Calibrating delay loop... 83.45 BogoMIPS (lpj=166912)
Mount-cache hash table entries: 512
net_namespace: 520 bytes
NET: Registered protocol family 16

PCI: Probing PCI hardware
PCI: I/O resource not set for host bridge /tsi108@50000000/pci@1000 (domain 
0)
PCI: Memory resource 0 not set for host bridge /tsi108@50000000/pci@1000 
(domain 0)
bio: create slab <bio-0> at 0
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
TCP established hash table entries: 65536 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 65536 bind 65536)
TCP reno registered
NET: Registered protocol family 1
msgmni has been set to 1007
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
Generic RTC Driver v1.07
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0x50007808 (irq = 18) is a 16550A
console handover: boot [udbg0] -> real [ttyS0]
serial8250.0: ttyS1 at MMIO 0x50007c08 (irq = 19) is a 16550A
brd: module loaded
loop: module loaded
Driver 'sd' needs updating - please use bus_type methods
e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
e100: Copyright(c) 1999-2006 Intel Corporation
tsi108_eth0: probe...
eth0: Tsi108 Gigabit Ethernet, MAC: 00:08:2d:00:14:00
tsi108_eth1: probe...
eth1: Tsi108 Gigabit Ethernet, MAC: 00:08:2d:00:14:01
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
tsi108_open : Port 0 Assigned IRQ 16 to eth0
------------[ cut here ]------------
Kernel BUG at c019074c [verbose debug info unavailable]
Oops: Exception in kernel mode, sig: 5 [#1]
DPVME0447
NIP: c019074c LR: c019074c CTR: c014ea48
REGS: df82bd80 TRAP: 0700   Not tainted  (2.6.30)
MSR: 00029032 <EE,ME,CE,IR,DR>  CR: 24000022  XER: 20000000
TASK = df82c000[1] 'swapper' THREAD: df82a000
GPR00: c019074c df82be30 df82c000 00000030 000013e0 ffffffff c014e998 
00000035
GPR08: c02f2af0 c02e7bb8 000013e0 c02cd8f4 24000042 00000000 00000002 
00000000
GPR16: c02c0000 00000000 00000000 00000000 00000000 0ffaa41c c0300000 
00000004
GPR24: 00000000 00000000 c02f0000 c02f0000 df821030 00000000 df821000 
df821300
NIP [c019074c] tsi108_open+0x5c/0x90
LR [c019074c] tsi108_open+0x5c/0x90
Call Trace:
[df82be30] [c019074c] tsi108_open+0x5c/0x90 (unreliable)
[df82be50] [c01b1564] dev_open+0xac/0x11c
[df82be70] [c01b1464] dev_change_flags+0x160/0x1b4
[df82be90] [c02bc5f8] ip_auto_config+0x18c/0xe5c
[df82bf50] [c0003c8c] do_one_initcall+0x34/0x1a8
[df82bfd0] [c02a1848] kernel_init+0x9c/0x100
[df82bff0] [c0012064] kernel_thread+0x4c/0x68
Instruction dump:
807f003c 7fc8f378 4beb8d71 7c7d1b79 40820028 80bf003c 3c60c029 7fc6f378
386327c0 90be0028 809f0040 4be90669 <0fe00000> 48000000 80bf003c 3c60c029
---[ end trace dc633a1da0ecdafb ]---
Kernel panic - not syncing: Attempted to kill init!
Rebooting in 180 seconds..

Device tree
/ {
        model = "dpvme0447";
        compatible = "mpc74xx";
        #address-cells = <1>;
        #size-cells = <1>;

        aliases {
                ethernet0 = &enet0;
                ethernet1 = &enet1;

                serial0 = &serial0;
                serial1 = &serial1;

        };

        cpus {
                #address-cells = <1>;
                #size-cells =<0>;

                PowerPC,7448@0 {
                        device_type = "cpu";
                        reg = <0>;
                        d-cache-line-size = <0x20>;     // 32 bytes
                        i-cache-line-size = <0x20>;     // 32 bytes
                        d-cache-size = <0x8000>;                // L1, 32K
bytes
                        i-cache-size = <0x8000>;                // L1, 32K
bytes
                        timebase-frequency = <0>;       // 33 MHz, from
uboot
                        clock-frequency = <0>;          // From U-Boot
                        bus-frequency = <0>;            // From U-Boot
                        32-bit;
                };
        };

        memory {
                device_type = "memory";
                reg = <0x00000000 0x20000000    // DDR2   512M at 0
                       >;
        };

     tsi108@50000000 {
                #address-cells = <1>;
                #size-cells = <1>;
                device_type = "tsi-bridge";
                ranges = <0x00000000 0x50000000 0x00010000>;
                reg = <0x50000000 0x00010000>;
                assigned-addresses = <0>;
                bus-frequency = <0>;

                i2c@7000 {
                        interrupt-parent = <&mpic>;
                        interrupts = <0xE 0>;
                        reg = <0x7000 0x400>;
                        device_type = "i2c";
                        compatible  = "tsi108-i2c";
                };

                MDIO: mdio@6000 {
                        device_type = "mdio";
                        compatible = "tsi108-mdio";
                        reg = <0x6000 0x50>;
                        #address-cells = <1>;
                        #size-cells = <0>;

                        phy8: ethernet-phy@6000 {
                                interrupt-parent = <&mpic>;
                                interrupts = <2 1>;
                                reg = <8>;
                                device_type = "ethernet-phy";
                        };

                        phy9: ethernet-phy@6400 {
                                interrupt-parent = <&mpic>;
                                interrupts = <2 1>;
                                reg = <9>;
                                device_type = "ethernet-phy";
enet0: ethernet@6200 {
                        linux,network-index = <0>;
                        #size-cells = <0>;
                        device_type = "network";
                        compatible = "tsi108-ethernet";
                        reg = <0x6000 0x200>;
                        address = [ 00 06 D2 00 00 01 ];
                        interrupts = <0x10 2>;
                        interrupt-parent = <&mpic>;
                        mdio-handle = <&MDIO>;
                        phy-handle = <&phy8>;
                };

                enet1: ethernet@6600 {
                        linux,network-index = <1>;
                        #address-cells = <1>;
                        #size-cells = <0>;
                        device_type = "network";
                        compatible = "tsi108-ethernet";
                        reg = <0x6400 0x200>;
                        address = [ 00 06 D2 00 00 02 ];
                        interrupts = <0x11 2>;
                        interrupt-parent = <&mpic>;
                        mdio-handle = <&MDIO>;
                        phy-handle = <&phy9>;
                };

                serial0: serial@7808 {
                        device_type = "serial";
                        compatible = "ns16550";
                        reg = <0x7808 0x200>;
                        clock-frequency = <0x3f6b5a00>;
                        interrupts = <0xc 0>;
                        interrupt-parent = <&mpic>;
                };

                serial1: serial@7c08 {
                        device_type = "serial";
                        compatible = "ns16550";
                        reg = <0x7c08 0x200>;
                        clock-frequency = <0x3f6b5a00>;
                        interrupts = <0xd 0>;
                        interrupt-parent = <&mpic>;
                };
 mpic: pic@7400 {
                        clock-frequency = <0>;
                        interrupt-controller;
                        #address-cells = <0>;
                        #interrupt-cells = <2>;
                        reg = <0x7400 0x400>;
                        built-in;
                        compatible = "chrp,open-pic";
                        device_type = "open-pic";
                        big-endian;
                };
                pci@1000 {
                        device_type = "pci";
                        compatible = "tsi108-pci";
                        #interrupt-cells = <1>;
                        #size-cells = <2>;
                        #address-cells = <3>;
                        reg = <0x1000 0x1000>;
                        big-endian;
                        bus-range = <0x0 0xff>;
                        /* RANGE_TYPE UNKNOWN PCI_ADD PROC_ADDR UNKNOWN SIZE
                         02000000 - PCIMEM
                         42000000 - PCI-MEM-PREFETCH
                         01000000 - PCIIO
                        */
                        ranges = <0x02000000 0x0 0xe0000000 0xe0000000 0x0
0x10000000
                                  0x42000000 0x0 0x80000000 0x80000000 0x0
0x40000000
                                  0x01000000 0x0 0x00000000 0xf0000000 0x0
0x00010000>;
                        clock-frequency = <0x7f28154>;
                        interrupt-parent = <&mpic>;
                        interrupts = <0x17 2>;
                        interrupt-map-mask = <0xf800 0 0 7>;
                        interrupt-map = <

                                /* IDSEL 0x11 */
                                0x0800 0x0 0x0 0x1 &RT0 0x24 0x0
                                0x0800 0x0 0x0 0x2 &RT0 0x25 0x0
                                0x0800 0x0 0x0 0x3 &RT0 0x26 0x0
                                0x0800 0x0 0x0 0x4 &RT0 0x27 0x0

                                /* IDSEL 0x12 */
                                0x1000 0x0 0x0 0x1 &RT0 0x25 0x0
                                0x1000 0x0 0x0 0x2 &RT0 0x26 0x0
                                0x1000 0x0 0x0 0x3 &RT0 0x27 0x0
                                0x1000 0x0 0x0 0x4 &RT0 0x24 0x0

                                /* IDSEL 0x13 */
                                0x1800 0x0 0x0 0x1 &RT0 0x26 0x0
                                0x1800 0x0 0x0 0x2 &RT0 0x27 0x0
                                0x1800 0x0 0x0 0x3 &RT0 0x26 0x0
                                0x1800 0x0 0x0 0x4 &RT0 0x26 0x0

                                /* IDSEL 0x14 */
                                0x2000 0x0 0x0 0x1 &RT0 0x27 0x0
                                0x2000 0x0 0x0 0x2 &RT0 0x24 0x0
                                0x2000 0x0 0x0 0x3 &RT0 0x25 0x0
                                0x2000 0x0 0x0 0x4 &RT0 0x26 0x0
                                >;

                        RT0: router@1180 {
                                clock-frequency = <0>;
                                interrupt-controller;
                                device_type = "pic-router";
                                #address-cells = <0>;
                                #interrupt-cells = <2>;
                                built-in;
                                big-endian;
                                interrupts = <0x17 2>;
                                interrupt-parent = <&mpic>;
                        };
                };
        };
};

Regards,
T. 


**************** CAUTION - Disclaimer *****************This email may contain confidential and privileged material for the
sole use of the intended recipient(s). Any review, use, retention, distribution or disclosure by others is strictly prohibited. If you are not the intended recipient (or authorized to receive for the recipient), please contact the sender by reply email and delete all copies of this message. Also, email is susceptible to data corruption, interception, tampering, unauthorized amendment and viruses. We only send and receive emails on the basis that we are not liable for any such corruption, interception, tampering, amendment or viruses or any consequence thereof. 
*********** End of Disclaimer ***********DataPatterns ITS Group**********
