From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v2 02/10] dmaengine: sun6i: Correct burst length
 field offsets for H3
Date: Sun, 17 Sep 2017 05:19:48 +0200
Message-ID: <20170917031956.28010-3-stefan.bruens@rwth-aachen.de>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBZWT67GQKGQE2TCMI2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170917031956.28010-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For the H3, the burst lengths field offsets in the channel configuration
register differs from earlier SoC generations.

Using the A31 register macros actually configured the H3 controller
do to bursts of length 1 always, which although working leads to higher
bus utilisation.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 45bcd5271d94..a6fc066a0ac6 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -68,13 +68,15 @@
 #define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & 0x1f)
 #define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
 #define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
-#define DMA_CHAN_CFG_SRC_BURST(x)	(((x) & 0x3) << 7)
+#define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
+#define DMA_CHAN_CFG_SRC_BURST_H3(x)	(((x) & 0x3) << 6)
 #define DMA_CHAN_CFG_SRC_WIDTH(x)	(((x) & 0x3) << 9)
=20
 #define DMA_CHAN_CFG_DST_DRQ(x)		(DMA_CHAN_CFG_SRC_DRQ(x) << 16)
 #define DMA_CHAN_CFG_DST_IO_MODE	(DMA_CHAN_CFG_SRC_IO_MODE << 16)
 #define DMA_CHAN_CFG_DST_LINEAR_MODE	(DMA_CHAN_CFG_SRC_LINEAR_MODE << 16)
-#define DMA_CHAN_CFG_DST_BURST(x)	(DMA_CHAN_CFG_SRC_BURST(x) << 16)
+#define DMA_CHAN_CFG_DST_BURST_A31(x)	(DMA_CHAN_CFG_SRC_BURST_A31(x) << 16=
)
+#define DMA_CHAN_CFG_DST_BURST_H3(x)	(DMA_CHAN_CFG_SRC_BURST_H3(x) << 16)
 #define DMA_CHAN_CFG_DST_WIDTH(x)	(DMA_CHAN_CFG_SRC_WIDTH(x) << 16)
=20
 #define DMA_CHAN_CUR_SRC	0x10
@@ -115,6 +117,7 @@ struct sun6i_dma_config {
 	 * BSP kernel source code.
 	 */
 	void (*clock_autogate_enable)();
+	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 };
=20
 /*
@@ -284,6 +287,18 @@ static void sun6i_enable_clock_autogate_h3(struct sun6=
i_dma_dev *sdev)
 	writel(SUNXI_H3_DMA_GATE_ENABLE, sdev->base + SUNXI_H3_DMA_GATE);
 }
=20
+static void sun6i_set_burst_length_a31(u32 *p_cfg, s8 src_burst, s8 dst_bu=
rst)
+{
+	*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_A31(src_burst) |
+		  DMA_CHAN_CFG_DST_BURST_A31(dst_burst);
+}
+
+static void sun6i_set_burst_length_h3(u32 *p_cfg, s8 src_burst, s8 dst_bur=
st)
+{
+	*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_H3(src_burst) |
+		  DMA_CHAN_CFG_DST_BURST_H3(dst_burst);
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd =3D pchan->desc;
@@ -563,11 +578,11 @@ static int set_config(struct sun6i_dma_dev *sdev,
 	if (dst_width < 0)
 		return dst_width;
=20
-	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
-		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
-		DMA_CHAN_CFG_DST_BURST(dst_burst) |
+	*p_cfg =3D DMA_CHAN_CFG_SRC_WIDTH(src_width) |
 		DMA_CHAN_CFG_DST_WIDTH(dst_width);
=20
+	sdev->cfg->set_burst_length(p_cfg, src_burst, dst_burst);
+
 	return 0;
 }
=20
@@ -610,11 +625,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep=
_dma_memcpy(
 		DMA_CHAN_CFG_DST_DRQ(DRQ_SDRAM) |
 		DMA_CHAN_CFG_DST_LINEAR_MODE |
 		DMA_CHAN_CFG_SRC_LINEAR_MODE |
-		DMA_CHAN_CFG_SRC_BURST(burst) |
 		DMA_CHAN_CFG_SRC_WIDTH(width) |
-		DMA_CHAN_CFG_DST_BURST(burst) |
 		DMA_CHAN_CFG_DST_WIDTH(width);
=20
+	sdev->cfg->set_burst_length(v_lli->cfg, burst, burst);
+
 	sun6i_dma_lli_add(NULL, v_lli, p_lli, txd);
=20
 	sun6i_dma_dump_lli(vchan, v_lli);
@@ -1027,6 +1042,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg =3D =
{
 	.nr_max_requests =3D 30,
 	.nr_max_vchans   =3D 53,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_noop;
+	.set_burst_length =3D sun6i_set_burst_length_a31;
 };
=20
 /*
@@ -1039,6 +1055,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg =3D =
{
 	.nr_max_requests =3D 24,
 	.nr_max_vchans   =3D 37,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
+	.set_burst_length =3D sun6i_set_burst_length_a31;
 };
=20
 static struct sun6i_dma_config sun8i_a83t_dma_cfg =3D {
@@ -1046,13 +1063,12 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg =
=3D {
 	.nr_max_requests =3D 28,
 	.nr_max_vchans   =3D 39,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
+	.set_burst_length =3D sun6i_set_burst_length_a31;
 };
=20
 /*
  * The H3 has 12 physical channels, a maximum DRQ port id of 27,
  * and a total of 34 usable source and destination endpoints.
- * It also supports additional burst lengths and bus widths,
- * and the burst length fields have different offsets.
  */
=20
 static struct sun6i_dma_config sun8i_h3_dma_cfg =3D {
@@ -1060,6 +1076,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =3D {
 	.nr_max_requests =3D 27,
 	.nr_max_vchans   =3D 34,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3;
+	.set_burst_length =3D sun6i_set_burst_length_h3;
 };
=20
 /*
@@ -1072,6 +1089,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg =3D =
{
 	.nr_max_requests =3D 23,
 	.nr_max_vchans   =3D 24,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
+	.set_burst_length =3D sun6i_set_burst_length_a31;
 };
=20
 static const struct of_device_id sun6i_dma_match[] =3D {
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
