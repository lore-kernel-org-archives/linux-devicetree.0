From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Thu, 2 Jun 2016 09:47:18 +0200
Message-ID: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>David Woodhouse <dwmw2@infradead.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Devicetree bindings for the driver for the Evatronix NANDFLASH-CTRL NAN=
D flash
controller IP.  This controller is used in the Axis ARTPEC-6 SoC.

The driver supports BCH ECC using the controller's hardware, but there =
is
also an option to use software BCH ECC. However, the ECC layouts are no=
t
compatible so it's not possible to mix them. The main advantage to usin=
g
software ECC is that there are more OOB bytes free, as the hardware is
slightly wasteful on OOB space.

BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is supp=
orted.

Only large-page flash chips are supported, using 4 or 5 address cycles.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 .../devicetree/bindings/mtd/evatronix-nand.txt     |   44 ++++++++++++=
++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-nan=
d.txt

diff --git a/Documentation/devicetree/bindings/mtd/evatronix-nand.txt b=
/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
new file mode 100644
index 0000000..7ceb95a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
@@ -0,0 +1,44 @@
+Evatronix NANDFLASH-CTRL NAND flash controller
+
+Required properties:
+- compatible : "evatronix,nandflash-ctrl"
+- reg : specify bus address and register area size.
+- interrupts : controller interrupt number and irq type.
+- nand-ecc-mode : See nand.txt. Supported values "hw", "soft".
+- nand-ecc-algo : See nand.txt. Supported value "bch".
+- nand-ecc-strength : See nand.txt. Supported values: 4, 8, 16, 24, 32=
=2E
+- nand-ecc-step-size : See nand.txt. Supported values: 256, 512, 1024.
+
+Optional properties:
+- nand-on-flash-bbt: See nand.txt.
+- #address-cells, #size-cells: See partition.txt.
+- evatronix,use-bank-select : Use controller bank select function to a=
ccess
+			      multiple chips, rather than chip enable.
+- evatronix,rb-wired-and: Assume ready/busy signal from all flash chip=
s are
+			  connected using a wired-AND topology rather than
+			  individually.
+- evatronix,timings: Seven 32-bit values for initializing the TIME_SEQ=
_0,
+		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
+		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.
+
+Example:
+
+nand: nand@f801e000 {
+	compatible =3D "evatronix,nandflash-ctrl";
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	reg =3D <0xf801e000 0x0200>;
+	interrupts =3D <0 139 IRQ_TYPE_LEVEL_HIGH>;
+	/* ONFi mode 0 timing, assuming 100 MHz clock. */
+	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
+	 * TIME_GEN_SEQ_0, _1, _2, _3 */
+	evatronix,timings =3D <0x0d151533 0x000b0515 0x00000046
+			     0x00150000 0x00000000 0x00000005 0x00000015>;
+	nand-ecc-mode =3D "hw";
+	nand-ecc-algo =3D "bch";
+	nand-on-flash-bbt;
+	nand-ecc-strength =3D <8>;
+	nand-ecc-step-size =3D <512>;
+	evatronix,use-bank-select;
+	evatronix,rb-wired-and;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..4018162 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -83,6 +83,7 @@ epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
 ettus	NI Ettus Research
 eukrea  Eukr=C3=A9a Electromatique
+evatronix	Evatronix SA
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
--=20
1.7.10.4

--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
