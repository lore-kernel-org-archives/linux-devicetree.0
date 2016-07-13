From: =?UTF-8?q?Otto=20Kek=C3=A4l=C3=A4inen?= <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
Subject: [PATCH] Fix spelling errors in Documentation/devicetree
Date: Wed, 13 Jul 2016 21:08:07 +0300
Message-ID: <1468433287-12978-1-git-send-email-otto@seravo.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Otto=20Kek=C3=A4l=C3=A4inen?= <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Otto Kek=C3=A4l=C3=A4inen <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
---

I sent this originally to trivial@, but they adviced to submit this dir=
ectly to you.
Please apply. Thank you!

 Documentation/devicetree/bindings/arm/l2c2x0.txt   |    4 ++--
 Documentation/devicetree/bindings/net/dsa/dsa.txt  |    2 +-
 .../devicetree/bindings/powerpc/fsl/fman.txt       |    4 ++--
 .../devicetree/bindings/regmap/regmap.txt          |    2 +-
 .../devicetree/bindings/serial/qcom,msm-uartdm.txt |    4 ++--
 .../devicetree/bindings/sound/simple-card.txt      |    2 +-
 Documentation/devicetree/bindings/spi/ti_qspi.txt  |    2 +-
 .../bindings/timer/allwinner,sun5i-a13-hstimer.txt |    2 +-

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documen=
tation/devicetree/bindings/arm/l2c2x0.txt
index c453ab5..917199f 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
@@ -86,10 +86,10 @@ Optional properties:
   firmware)
 - arm,dynamic-clock-gating : L2 dynamic clock gating. Value: <0> (forc=
ibly
   disable), <1> (forcibly enable), property absent (OS specific behavi=
or,
-  preferrably retain firmware settings)
+  preferably retain firmware settings)
 - arm,standby-mode: L2 standby mode enable. Value <0> (forcibly disabl=
e),
   <1> (forcibly enable), property absent (OS specific behavior,
-  preferrably retain firmware settings)
+  preferably retain firmware settings)
=20
 Example:
=20
diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Docume=
ntation/devicetree/bindings/net/dsa/dsa.txt
index 9f4807f..eb13eaf 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.txt
@@ -43,7 +43,7 @@ Each port children node must have the following manda=
tory properties:
 Note that a port labelled "dsa" will imply checking for the uplink pha=
ndle
 described below.
=20
-Optionnal property:
+Optional property:
 - link			: Should be a list of phandles to another switch's DSA port.
 			  This property is only used when switches are being
 			  chained/cascaded together. This port is used as outgoing port
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/D=
ocumentation/devicetree/bindings/powerpc/fsl/fman.txt
index 55c2c03..df873d1 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
@@ -35,7 +35,7 @@ PROPERTIES
 		Definition: Specifies the index of the FMan unit.
=20
 		The cell-index value may be used by the SoC, to identify the
-		FMan unit in the SoC memory map. In the table bellow,
+		FMan unit in the SoC memory map. In the table below,
 		there's a description of the cell-index use in each SoC:
=20
 		- P1023:
@@ -247,7 +247,7 @@ PROPERTIES
=20
 		The cell-index value may be used by the FMan or the SoC, to
 		identify the MAC unit in the FMan (or SoC) memory map.
-		In the tables bellow there's a description of the cell-index
+		In the tables below there's a description of the cell-index
 		use, there are two tables, one describes the use of cell-index
 		by the FMan, the second describes the use by the SoC:
=20
diff --git a/Documentation/devicetree/bindings/regmap/regmap.txt b/Docu=
mentation/devicetree/bindings/regmap/regmap.txt
index 0127be3..873096b 100644
--- a/Documentation/devicetree/bindings/regmap/regmap.txt
+++ b/Documentation/devicetree/bindings/regmap/regmap.txt
@@ -14,7 +14,7 @@ architectures that typically run big-endian operating=
 systems
 be marked that way in the devicetree.
=20
 On SoCs that can be operated in both big-endian and little-endian
-modes, with a single hardware switch controlling both the endianess
+modes, with a single hardware switch controlling both the endianness
 of the CPU and a byteswap for MMIO registers (e.g. many Broadcom MIPS
 chips), "native-endian" is used to allow using the same device tree
 blob in both cases.
diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.t=
xt b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
index 182777f..d5f73b8 100644
--- a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
@@ -28,10 +28,10 @@ Optional properties:
 - dma-names: Should contain "tx" for transmit and "rx" for receive cha=
nnels
 - qcom,tx-crci: Identificator <u32> for Client Rate Control Interface =
to be
            used with TX DMA channel. Required when using DMA for trans=
mission
-           with UARTDM v1.3 and bellow.
+           with UARTDM v1.3 and below.
 - qcom,rx-crci: Identificator <u32> for Client Rate Control Interface =
to be
            used with RX DMA channel. Required when using DMA for recep=
tion
-           with UARTDM v1.3 and bellow.
+           with UARTDM v1.3 and below.
=20
 Note: Aliases may be defined to ensure the correct ordering of the UAR=
Ts.
 The alias serialN will result in the UART being assigned port N.  If a=
ny
diff --git a/Documentation/devicetree/bindings/sound/simple-card.txt b/=
Documentation/devicetree/bindings/sound/simple-card.txt
index cf3979e..59d8628 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.txt
+++ b/Documentation/devicetree/bindings/sound/simple-card.txt
@@ -30,7 +30,7 @@ Optional subnodes:
 					  sub-nodes. This container may be
 					  omitted when the card has only one
 					  DAI link. See the examples and the
-					  section bellow.
+					  section below.
=20
 Dai-link subnode properties and subnodes:
=20
diff --git a/Documentation/devicetree/bindings/spi/ti_qspi.txt b/Docume=
ntation/devicetree/bindings/spi/ti_qspi.txt
index 50b14f6..e65fde4 100644
--- a/Documentation/devicetree/bindings/spi/ti_qspi.txt
+++ b/Documentation/devicetree/bindings/spi/ti_qspi.txt
@@ -20,7 +20,7 @@ Optional properties:
 		      chipselect register and offset of that register.
=20
 NOTE: TI QSPI controller requires different pinmux and IODelay
-paramaters for Mode-0 and Mode-3 operations, which needs to be set up =
by
+parameters for Mode-0 and Mode-3 operations, which needs to be set up =
by
 the bootloader (U-Boot). Default configuration only supports Mode-0
 operation. Hence, "spi-cpol" and "spi-cpha" DT properties cannot be
 specified in the slave nodes of TI QSPI controller without appropriate
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a1=
3-hstimer.txt b/Documentation/devicetree/bindings/timer/allwinner,sun5i=
-a13-hstimer.txt
index 27cfc7d..8d6e4fd 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstim=
er.txt
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstim=
er.txt
@@ -9,7 +9,7 @@ Required properties:
 		one)
 - clocks: phandle to the source clock (usually the AHB clock)
=20
-Optionnal properties:
+Optional properties:
 - resets: phandle to a reset controller asserting the timer
=20
 Example:
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
