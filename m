From: y@karo-electronics.de
Subject: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Wed, 19 Mar 2014 14:23:26 +0100
Message-ID: <24456.665540538$1395235615@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=46rom: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>

With a flash-based BBT there is no reason to move the Factory Bad
Block Marker from the data area buffer (to where it is mapped by the
GPMI NAND controller) to the OOB buffer. Thus, make this feature
configurable via DT. This is required for the Ka-Ro electronics
platforms.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
