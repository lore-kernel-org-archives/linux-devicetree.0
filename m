From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/2][v4] powerpc/fsl-booke: Add initial T1042RDB_PI board support
Date: Fri, 5 Sep 2014 16:15:00 +0530
Message-ID: <1409913900-21638-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T1042RDB_PI is Freescale Reference Design Board supporting the T1042
QorIQ Power Architecture=E2=84=A2 processor. T1042 is a reduced persona=
lity
of T1040 SoC without Integrated 8-port Gigabit. The board is designed
with low power features targeted for Printing Image Market.

T1042RDB_PI is  similar to T1040RDB board with few differences like
it has video interface, supports T1042 personality only

T1042RDB_PI board Overview
-----------------------
- SERDES Connections, 8 lanes supporting:
    	- PCI
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
    	- Device connected: EEPROM, thermal monitor, VID controller, RTC
- Other IO
    	- Two Serial ports
    	- ProfiBus port

Add support for T1042RDB_PI board:
    -add device tree
    -Add entry in corenet_generic.c, as it is similar to other corenet =
platforms

Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
changes for v4: Updated cpld compatible string field

changes for v3: Incorporated Scott comments on moving cpld compatible
 field to board specific file as cpld binaries are different

changes for v2: Incorporated Scott comments on using common name
 for compatible string for cpld as register set is same

 arch/powerpc/boot/dts/t1042rdb_pi.dts         |   57 +++++++++++++++++=
++++++++
 arch/powerpc/platforms/85xx/corenet_generic.c |    1 +
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/t1042rdb_pi.dts

diff --git a/arch/powerpc/boot/dts/t1042rdb_pi.dts b/arch/powerpc/boot/=
dts/t1042rdb_pi.dts
new file mode 100644
index 0000000..b9d0877
--- /dev/null
+++ b/arch/powerpc/boot/dts/t1042rdb_pi.dts
@@ -0,0 +1,57 @@
+/*
+ * T1042RDB_PI Device Tree Source
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
+	model =3D "fsl,T1042RDB_PI";
+	compatible =3D "fsl,T1042RDB_PI";
+	ifc: localbus@ffe124000 {
+		cpld@3,0 {
+			compatible =3D "fsl,t1042rdb_pi-cpld";
+		};
+	};
+	soc: soc@ffe000000 {
+		i2c@118000 {
+			rtc@68 {
+				compatible =3D "dallas,ds1337";
+				reg =3D <0x68>;
+				interrupts =3D <0x2 0x1 0 0>;
+			};
+		};
+	};
+};
+
+/include/ "fsl/t1042si-post.dtsi"
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/power=
pc/platforms/85xx/corenet_generic.c
index c268f89..100e80d 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -130,6 +130,7 @@ static const char * const boards[] __initconst =3D =
{
 	"fsl,T1042QDS",
 	"fsl,T1040RDB",
 	"fsl,T1042RDB",
+	"fsl,T1042RDB_PI",
 	"keymile,kmcoge4",
 	NULL
 };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
