From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 08/10] dmaengine: sun6i: Add support for
 Allwinner A64 and compatibles
Date: Mon, 4 Sep 2017 00:40:59 +0200
Message-ID: <20170903224100.17893-9-stefan.bruens@rwth-aachen.de>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBCUKWLGQKGQEXXHRX2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The A64 SoC has the same dma engine as the H3 (sun8i), with a
reduced amount of physical channels. To allow future reuse of the
compatible, leave the channel count etc. in the config data blank
and retrieve it from the devicetree.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index bd4c2e4a759b..4fae7ffad549 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1076,6 +1076,16 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =3D =
{
 	.nr_max_vchans   =3D 34,
 	.dmac_variant    =3D DMAC_VARIANT_H3,
 };
+
+/*
+ * The A64 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
+	.nr_max_channels =3D 0,
+	.nr_max_requests =3D 0,
+	.nr_max_vchans   =3D 0,
+	.dmac_variant    =3D DMAC_VARIANT_H3,
 };
=20
 static const struct of_device_id sun6i_dma_match[] =3D {
@@ -1083,6 +1093,7 @@ static const struct of_device_id sun6i_dma_match[] =
=3D {
 	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_dma_cfg=
 },
 	{ .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a83t_dma_c=
fg },
 	{ .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_dma_cfg }=
,
+	{ .compatible =3D "allwinner,sun50i-a64-dma", .data =3D &sun50i_a64_dma_c=
fg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);
@@ -1090,6 +1101,7 @@ MODULE_DEVICE_TABLE(of, sun6i_dma_match);
 static int sun6i_dma_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *device;
+	struct device_node *np =3D pdev->dev.of_node;
 	struct sun6i_dma_dev *sdc;
 	struct resource *res;
 	int ret, i;
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
