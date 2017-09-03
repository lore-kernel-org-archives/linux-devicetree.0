From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 01/10] dmaengine: sun6i: Correct setting of
 clock autogating register for A83T/H3
Date: Mon, 4 Sep 2017 00:40:52 +0200
Message-ID: <20170903224100.17893-2-stefan.bruens@rwth-aachen.de>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBBEKWLGQKGQEE5AKFWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170903224100.17893-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The H83T uses a compatible string different from the A23, but requires
the same clock autogating register setting.

The H3 also requires setting the clock autogating register, but has
the register at a different offset.

Some currently available SoCs not yet supported by the sun6i-dma driver
will require new compatible strings. These SoCs either follow the A23
register model (e.g. V3s) or the H3 register model (A64, R40), so a new
variable is added to the config struct to group SoCs with common register
models.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a2358780ab2c..1d9b3be30d22 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -48,6 +48,9 @@
 #define SUN8I_DMA_GATE		0x20
 #define SUN8I_DMA_GATE_ENABLE	0x4
=20
+#define SUNXI_H3_SECURITE_REG		0x20
+#define SUNXI_H3_DMA_GATE		0x28
+#define SUNXI_H3_DMA_GATE_ENABLE	0x4
 /*
  * Channels specific registers
  */
@@ -90,6 +93,21 @@
 #define NORMAL_WAIT	8
 #define DRQ_SDRAM	1
=20
+/*
+ * DMA Controller generations
+ *
+ * Newer SoC generations changed or added some register definitions:
+ * - A23 added a clock gate register
+ * - H3 has a different offset for the clock gating register,
+ *   the burst length field has a different offset in the channel
+ *   configuration register, also additional burst lengths/widths.
+ */
+enum dmac_variant {
+	DMAC_VARIANT_A31,
+	DMAC_VARIANT_A23,
+	DMAC_VARIANT_H3,
+};
+
 /*
  * Hardware channels / ports representation
  *
@@ -101,6 +119,7 @@ struct sun6i_dma_config {
 	u32 nr_max_channels;
 	u32 nr_max_requests;
 	u32 nr_max_vchans;
+	enum dmac_variant dmac_variant;
 };
=20
 /*
@@ -998,6 +1017,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg =3D {
 	.nr_max_channels =3D 16,
 	.nr_max_requests =3D 30,
 	.nr_max_vchans   =3D 53,
+	.dmac_variant    =3D DMAC_VARIANT_A31,
 };
=20
 /*
@@ -1009,23 +1029,29 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg =
=3D {
 	.nr_max_channels =3D 8,
 	.nr_max_requests =3D 24,
 	.nr_max_vchans   =3D 37,
+	.dmac_variant    =3D DMAC_VARIANT_A23,
 };
=20
 static struct sun6i_dma_config sun8i_a83t_dma_cfg =3D {
 	.nr_max_channels =3D 8,
 	.nr_max_requests =3D 28,
 	.nr_max_vchans   =3D 39,
+	.dmac_variant    =3D DMAC_VARIANT_A23,
 };
=20
 /*
  * The H3 has 12 physical channels, a maximum DRQ port id of 27,
  * and a total of 34 usable source and destination endpoints.
+ * It also supports additional burst lengths and bus widths,
+ * and the burst length fields have different offsets.
  */
=20
 static struct sun6i_dma_config sun8i_h3_dma_cfg =3D {
 	.nr_max_channels =3D 12,
 	.nr_max_requests =3D 27,
 	.nr_max_vchans   =3D 34,
+	.dmac_variant    =3D DMAC_VARIANT_H3,
+};
 };
=20
 static const struct of_device_id sun6i_dma_match[] =3D {
@@ -1177,11 +1203,13 @@ static int sun6i_dma_probe(struct platform_device *=
pdev)
 	/*
 	 * sun8i variant requires us to toggle a dma gating register,
 	 * as seen in Allwinner's SDK. This register is not documented
-	 * in the A23 user manual.
+	 * in the A23 user manual, but appears in e.g. the H83T manual.
+	 * For the H3, H5 and A64, the register has a different location
 	 */
-	if (of_device_is_compatible(pdev->dev.of_node,
-				    "allwinner,sun8i-a23-dma"))
+	if (sdc->cfg->dmac_variant =3D=3D DMAC_VARIANT_A23)
 		writel(SUN8I_DMA_GATE_ENABLE, sdc->base + SUN8I_DMA_GATE);
+	else if (sdc->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3)
+		writel(SUNXI_H3_DMA_GATE_ENABLE, sdc->base + SUNXI_H3_DMA_GATE);
=20
 	return 0;
=20
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
