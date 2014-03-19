From: y@karo-electronics.de
Subject: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Wed, 19 Mar 2014 14:23:26 +0100
Message-ID: <40488.3879273713$1395235612@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Huang Shijie <b32955@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=46rom: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>

With a flash-based BBT there is no reason to move the Factory Bad
Block Marker from the data area buffer (to where it is mapped by the
GPMI NAND controller) to the OOB buffer. Thus, make this feature
configurable via DT. This is required for the Ka-Ro electronics
platforms.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt |    3 +++
 arch/arm/boot/dts/imx28-tx28.dts                    |    1 +
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c              |   10 +++++++---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Docu=
mentation/devicetree/bindings/mtd/gpmi-nand.txt
index 458d596..f28949a 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -25,6 +25,9 @@ Optional properties:
                        discoverable or this property is not enabled,
                        the software may chooses an implementation-defi=
ned
                        ECC scheme.
+  - fsl,no-blockmark-swap: Don't swap the bad block marker from the OO=
B
+                       area with the byte in the data area but rely on=
 the
+                       BBT for identifying bad blocks.
=20
 The device tree may optionally contain sub-nodes describing partitions=
 of the
 address space. See partition.txt for more detail.
diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28=
-tx28.dts
index e14bd86..7d2bea8 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -247,6 +247,7 @@
 &gpmi {
 	pinctrl-0 =3D <&gpmi_pins_a &gpmi_status_cfg>;
 	nand-on-flash-bbt;
+	fsl,no-blockmark-swap;
 	status =3D "okay";
 };
=20
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
index bb77f75..98562eb 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1632,9 +1632,6 @@ static int gpmi_init_last(struct gpmi_nand_data *=
this)
 	struct bch_geometry *bch_geo =3D &this->bch_geometry;
 	int ret;
=20
-	/* Set up swap_block_mark, must be set before the gpmi_set_geometry()=
 */
-	this->swap_block_mark =3D !GPMI_IS_MX23(this);
-
 	/* Set up the medium geometry */
 	ret =3D gpmi_set_geometry(this);
 	if (ret)
@@ -1701,6 +1698,13 @@ static int gpmi_nand_init(struct gpmi_nand_data =
*this)
 	if (of_get_nand_on_flash_bbt(this->dev->of_node))
 		chip->bbt_options |=3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
=20
+	/* Set up swap_block_mark, must be set before the gpmi_set_geometry()=
 */
+	if (!of_property_read_bool(this->dev->of_node, "fsl,no-blockmark-swap=
"))
+		this->swap_block_mark =3D !GPMI_IS_MX23(this);
+
+	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
+		this->swap_block_mark ? "en" : "dis");
+
 	/*
 	 * Allocate a temporary DMA buffer for reading ID in the
 	 * nand_scan_ident().
--=20
1.7.10.4

