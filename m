From: Alistair Popple <alistair@popple.id.au>
Subject: =?UTF-8?q?=5BPATCH=206/7=5D=20IBM=20Akebono=3A=20Add=20the=20Akebono=20platform?=
Date: Fri, 21 Feb 2014 17:31:32 +1100
Message-ID: <1392964293-13687-7-git-send-email-alistair@popple.id.au>
References: <1392964293-13687-1-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392964293-13687-1-git-send-email-alistair@popple.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org
Cc: Alistair Popple <alistair@popple.id.au>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the IBM Akebono board.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 .../devicetree/bindings/powerpc/4xx/akebono.txt    |   54 +++
 arch/powerpc/boot/Makefile                         |    3 +
 arch/powerpc/boot/dcr.h                            |    4 +
 arch/powerpc/boot/dts/akebono.dts                  |  385 ++++++++++++=
++++++++
 arch/powerpc/boot/treeboot-akebono.c               |  178 +++++++++
 arch/powerpc/boot/wrapper                          |    3 +
 arch/powerpc/configs/44x/akebono_defconfig         |  148 ++++++++
 arch/powerpc/platforms/44x/Kconfig                 |   26 ++
 arch/powerpc/platforms/44x/Makefile                |    1 +
 arch/powerpc/platforms/44x/ppc476.c                |  112 ++++--
 arch/powerpc/sysdev/ppc4xx_pci.c                   |   13 +-
 11 files changed, 901 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/4xx/akebo=
no.txt
 create mode 100644 arch/powerpc/boot/dts/akebono.dts
 create mode 100644 arch/powerpc/boot/treeboot-akebono.c
 create mode 100644 arch/powerpc/configs/44x/akebono_defconfig

diff --git a/Documentation/devicetree/bindings/powerpc/4xx/akebono.txt =
b/Documentation/devicetree/bindings/powerpc/4xx/akebono.txt
new file mode 100644
index 0000000..75adb84
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/4xx/akebono.txt
@@ -0,0 +1,54 @@
+
+IBM Akebono board device tree
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+The IBM Akebono board is a development board for the PPC476GTR SoC.
+
+0) The root node
+
+   Required properties:
+
+   - model : "ibm,akebono".
+   - compatible : "ibm,akebono" , "ibm,476gtr".
+
+1.a) The Secure Digital Host Controller Interface (SDHCI) node
+
+  Represent the Secure Digital Host Controller Interfaces.
+
+  Required properties:
+
+   - compatible : should be "ibm,476gtr-sdhci","sdhci".
+   - reg : should contain the SDHCI registers location and length.
+   - interrupt-parent : a phandle for the interrupt controller.
+   - interrupts : should contain the SDHCI interrupt.
+
+1.b) The Advanced Host Controller Interface (AHCI) SATA node
+
+  Represents the advanced host controller SATA interface.
+
+  Required properties:
+
+   - compatible : should be "ibm,476gtr-ahci".
+   - reg : should contain the AHCI registers location and length.
+   - interrupt-parent : a phandle for the interrupt controller.
+   - interrupts : should contain the AHCI interrupt.
+
+1.c) The FPGA node
+
+  The Akebono board stores some board information such as the revision
+  number in an FPGA which is represented by this node.
+
+  Required properties:
+
+   - compatible : should be "ibm,akebono-fpga".
+   - reg : should contain the FPGA registers location and length.
+
+1.d) The AVR node
+
+  The Akebono board has an Atmel AVR microprocessor attached to the I2=
C
+  bus as a power controller for the board.
+
+  Required properties:
+
+   - compatible : should be "ibm,akebono-avr".
+   - reg : should contain the I2C bus address for the AVR.
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index ca7f08c..dd77cca 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -47,6 +47,7 @@ $(obj)/cuboot-acadia.o: BOOTCFLAGS +=3D -mcpu=3D405
 $(obj)/treeboot-walnut.o: BOOTCFLAGS +=3D -mcpu=3D405
 $(obj)/treeboot-iss4xx.o: BOOTCFLAGS +=3D -mcpu=3D405
 $(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D -mcpu=3D405
+$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D -mcpu=3D405
 $(obj)/virtex405-head.o: BOOTAFLAGS +=3D -mcpu=3D405
=20
=20
@@ -86,6 +87,7 @@ src-plat-$(CONFIG_44x) +=3D treeboot-ebony.c cuboot-e=
bony.c treeboot-bamboo.c \
 				cuboot-taishan.c cuboot-katmai.c \
 				cuboot-warp.c cuboot-yosemite.c \
 				treeboot-iss4xx.c treeboot-currituck.c \
+				treeboot-akebono.c \
 				simpleboot.c fixed-head.S virtex.c
 src-plat-$(CONFIG_8xx) +=3D cuboot-8xx.c fixed-head.S ep88xc.c redboot=
-8xx.c
 src-plat-$(CONFIG_PPC_MPC52xx) +=3D cuboot-52xx.c
@@ -236,6 +238,7 @@ image-$(CONFIG_YOSEMITE)		+=3D cuImage.yosemite
 image-$(CONFIG_ISS4xx)			+=3D treeImage.iss4xx \
 					   treeImage.iss4xx-mpic
 image-$(CONFIG_CURRITUCK)			+=3D treeImage.currituck
+image-$(CONFIG_AKEBONO)			+=3D treeImage.akebono
=20
 # Board ports in arch/powerpc/platform/8xx/Kconfig
 image-$(CONFIG_MPC86XADS)		+=3D cuImage.mpc866ads
diff --git a/arch/powerpc/boot/dcr.h b/arch/powerpc/boot/dcr.h
index cc73f7a..bf8f4ed 100644
--- a/arch/powerpc/boot/dcr.h
+++ b/arch/powerpc/boot/dcr.h
@@ -15,6 +15,10 @@
 		asm volatile("mfdcrx %0,%1" : "=3Dr"(rval) : "r"(rn)); \
 		rval; \
 	})
+#define mtdcrx(rn, val) \
+	({	\
+		asm volatile("mtdcrx %0,%1" : : "r"(rn), "r" (val)); \
+	})
=20
 /* 440GP/440GX SDRAM controller DCRs */
 #define DCRN_SDRAM0_CFGADDR				0x010
diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/=
akebono.dts
new file mode 100644
index 0000000..9a21f58
--- /dev/null
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -0,0 +1,385 @@
+/*
+ * Device Tree Source for IBM Embedded PPC 476 Platform
+ *
+ * Copyright =C2=A9 2013 Tony Breeds IBM Corporation
+ * Copyright =C2=A9 2013 Alistair Popple IBM Corporation
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without
+ * any warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+/memreserve/ 0x01f00000 0x00100000;	// spin table
+
+/ {
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;
+	model =3D "ibm,akebono";
+	compatible =3D "ibm,akebono", "ibm,476gtr";
+	dcr-parent =3D <&{/cpus/cpu@0}>;
+
+	aliases {
+		serial0 =3D &UART0;
+	};
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		cpu@0 {
+			device_type =3D "cpu";
+			model =3D "PowerPC,476";
+			reg =3D <0>;
+			clock-frequency =3D <1600000000>; // 1.6 GHz
+			timebase-frequency =3D <100000000>; // 100Mhz
+			i-cache-line-size =3D <32>;
+			d-cache-line-size =3D <32>;
+			i-cache-size =3D <32768>;
+			d-cache-size =3D <32768>;
+			dcr-controller;
+			dcr-access-method =3D "native";
+			status =3D "ok";
+		};
+		cpu@1 {
+			device_type =3D "cpu";
+			model =3D "PowerPC,476";
+			reg =3D <1>;
+			clock-frequency =3D <1600000000>; // 1.6 GHz
+			timebase-frequency =3D <100000000>; // 100Mhz
+			i-cache-line-size =3D <32>;
+			d-cache-line-size =3D <32>;
+			i-cache-size =3D <32768>;
+			d-cache-size =3D <32768>;
+			dcr-controller;
+			dcr-access-method =3D "native";
+			status =3D "disabled";
+			enable-method =3D "spin-table";
+			cpu-release-addr =3D <0x0 0x01f00000>;
+		};
+	};
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x0>; // filled in by zImage
+	};
+
+	MPIC: interrupt-controller {
+		compatible =3D "chrp,open-pic";
+		interrupt-controller;
+		dcr-reg =3D <0xffc00000 0x00040000>;
+		#address-cells =3D <0>;
+		#size-cells =3D <0>;
+		#interrupt-cells =3D <2>;
+		single-cpu-affinity;
+	};
+
+	plb {
+		compatible =3D "ibm,plb6";
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+		clock-frequency =3D <200000000>; // 200Mhz
+
+		MAL0: mcmal {
+			compatible =3D "ibm,mcmal-476gtr", "ibm,mcmal2";
+			dcr-reg =3D <0xc0000000 0x062>;
+			num-tx-chans =3D <1>;
+			num-rx-chans =3D <1>;
+			#address-cells =3D <0>;
+			#size-cells =3D <0>;
+			interrupt-parent =3D <&MPIC>;
+			interrupts =3D <	/*TXEOB*/ 77 0x4
+					/*RXEOB*/ 78 0x4
+					/*SERR*/  76 0x4
+					/*TXDE*/  79 0x4
+					/*RXDE*/  80 0x4>;
+		};
+
+		SATA0: sata@30000010000 {
+			compatible =3D "ibm,476gtr-ahci";
+			reg =3D <0x300 0x00010000 0x0 0x10000>;
+			interrupt-parent =3D <&MPIC>;
+			interrupts =3D <93 2>;
+		};
+
+		EHCI0: ehci@30010000000 {
+			compatible =3D "ibm,476gtr-ehci", "usb-ehci";
+			reg =3D <0x300 0x10000000 0x0 0x10000>;
+			interrupt-parent =3D <&MPIC>;
+			interrupts =3D <85 2>;
+		};
+
+		SD0: sd@30000000000 {
+			compatible =3D "ibm,476gtr-sdhci", "sdhci";
+			reg =3D <0x300 0x00000000 0x0 0x10000>;
+			interrupts =3D <91 2>;
+			interrupt-parent =3D <&MPIC>;
+		};
+
+		OHCI0: ohci@30010010000 {
+			compatible =3D "ibm,476gtr-ohci", "usb-ohci";
+			reg =3D <0x300 0x10010000 0x0 0x10000>;
+			interrupt-parent =3D <&MPIC>;
+			interrupts =3D <89 1>;
+			};
+
+		OHCI1: ohci@30010020000 {
+			compatible =3D "ibm,476gtr-ohci", "usb-ohci";
+			reg =3D <0x300 0x10020000 0x0 0x10000>;
+			interrupt-parent =3D <&MPIC>;
+			interrupts =3D <88 1>;
+			};
+
+		POB0: opb {
+			compatible =3D "ibm,opb-4xx", "ibm,opb";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			/* Wish there was a nicer way of specifying a full
+			 * 32-bit range
+			 */
+			ranges =3D <0x00000000 0x0000033f 0x00000000 0x80000000
+				  0x80000000 0x0000033f 0x80000000 0x80000000>;
+			clock-frequency =3D <100000000>;
+
+			RGMII0: emac-rgmii-wol@50004 {
+				compatible =3D "ibm,rgmii-wol-476gtr", "ibm,rgmii-wol";
+				reg =3D <0x50004 0x00000008>;
+				has-mdio;
+			};
+
+			EMAC0: ethernet@30000 {
+				device_type =3D "network";
+				compatible =3D "ibm,emac-476gtr", "ibm,emac4sync";
+				interrupt-parent =3D <&EMAC0>;
+				interrupts =3D <0x0 0x1>;
+				#interrupt-cells =3D <1>;
+				#address-cells =3D <0>;
+				#size-cells =3D <0>;
+				interrupt-map =3D </*Status*/ 0x0 &MPIC 81 0x4
+						 /*Wake*/   0x1 &MPIC 82 0x4>;
+				reg =3D <0x30000 0x78>;
+
+				/* local-mac-address will normally be added by
+				 * the wrapper. If your device doesn't support
+				 * passing data to the wrapper (in the form
+				 * local-mac-addr=3D<hwaddr>) then you will need
+				 * to set it manually here. */
+				//local-mac-address =3D [000000000000];
+
+				mal-device =3D <&MAL0>;
+				mal-tx-channel =3D <0>;
+				mal-rx-channel =3D <0>;
+				cell-index =3D <0>;
+				max-frame-size =3D <9000>;
+				rx-fifo-size =3D <4096>;
+				tx-fifo-size =3D <2048>;
+				rx-fifo-size-gige =3D <16384>;
+				phy-mode =3D "rgmii";
+				phy-map =3D <0x00000000>;
+				rgmii-wol-device =3D <&RGMII0>;
+				has-inverted-stacr-oc;
+				has-new-stacr-staopc;
+			};
+
+			UART0: serial@10000 {
+				device_type =3D "serial";
+				compatible =3D "ns16750", "ns16550";
+				reg =3D <0x10000 0x00000008>;
+				virtual-reg =3D <0xe8010000>;
+				clock-frequency =3D <1851851>;
+				current-speed =3D <38400>;
+				interrupt-parent =3D <&MPIC>;
+				interrupts =3D <39 2>;
+			};
+
+			IIC0: i2c@00000000 {
+				compatible =3D "ibm,iic-476gtr", "ibm,iic";
+				reg =3D <0x0 0x00000020>;
+				interrupt-parent =3D <&MPIC>;
+				interrupts =3D <37 2>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				rtc@68 {
+					compatible =3D "stm,m41t80", "m41st85";
+					reg =3D <0x68>;
+				};
+			};
+
+			IIC1: i2c@00000100 {
+				compatible =3D "ibm,iic-476gtr", "ibm,iic";
+				reg =3D <0x100 0x00000020>;
+				interrupt-parent =3D <&MPIC>;
+				interrupts =3D <38 2>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				avr@58 {
+					compatible =3D "ibm,akebono-avr";
+					reg =3D <0x58>;
+				};
+			};
+
+			FPGA0: fpga@ebc00000 {
+				compatible =3D "ibm,akebono-fpga";
+				reg =3D <0xebc00000 0x8>;
+			};
+		};
+
+		PCIE0: pciex@10100000000 {
+			device_type =3D "pci";
+			#interrupt-cells =3D <1>;
+			#size-cells =3D <2>;
+			#address-cells =3D <3>;
+			compatible =3D "ibm,plb-pciex-476fpe", "ibm,plb-pciex";
+			primary;
+			port =3D <0x0>; /* port number */
+			reg =3D <0x00000101 0x00000000 0x0 0x10000000	       /* Config spac=
e access */
+			       0x00000100 0x00000000 0x0 0x00001000>;	/* UTL Registers spac=
e access */
+			dcr-reg =3D <0xc0 0x20>;
+
+//                                pci_space  < pci_addr          > < c=
pu_addr          > < size       >
+			ranges =3D <0x02000000 0x00000000 0x80000000 0x00000110 0x80000000 =
0x0 0x80000000
+			          0x01000000 0x0        0x0        0x00000140 0x0        0x=
0 0x00010000>;
+
+			/* Inbound starting at 0 to memsize filled in by zImage */
+			dma-ranges =3D <0x42000000 0x0 0x0 0x0 0x0 0x0 0x0>;
+
+			/* This drives busses 0 to 0xf */
+			bus-range =3D <0x0 0xf>;
+
+			/* Legacy interrupts (note the weird polarity, the bridge seems
+			 * to invert PCIe legacy interrupts).
+			 * We are de-swizzling here because the numbers are actually for
+			 * port of the root complex virtual P2P bridge. But I want
+			 * to avoid putting a node for it in the tree, so the numbers
+			 * below are basically de-swizzled numbers.
+			 * The real slot is on idsel 0, so the swizzling is 1:1
+			 */
+			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
+			interrupt-map =3D <
+				0x0 0x0 0x0 0x1 &MPIC 45 0x2 /* int A */
+				0x0 0x0 0x0 0x2 &MPIC 46 0x2 /* int B */
+				0x0 0x0 0x0 0x3 &MPIC 47 0x2 /* int C */
+				0x0 0x0 0x0 0x4 &MPIC 48 0x2 /* int D */>;
+		};
+
+		PCIE1: pciex@20100000000 {
+			device_type =3D "pci";
+			#interrupt-cells =3D <1>;
+			#size-cells =3D <2>;
+			#address-cells =3D <3>;
+			compatible =3D "ibm,plb-pciex-476fpe", "ibm,plb-pciex";
+			primary;
+			port =3D <0x1>; /* port number */
+			reg =3D <0x00000201 0x00000000 0x0 0x10000000	       /* Config spac=
e access */
+			       0x00000200 0x00000000 0x0 0x00001000>;	/* UTL Registers spac=
e access */
+			dcr-reg =3D <0x100 0x20>;
+
+//                                pci_space  < pci_addr          > < c=
pu_addr          > < size       >
+			ranges =3D <0x02000000 0x00000000 0x80000000 0x00000210 0x80000000 =
0x0 0x80000000
+			          0x01000000 0x0        0x0        0x00000240 0x0        0x=
0 0x00010000>;
+
+			/* Inbound starting at 0 to memsize filled in by zImage */
+			dma-ranges =3D <0x42000000 0x0 0x0 0x0 0x0 0x0 0x0>;
+
+			/* This drives busses 0 to 0xf */
+			bus-range =3D <0x0 0xf>;
+
+			/* Legacy interrupts (note the weird polarity, the bridge seems
+			 * to invert PCIe legacy interrupts).
+			 * We are de-swizzling here because the numbers are actually for
+			 * port of the root complex virtual P2P bridge. But I want
+			 * to avoid putting a node for it in the tree, so the numbers
+			 * below are basically de-swizzled numbers.
+			 * The real slot is on idsel 0, so the swizzling is 1:1
+			 */
+			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
+			interrupt-map =3D <
+				0x0 0x0 0x0 0x1 &MPIC 53 0x2 /* int A */
+				0x0 0x0 0x0 0x2 &MPIC 54 0x2 /* int B */
+				0x0 0x0 0x0 0x3 &MPIC 55 0x2 /* int C */
+				0x0 0x0 0x0 0x4 &MPIC 56 0x2 /* int D */>;
+		};
+
+		PCIE2: pciex@18100000000 {
+			device_type =3D "pci";
+			#interrupt-cells =3D <1>;
+			#size-cells =3D <2>;
+			#address-cells =3D <3>;
+			compatible =3D "ibm,plb-pciex-476fpe", "ibm,plb-pciex";
+			primary;
+			port =3D <0x2>; /* port number */
+			reg =3D <0x00000181 0x00000000 0x0 0x10000000	       /* Config spac=
e access */
+			       0x00000180 0x00000000 0x0 0x00001000>;	/* UTL Registers spac=
e access */
+			dcr-reg =3D <0xe0 0x20>;
+
+//                                pci_space  < pci_addr          > < c=
pu_addr          > < size       >
+			ranges =3D <0x02000000 0x00000000 0x80000000 0x00000190 0x80000000 =
0x0 0x80000000
+			          0x01000000 0x0        0x0        0x000001c0 0x0        0x=
0 0x00010000>;
+
+			/* Inbound starting at 0 to memsize filled in by zImage */
+			dma-ranges =3D <0x42000000 0x0 0x0 0x0 0x0 0x0 0x0>;
+
+			/* This drives busses 0 to 0xf */
+			bus-range =3D <0x0 0xf>;
+
+			/* Legacy interrupts (note the weird polarity, the bridge seems
+			 * to invert PCIe legacy interrupts).
+			 * We are de-swizzling here because the numbers are actually for
+			 * port of the root complex virtual P2P bridge. But I want
+			 * to avoid putting a node for it in the tree, so the numbers
+			 * below are basically de-swizzled numbers.
+			 * The real slot is on idsel 0, so the swizzling is 1:1
+			 */
+			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
+			interrupt-map =3D <
+				0x0 0x0 0x0 0x1 &MPIC 61 0x2 /* int A */
+				0x0 0x0 0x0 0x2 &MPIC 62 0x2 /* int B */
+				0x0 0x0 0x0 0x3 &MPIC 63 0x2 /* int C */
+				0x0 0x0 0x0 0x4 &MPIC 64 0x2 /* int D */>;
+		};
+
+		PCIE3: pciex@28100000000 {
+			device_type =3D "pci";
+			#interrupt-cells =3D <1>;
+			#size-cells =3D <2>;
+			#address-cells =3D <3>;
+			compatible =3D "ibm,plb-pciex-476fpe", "ibm,plb-pciex";
+			primary;
+			port =3D <0x3>; /* port number */
+			reg =3D <0x00000281 0x00000000 0x0 0x10000000	       /* Config spac=
e access */
+			       0x00000280 0x00000000 0x0 0x00001000>;	/* UTL Registers spac=
e access */
+			dcr-reg =3D <0x120 0x20>;
+
+//                                pci_space  < pci_addr          > < c=
pu_addr          > < size       >
+			ranges =3D <0x02000000 0x00000000 0x80000000 0x00000290 0x80000000 =
0x0 0x80000000
+			          0x01000000 0x0        0x0        0x000002c0 0x0        0x=
0 0x00010000>;
+
+			/* Inbound starting at 0 to memsize filled in by zImage */
+			dma-ranges =3D <0x42000000 0x0 0x0 0x0 0x0 0x0 0x0>;
+
+			/* This drives busses 0 to 0xf */
+			bus-range =3D <0x0 0xf>;
+
+			/* Legacy interrupts (note the weird polarity, the bridge seems
+			 * to invert PCIe legacy interrupts).
+			 * We are de-swizzling here because the numbers are actually for
+			 * port of the root complex virtual P2P bridge. But I want
+			 * to avoid putting a node for it in the tree, so the numbers
+			 * below are basically de-swizzled numbers.
+			 * The real slot is on idsel 0, so the swizzling is 1:1
+			 */
+			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
+			interrupt-map =3D <
+				0x0 0x0 0x0 0x1 &MPIC 69 0x2 /* int A */
+				0x0 0x0 0x0 0x2 &MPIC 70 0x2 /* int B */
+				0x0 0x0 0x0 0x3 &MPIC 71 0x2 /* int C */
+				0x0 0x0 0x0 0x4 &MPIC 72 0x2 /* int D */>;
+		};
+	};
+
+	chosen {
+		linux,stdout-path =3D &UART0;
+	};
+};
diff --git a/arch/powerpc/boot/treeboot-akebono.c b/arch/powerpc/boot/t=
reeboot-akebono.c
new file mode 100644
index 0000000..d42ef8a
--- /dev/null
+++ b/arch/powerpc/boot/treeboot-akebono.c
@@ -0,0 +1,178 @@
+/*
+ * Copyright =C2=A9 2013 Tony Breeds IBM Corporation
+ * Copyright =C2=A9 2013 Alistair Popple IBM Corporation
+ *
+ * Based on earlier code:
+ *   Copyright (C) Paul Mackerras 1997.
+ *
+ *   Matt Porter <mporter@kernel.crashing.org>
+ *   Copyright 2002-2005 MontaVista Software Inc.
+ *
+ *   Eugene Surovegin <eugene.surovegin@zultys.com> or <ebs@ebshome.ne=
t>
+ *   Copyright (c) 2003, 2004 Zultys Technologies
+ *
+ *    Copyright 2007 David Gibson, IBM Corporation.
+ *    Copyright 2010 Ben. Herrenschmidt, IBM Corporation.
+ *    Copyright =C2=A9 2011 David Kleikamp IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <stdarg.h>
+#include <stddef.h>
+#include "types.h"
+#include "elf.h"
+#include "string.h"
+#include "stdlib.h"
+#include "stdio.h"
+#include "page.h"
+#include "ops.h"
+#include "reg.h"
+#include "io.h"
+#include "dcr.h"
+#include "4xx.h"
+#include "44x.h"
+#include "libfdt.h"
+
+BSS_STACK(4096);
+
+#define SPRN_PIR	0x11E	/* Processor Indentification Register */
+#define USERDATA_LEN	256	/* Length of userdata passed in by PIBS */
+#define MAX_RANKS	0x4
+#define DDR3_MR0CF	0x80010011U
+#define CCTL0_MCO2	0x8000080FU
+#define CCTL0_MCO3	0x80000810U
+#define CCTL0_MCO4	0x80000811U
+#define CCTL0_MCO5	0x80000812U
+#define CCTL0_MCO6	0x80000813U
+
+static unsigned long long ibm_akebono_memsize;
+static long long unsigned mac_addr;
+
+static unsigned long long ibm_akebono_detect_memsize(void)
+{
+	u32 reg;
+	unsigned i;
+	unsigned long long memsize =3D 0;
+
+	for (i =3D 0; i < MAX_RANKS; i++) {
+		reg =3D mfdcrx(DDR3_MR0CF + i);
+
+		if (!(reg & 1))
+			continue;
+
+		reg &=3D 0x0000f000;
+		reg >>=3D 12;
+		memsize +=3D (0x800000ULL << reg);
+	}
+
+	return memsize;
+}
+
+static void ibm_akebono_fixups(void)
+{
+	void *emac;
+	u32 reg;
+	void *devp =3D finddevice("/");
+	u32 dma_ranges[7];
+
+	dt_fixup_memory(0x0ULL,  ibm_akebono_memsize);
+
+	while ((devp =3D find_node_by_devtype(devp, "pci"))) {
+		if (getprop(devp, "dma-ranges", dma_ranges,
+			    sizeof(dma_ranges)) < 0) {
+			printf("%s: Failed to get dma-ranges\r\n", __func__);
+			continue;
+		}
+
+		dma_ranges[5] =3D ibm_akebono_memsize >> 32;
+		dma_ranges[6] =3D ibm_akebono_memsize & 0xffffffffUL;
+
+		setprop(devp, "dma-ranges", dma_ranges, sizeof(dma_ranges));
+	}
+
+	/* Fixup the SD timeout frequency */
+	mtdcrx(CCTL0_MCO4, 0x1);
+
+	/* Disable SD high-speed mode (which seems to be broken) */
+	reg =3D mfdcrx(CCTL0_MCO2) & ~0x2;
+	mtdcrx(CCTL0_MCO2, reg);
+
+	/* Set the MAC address */
+	emac =3D finddevice("/plb/opb/ethernet");
+	if (emac > 0) {
+		if (mac_addr)
+			setprop(emac, "local-mac-address",
+				((u8 *) &mac_addr) + 2 , 6);
+	}
+}
+
+void platform_init(char *userdata)
+{
+	unsigned long end_of_ram, avail_ram;
+	u32 pir_reg;
+	int node, size;
+	const u32 *timebase;
+	int len, i, userdata_len;
+	char *end;
+
+	userdata[USERDATA_LEN - 1] =3D '\0';
+	userdata_len =3D strlen(userdata);
+	for (i =3D 0; i < userdata_len; i++) {
+		if (strncmp(&userdata[i], "local-mac-addr=3D", 15) =3D=3D 0) {
+			if (i > 0 && userdata[i - 1] !=3D ' ') {
+				/* We've only found a substring ending
+				 * with local-mac-addr so this isn't
+				 * our mac address. */
+				continue;
+			}
+
+			mac_addr =3D strtoull(&userdata[i + 15], &end, 16);
+
+			/* Remove the "local-mac-addr=3D<...>" from the kernel
+			 * command line, including the tailing space if
+			 * present. */
+			if (*end =3D=3D ' ')
+				end++;
+
+			len =3D ((int) end) - ((int) &userdata[i]);
+			memmove(&userdata[i], end,
+				userdata_len - (len + i) + 1);
+			break;
+		}
+	}
+
+	loader_info.cmdline =3D userdata;
+	loader_info.cmdline_len =3D 256;
+
+	ibm_akebono_memsize =3D ibm_akebono_detect_memsize();
+	if (ibm_akebono_memsize >> 32)
+		end_of_ram =3D ~0UL;
+	else
+		end_of_ram =3D ibm_akebono_memsize;
+	avail_ram =3D end_of_ram - (unsigned long)_end;
+
+	simple_alloc_init(_end, avail_ram, 128, 64);
+	platform_ops.fixups =3D ibm_akebono_fixups;
+	platform_ops.exit =3D ibm44x_dbcr_reset;
+	pir_reg =3D mfspr(SPRN_PIR);
+
+	/* Make sure FDT blob is sane */
+	if (fdt_check_header(_dtb_start) !=3D 0)
+		fatal("Invalid device tree blob\n");
+
+	node =3D fdt_node_offset_by_prop_value(_dtb_start, -1, "device_type",
+					     "cpu", sizeof("cpu"));
+	if (!node)
+		fatal("Cannot find cpu node\n");
+	timebase =3D fdt_getprop(_dtb_start, node, "timebase-frequency", &siz=
e);
+	if (timebase && (size =3D=3D 4))
+		timebase_period_ns =3D 1000000000 / *timebase;
+
+	fdt_set_boot_cpuid_phys(_dtb_start, pir_reg);
+	fdt_init(_dtb_start);
+
+	serial_console_init();
+}
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 2e1af74..5207498 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -257,6 +257,9 @@ gamecube|wii)
 treeboot-currituck)
     link_address=3D'0x1000000'
     ;;
+treeboot-akebono)
+    link_address=3D'0x1000000'
+    ;;
 treeboot-iss4xx-mpic)
     platformo=3D"$object/treeboot-iss4xx.o"
     ;;
diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/=
configs/44x/akebono_defconfig
new file mode 100644
index 0000000..7e2530c
--- /dev/null
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -0,0 +1,148 @@
+CONFIG_44x=3Dy
+CONFIG_SMP=3Dy
+CONFIG_SYSVIPC=3Dy
+CONFIG_POSIX_MQUEUE=3Dy
+CONFIG_LOG_BUF_SHIFT=3D14
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_RD_BZIP2=3Dy
+CONFIG_RD_LZMA=3Dy
+CONFIG_RD_XZ=3Dy
+CONFIG_EXPERT=3Dy
+CONFIG_KALLSYMS_ALL=3Dy
+# CONFIG_SLUB_CPU_PARTIAL is not set
+CONFIG_PROFILING=3Dy
+CONFIG_OPROFILE=3Dy
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_POWERNV_MSI is not set
+CONFIG_PPC_47x=3Dy
+# CONFIG_EBONY is not set
+CONFIG_AKEBONO=3Dy
+CONFIG_HIGHMEM=3Dy
+CONFIG_HZ_100=3Dy
+CONFIG_IRQ_ALL_CPUS=3Dy
+# CONFIG_COMPACTION is not set
+CONFIG_CMDLINE_BOOL=3Dy
+CONFIG_CMDLINE=3D""
+# CONFIG_SUSPEND is not set
+CONFIG_PCI_MSI=3Dy
+CONFIG_NET=3Dy
+CONFIG_PACKET=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_INET=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+CONFIG_IP_PNP_BOOTP=3Dy
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
+CONFIG_CONNECTOR=3Dy
+CONFIG_MTD=3Dy
+CONFIG_MTD_BLOCK=3Dy
+CONFIG_MTD_JEDECPROBE=3Dy
+CONFIG_MTD_CFI_AMDSTD=3Dy
+CONFIG_MTD_PHYSMAP_OF=3Dy
+CONFIG_PROC_DEVICETREE=3Dy
+CONFIG_BLK_DEV_RAM=3Dy
+CONFIG_BLK_DEV_RAM_SIZE=3D35000
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=3Dy
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SATA_PMP is not set
+# CONFIG_ATA_SFF is not set
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_HP is not set
+CONFIG_IBM_EMAC=3Dy
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_MOUSE_PS2 is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_8250=3Dy
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_SERIAL_8250_EXTENDED=3Dy
+CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
+CONFIG_SERIAL_OF_PLATFORM=3Dy
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C_CHARDEV=3Dy
+# CONFIG_HWMON is not set
+CONFIG_THERMAL=3Dy
+# CONFIG_USB_DEFAULT_PERSIST is not set
+CONFIG_USB_EHCI_HCD=3Dy
+CONFIG_USB_OHCI_HCD=3Dy
+# CONFIG_USB_OHCI_HCD_PCI is not set
+CONFIG_USB_STORAGE=3Dy
+CONFIG_MMC=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_DRV_M41T80=3Dy
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT3_FS=3Dy
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_POSIX_ACL=3Dy
+CONFIG_EXT3_FS_SECURITY=3Dy
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_PROC_KCORE=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_CRAMFS=3Dy
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_DEFAULT=3D"n"
+CONFIG_NLS_CODEPAGE_437=3Dy
+CONFIG_NLS_ISO8859_1=3Dy
+CONFIG_DEBUG_INFO=3Dy
+CONFIG_DEBUG_FS=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+CONFIG_DETECT_HUNG_TASK=3Dy
+CONFIG_XMON=3Dy
+CONFIG_XMON_DEFAULT=3Dy
+CONFIG_PPC_EARLY_DEBUG=3Dy
+CONFIG_PPC_EARLY_DEBUG_44x_PHYSLOW=3D0x00010000
+CONFIG_PPC_EARLY_DEBUG_44x_PHYSHIGH=3D0x33f
+CONFIG_CRYPTO_PCBC=3Dy
+CONFIG_CRYPTO_MD5=3Dy
+CONFIG_CRYPTO_SHA1_PPC=3Dy
+CONFIG_CRYPTO_DES=3Dy
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platform=
s/44x/Kconfig
index d6c7506..b734df0 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -199,6 +199,32 @@ config CURRITUCK
 	help
 	  This option enables support for the IBM Currituck (476fpe) evaluati=
on board
=20
+config AKEBONO
+	bool "IBM Akebono (476gtr) Support"
+	depends on PPC_47x
+	default n
+	select SWIOTLB
+	select 476FPE
+	select PPC4xx_PCI_EXPRESS
+	select I2C
+	select I2C_IBM_IIC
+	select NETDEVICES
+	select ETHERNET
+	select NET_VENDOR_IBM
+	select IBM_EMAC_EMAC4
+	select IBM_EMAC_RGMII_WOL
+	select USB
+	select USB_OHCI_HCD_PLATFORM
+	select USB_EHCI_HCD_PLATFORM
+	select MMC_SDHCI
+	select MMC_SDHCI_PLTFM
+	select MMC_SDHCI_OF_476GTR
+	select ATA
+	select SATA_AHCI_PLATFORM
+	help
+	  This option enables support for the IBM Akebono (476gtr) evaluation=
 board
+
+
 config ICON
 	bool "Icon"
 	depends on 44x
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platfor=
ms/44x/Makefile
index f896b89..26d35b5 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_XILINX_ML510) +=3D virtex_ml510.o
 obj-$(CONFIG_ISS4xx)	+=3D iss4xx.o
 obj-$(CONFIG_CANYONLANDS)+=3D canyonlands.o
 obj-$(CONFIG_CURRITUCK)	+=3D ppc476.o
+obj-$(CONFIG_AKEBONO)	+=3D ppc476.o
diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platfor=
ms/44x/ppc476.c
index c6c5a6f..33986c1 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -1,7 +1,8 @@
 /*
  * PowerPC 476FPE board specific routines
  *
- * Copyright =C2=A9 2011 Tony Breeds IBM Corporation
+ * Copyright =C2=A9 2013 Tony Breeds IBM Corporation
+ * Copyright =C2=A9 2013 Alistair Popple IBM Corporation
  *
  * Based on earlier code:
  *    Matt Porter <mporter@kernel.crashing.org>
@@ -35,6 +36,7 @@
 #include <asm/mmu.h>
=20
 #include <linux/pci.h>
+#include <linux/i2c.h>
=20
 static struct of_device_id ppc47x_of_bus[] __initdata =3D {
 	{ .compatible =3D "ibm,plb4", },
@@ -55,15 +57,69 @@ static void quirk_ppc_currituck_usb_fixup(struct pc=
i_dev *dev)
 }
 DECLARE_PCI_FIXUP_HEADER(0x1033, 0x0035, quirk_ppc_currituck_usb_fixup=
);
=20
+/* Akebono has an AVR microcontroller attached to the I2C bus
+ * which is used to power off/reset the system. */
+
+/* AVR I2C Commands */
+#define AVR_PWRCTL_CMD (0x26)
+
+/* Flags for the power control I2C commands */
+#define AVR_PWRCTL_PWROFF (0x01)
+#define AVR_PWRCTL_RESET (0x02)
+
+static struct i2c_client *avr_i2c_client;
+static void avr_halt_system(int pwrctl_flags)
+{
+	/* Request the AVR to reset the system */
+	i2c_smbus_write_byte_data(avr_i2c_client,
+				  AVR_PWRCTL_CMD, pwrctl_flags);
+
+	/* Wait for system to be reset */
+	while (1)
+		;
+}
+
+static void avr_power_off_system(void)
+{
+	avr_halt_system(AVR_PWRCTL_PWROFF);
+}
+
+static void avr_reset_system(char *cmd)
+{
+	avr_halt_system(AVR_PWRCTL_RESET);
+}
+
+static int avr_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	avr_i2c_client =3D client;
+	ppc_md.restart =3D avr_reset_system;
+	ppc_md.power_off =3D avr_power_off_system;
+	return 0;
+}
+
+static const struct i2c_device_id avr_id[] =3D {
+	{ "akebono-avr", 0 },
+	{ }
+};
+
+static struct i2c_driver avr_driver =3D {
+	.driver =3D {
+		.name =3D "akebono-avr",
+	},
+	.probe =3D avr_probe,
+	.id_table =3D avr_id,
+};
+
 static int __init ppc47x_device_probe(void)
 {
+	i2c_add_driver(&avr_driver);
 	of_platform_bus_probe(NULL, ppc47x_of_bus, NULL);
=20
 	return 0;
 }
 machine_device_initcall(ppc47x, ppc47x_device_probe);
=20
-/* We can have either UICs or MPICs */
 static void __init ppc47x_init_irq(void)
 {
 	struct device_node *np;
@@ -163,37 +219,30 @@ static void __init ppc47x_setup_arch(void)
 	ppc47x_smp_init();
 }
=20
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init ppc47x_probe(void)
-{
-	unsigned long root =3D of_get_flat_dt_root();
-
-	if (!of_flat_dt_is_compatible(root, "ibm,currituck"))
-		return 0;
-
-	return 1;
-}
-
 static int board_rev =3D -1;
 static int __init ppc47x_get_board_rev(void)
 {
-	u8 fpga_reg0;
-	void *fpga;
-	struct device_node *np;
+	int reg;
+	u8 *fpga;
+	struct device_node *np =3D NULL;
+
+	if (of_machine_is_compatible("ibm,currituck")) {
+		np =3D of_find_compatible_node(NULL, NULL, "ibm,currituck-fpga");
+		reg =3D 0;
+	} else if (of_machine_is_compatible("ibm,akebono")) {
+		np =3D of_find_compatible_node(NULL, NULL, "ibm,akebono-fpga");
+		reg =3D 2;
+	}
=20
-	np =3D of_find_compatible_node(NULL, NULL, "ibm,currituck-fpga");
 	if (!np)
 		goto fail;
=20
-	fpga =3D of_iomap(np, 0);
+	fpga =3D (u8 *) of_iomap(np, 0);
 	of_node_put(np);
 	if (!fpga)
 		goto fail;
=20
-	fpga_reg0 =3D ioread8(fpga);
-	board_rev =3D fpga_reg0 & 0x03;
+	board_rev =3D ioread8(fpga + reg) & 0x03;
 	pr_info("%s: Found board revision %d\n", __func__, board_rev);
 	iounmap(fpga);
 	return 0;
@@ -221,13 +270,30 @@ static void ppc47x_pci_irq_fixup(struct pci_dev *=
dev)
 	}
 }
=20
+/*
+ * Called very early, MMU is off, device-tree isn't unflattened
+ */
+static int __init ppc47x_probe(void)
+{
+	unsigned long root =3D of_get_flat_dt_root();
+
+	if (of_flat_dt_is_compatible(root, "ibm,akebono"))
+		return 1;
+
+	if (of_flat_dt_is_compatible(root, "ibm,currituck")) {
+		ppc_md.pci_irq_fixup =3D ppc47x_pci_irq_fixup;
+		return 1;
+	}
+
+	return 0;
+}
+
 define_machine(ppc47x) {
 	.name			=3D "PowerPC 47x",
 	.probe			=3D ppc47x_probe,
 	.progress		=3D udbg_progress,
 	.init_IRQ		=3D ppc47x_init_irq,
 	.setup_arch		=3D ppc47x_setup_arch,
-	.pci_irq_fixup		=3D ppc47x_pci_irq_fixup,
 	.restart		=3D ppc4xx_reset_system,
 	.calibrate_decr		=3D generic_calibrate_decr,
 };
diff --git a/arch/powerpc/sysdev/ppc4xx_pci.c b/arch/powerpc/sysdev/ppc=
4xx_pci.c
index 64603a1..54ec1d5 100644
--- a/arch/powerpc/sysdev/ppc4xx_pci.c
+++ b/arch/powerpc/sysdev/ppc4xx_pci.c
@@ -1440,7 +1440,8 @@ static int __init ppc4xx_pciex_check_core_init(st=
ruct device_node *np)
 		ppc4xx_pciex_hwops =3D &ppc405ex_pcie_hwops;
 #endif
 #ifdef CONFIG_476FPE
-	if (of_device_is_compatible(np, "ibm,plb-pciex-476fpe"))
+	if (of_device_is_compatible(np, "ibm,plb-pciex-476fpe")
+		|| of_device_is_compatible(np, "ibm,plb-pciex-476gtr"))
 		ppc4xx_pciex_hwops =3D &ppc_476fpe_pcie_hwops;
 #endif
 	if (ppc4xx_pciex_hwops =3D=3D NULL) {
@@ -1751,7 +1752,10 @@ static int __init ppc4xx_setup_one_pciex_POM(str=
uct ppc4xx_pciex_port	*port,
 			dcr_write(port->dcrs, DCRO_PEGPL_OMR1MSKL,
 				sa | DCRO_PEGPL_460SX_OMR1MSKL_UOT
 					| DCRO_PEGPL_OMRxMSKL_VAL);
-		else if (of_device_is_compatible(port->node, "ibm,plb-pciex-476fpe")=
)
+		else if (of_device_is_compatible(
+				port->node, "ibm,plb-pciex-476fpe") ||
+			of_device_is_compatible(
+				port->node, "ibm,plb-pciex-476gtr"))
 			dcr_write(port->dcrs, DCRO_PEGPL_OMR1MSKL,
 				sa | DCRO_PEGPL_476FPE_OMR1MSKL_UOT
 					| DCRO_PEGPL_OMRxMSKL_VAL);
@@ -1881,7 +1885,10 @@ static void __init ppc4xx_configure_pciex_PIMs(s=
truct ppc4xx_pciex_port *port,
 			sa |=3D PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
 		if (of_device_is_compatible(port->node, "ibm,plb-pciex-460sx") ||
-		    of_device_is_compatible(port->node, "ibm,plb-pciex-476fpe"))
+		    of_device_is_compatible(
+			    port->node, "ibm,plb-pciex-476fpe") ||
+		    of_device_is_compatible(
+			    port->node, "ibm,plb-pciex-476gtr"))
 			sa |=3D PCI_BASE_ADDRESS_MEM_TYPE_64;
=20
 		out_le32(mbase + PECFG_BAR0HMPA, RES_TO_U32_HIGH(sa));
--=20
1.7.10.4
