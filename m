From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2][v4] powerpc/fsl-booke: Add initial T1040/T1042 RDB board support
Date: Fri, 5 Sep 2014 16:14:40 +0530
Message-ID: <1409913880-21603-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T1040/T1042RDB is Freescale Reference Design Board.
The board can support both T1040/T1042 QorIQ Power Architecture=E2=84=A2=
 processor.

T1040/T1042RDB board Overview
-----------------------
- SERDES Connections, 8 lanes supporting:
	- PCI
	- SGMII
    	- QSGMII
    	- SATA 2.0
- DDR Controller
    	- Supports rates of up to 1600 MHz data-rate
    	- Supports one DDR3LP UDIMM
-IFC/Local Bus
    	- NAND flash: 1GB 8-bit NAND flash
    	- NOR: 128MB 16-bit NOR Flash
- Ethernet
    	- Two on-board RGMII 10/100/1G ethernet ports.
    	- PHY #0 remains powered up during deep-sleep
- CPLD
- Clocks
    	- System and DDR clock (SYSCLK, =E2=80=9CDDRCLK=E2=80=9D)
    	- SERDES clocks
- Power Supplies
- USB
    	- Supports two USB 2.0 ports with integrated PHYs
    	- Two type A ports with 5V@1.5A per port.
- SDHC
    	- SDHC/SDXC connector
- SPI
    	- On-board 64MB SPI flash
- I2C
    	- Devices connected: EEPROM, thermal monitor, VID controller
- Other IO
    	- Two Serial ports
    	- ProfiBus port

Add support for T1040/T1042 RDB board:
    -add device tree
    -add entry in Kconfig to build
    -Add entry in corenet_generic.c, as it is similar to other corenet =
platforms

Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
changes for v4: Updated cpld compatible string field

changes for v3: Incorporated Scott comments on moving cpld compatible
 field to board specific file as cpld binaries are different

changes for v2: Incorporated Scott comments on using common name
 for compatible string for cpld as register set is same

 arch/powerpc/boot/dts/t1040rdb.dts            |   48 ++++++++
 arch/powerpc/boot/dts/t1042rdb.dts            |   48 ++++++++
 arch/powerpc/boot/dts/t104xrdb.dtsi           |  156 +++++++++++++++++=
++++++++
 arch/powerpc/platforms/85xx/Kconfig           |    2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c |    2 +
 5 files changed, 255 insertions(+), 1 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/t1040rdb.dts
 create mode 100644 arch/powerpc/boot/dts/t1042rdb.dts
 create mode 100644 arch/powerpc/boot/dts/t104xrdb.dtsi

diff --git a/arch/powerpc/boot/dts/t1040rdb.dts b/arch/powerpc/boot/dts=
/t1040rdb.dts
new file mode 100644
index 0000000..79a0bed
--- /dev/null
+++ b/arch/powerpc/boot/dts/t1040rdb.dts
@@ -0,0 +1,48 @@
+/*
+ * T1040RDB Device Tree Source
+ *
+ * Copyright 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions =
are met:
+ *     * Redistributions of source code must retain the above copyrigh=
t
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyr=
ight
+ *	 notice, this list of conditions and the following disclaimer in th=
e
+ *	 documentation and/or other materials provided with the distributio=
n.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote produc=
ts
+ *	 derived from this software without specific prior written permissi=
on.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of =
the
+ * GNU General Public License ("GPL") as published by the Free Softwar=
e
+ * Foundation, either version 2 of that License or (at your option) an=
y
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND AN=
Y
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE I=
MPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE =
ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR=
 ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL =
DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR =
SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CA=
USED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, =
OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "fsl/t104xsi-pre.dtsi"
+/include/ "t104xrdb.dtsi"
+
+/ {
+	model =3D "fsl,T1040RDB";
+	compatible =3D "fsl,T1040RDB";
+	ifc: localbus@ffe124000 {
+		cpld@3,0 {
+			compatible =3D "fsl,t1040rdb-cpld";
+		};
+	};
+};
+
+/include/ "fsl/t1040si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/t1042rdb.dts b/arch/powerpc/boot/dts=
/t1042rdb.dts
new file mode 100644
index 0000000..228a635
--- /dev/null
+++ b/arch/powerpc/boot/dts/t1042rdb.dts
@@ -0,0 +1,48 @@
+/*
+ * T1042RDB Device Tree Source
+ *
+ * Copyright 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions =
are met:
+ *     * Redistributions of source code must retain the above copyrigh=
t
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyr=
ight
+ *	 notice, this list of conditions and the following disclaimer in th=
e
+ *	 documentation and/or other materials provided with the distributio=
n.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote produc=
ts
+ *	 derived from this software without specific prior written permissi=
on.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of =
the
+ * GNU General Public License ("GPL") as published by the Free Softwar=
e
+ * Foundation, either version 2 of that License or (at your option) an=
y
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND AN=
Y
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE I=
MPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE =
ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR=
 ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL =
DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR =
SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CA=
USED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, =
OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "fsl/t104xsi-pre.dtsi"
+/include/ "t104xrdb.dtsi"
+
+/ {
+	model =3D "fsl,T1042RDB";
+	compatible =3D "fsl,T1042RDB";
+	ifc: localbus@ffe124000 {
+		cpld@3,0 {
+			compatible =3D "fsl,t1042rdb-cpld";
+		};
+	};
+};
+
+/include/ "fsl/t1042si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/t104xrdb.dtsi b/arch/powerpc/boot/dt=
s/t104xrdb.dtsi
new file mode 100644
index 0000000..1cf0f3c
--- /dev/null
+++ b/arch/powerpc/boot/dts/t104xrdb.dtsi
@@ -0,0 +1,156 @@
+/*
+ * T1040RDB/T1042RDB Device Tree Source
+ *
+ * Copyright 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions =
are met:
+ *     * Redistributions of source code must retain the above copyrigh=
t
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyr=
ight
+ *	 notice, this list of conditions and the following disclaimer in th=
e
+ *	 documentation and/or other materials provided with the distributio=
n.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote produc=
ts
+ *	 derived from this software without specific prior written permissi=
on.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of =
the
+ * GNU General Public License ("GPL") as published by the Free Softwar=
e
+ * Foundation, either version 2 of that License or (at your option) an=
y
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND AN=
Y
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE I=
MPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE =
ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR=
 ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL =
DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR =
SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CA=
USED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, =
OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/ {
+
+	ifc: localbus@ffe124000 {
+		reg =3D <0xf 0xfe124000 0 0x2000>;
+		ranges =3D <0 0 0xf 0xe8000000 0x08000000
+			  2 0 0xf 0xff800000 0x00010000
+			  3 0 0xf 0xffdf0000 0x00008000>;
+
+		nor@0,0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			compatible =3D "cfi-flash";
+			reg =3D <0x0 0x0 0x8000000>;
+			bank-width =3D <2>;
+			device-width =3D <1>;
+		};
+
+		nand@2,0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			compatible =3D "fsl,ifc-nand";
+			reg =3D <0x2 0x0 0x10000>;
+		};
+
+		cpld@3,0 {
+			reg =3D <3 0 0x300>;
+		};
+	};
+
+	memory {
+		device_type =3D "memory";
+	};
+
+	dcsr: dcsr@f00000000 {
+		ranges =3D <0x00000000 0xf 0x00000000 0x01072000>;
+	};
+
+	soc: soc@ffe000000 {
+		ranges =3D <0x00000000 0xf 0xfe000000 0x1000000>;
+		reg =3D <0xf 0xfe000000 0 0x00001000>;
+
+		spi@110000 {
+			flash@0 {
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				compatible =3D "micron,n25q512a";
+				reg =3D <0>;
+				spi-max-frequency =3D <10000000>; /* input clock */
+			};
+		};
+
+		i2c@118100 {
+			pca9546@77 {
+				compatible =3D "nxp,pca9546";
+				reg =3D <0x77>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+			};
+		};
+
+	};
+
+	pci0: pcie@ffe240000 {
+		reg =3D <0xf 0xfe240000 0 0x10000>;
+		ranges =3D <0x02000000 0 0xe0000000 0xc 0x00000000 0x0 0x10000000
+			  0x01000000 0 0x00000000 0xf 0xf8000000 0x0 0x00010000>;
+		pcie@0 {
+			ranges =3D <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci1: pcie@ffe250000 {
+		reg =3D <0xf 0xfe250000 0 0x10000>;
+		ranges =3D <0x02000000 0x0 0xe0000000 0xc 0x10000000 0x0 0x10000000
+			  0x01000000 0x0 0x00000000 0xf 0xf8010000 0x0 0x00010000>;
+		pcie@0 {
+			ranges =3D <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci2: pcie@ffe260000 {
+		reg =3D <0xf 0xfe260000 0 0x10000>;
+		ranges =3D <0x02000000 0 0xe0000000 0xc 0x20000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xf 0xf8020000 0 0x00010000>;
+		pcie@0 {
+			ranges =3D <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+
+	pci3: pcie@ffe270000 {
+		reg =3D <0xf 0xfe270000 0 0x10000>;
+		ranges =3D <0x02000000 0 0xe0000000 0xc 0x30000000 0 0x10000000
+			  0x01000000 0 0x00000000 0xf 0xf8030000 0 0x00010000>;
+		pcie@0 {
+			ranges =3D <0x02000000 0 0xe0000000
+				  0x02000000 0 0xe0000000
+				  0 0x10000000
+
+				  0x01000000 0 0x00000000
+				  0x01000000 0 0x00000000
+				  0 0x00010000>;
+		};
+	};
+};
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platfor=
ms/85xx/Kconfig
index 5063696..157a1a4 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -276,7 +276,7 @@ config CORENET_GENERIC
 	  For 64bit kernel, the following boards are supported:
 	    T208x QDS, T4240 QDS/RDB and B4 QDS
 	  The following boards are supported for both 32bit and 64bit kernel:
-	    P5020 DS, P5040 DS and T104xQDS
+	    P5020 DS, P5040 DS and T104xQDS/RDB
=20
 endif # FSL_SOC_BOOKE
=20
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/power=
pc/platforms/85xx/corenet_generic.c
index 4f22ad1..c268f89 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -128,6 +128,8 @@ static const char * const boards[] __initconst =3D =
{
 	"fsl,B4220QDS",
 	"fsl,T1040QDS",
 	"fsl,T1042QDS",
+	"fsl,T1040RDB",
+	"fsl,T1042RDB",
 	"keymile,kmcoge4",
 	NULL
 };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
