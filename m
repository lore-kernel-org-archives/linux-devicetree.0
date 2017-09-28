From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v4 04/11] dmaengine: sun6i: Enable additional
 burst lengths/widths on H3
Date: Thu, 28 Sep 2017 03:49:21 +0200
Message-ID: <fa51787d-9b5e-4905-bacb-34ec4f4d00a8@rwthex-w2-a.rwth-ad.de>
References: <20170928014928.2272-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBPFKWHHAKGQE6TQ3OWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170928014928.2272-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The H3 supports bursts lengths of 1, 4, 8 and 16 transfers, each with
a width of 1, 2, 4 or 8 bytes.

The register value for the the width is log2-encoded, change the
conversion function to provide the correct value for width =3D=3D 8.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

---

Changes in v4:
- Fix config initialization

Changes in v3: None
Changes in v2:
- Store burst widths in config

 drivers/dma/sun6i-dma.c | 54 ++++++++++++++++++++++++++++++++++++++++-----=
----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 24dc7fac7447..eb45ab39eddd 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -123,6 +123,8 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
+	u32 src_addr_widths;
+	u32 dst_addr_widths;
 };
=20
 /*
@@ -262,8 +264,12 @@ static inline s8 convert_burst(u32 maxburst)
 	switch (maxburst) {
 	case 1:
 		return 0;
+	case 4:
+		return 1;
 	case 8:
 		return 2;
+	case 16:
+		return 3;
 	default:
 		return -EINVAL;
 	}
@@ -271,7 +277,7 @@ static inline s8 convert_burst(u32 maxburst)
=20
 static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
 {
-	return addr_width >> 1;
+	return ilog2(addr_width);
 }
=20
 static void sun6i_enable_clock_autogate_a23(struct sun6i_dma_dev *sdev)
@@ -1043,6 +1049,12 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg =3D=
 {
 	.set_burst_length =3D sun6i_set_burst_length_a31,
 	.src_burst_lengths =3D BIT(1) | BIT(8),
 	.dst_burst_lengths =3D BIT(1) | BIT(8),
+	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
 };
=20
 /*
@@ -1058,6 +1070,12 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg =3D=
 {
 	.set_burst_length =3D sun6i_set_burst_length_a31,
 	.src_burst_lengths =3D BIT(1) | BIT(8),
 	.dst_burst_lengths =3D BIT(1) | BIT(8),
+	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
 };
=20
 static struct sun6i_dma_config sun8i_a83t_dma_cfg =3D {
@@ -1068,11 +1086,19 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg =
=3D {
 	.set_burst_length =3D sun6i_set_burst_length_a31,
 	.src_burst_lengths =3D BIT(1) | BIT(8),
 	.dst_burst_lengths =3D BIT(1) | BIT(8),
+	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
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
@@ -1081,8 +1107,16 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =3D =
{
 	.nr_max_vchans   =3D 34,
 	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3,
 	.set_burst_length =3D sun6i_set_burst_length_h3,
-	.src_burst_lengths =3D BIT(1) | BIT(8),
-	.dst_burst_lengths =3D BIT(1) | BIT(8),
+	.src_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 };
=20
 /*
@@ -1098,6 +1132,12 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg =3D=
 {
 	.set_burst_length =3D sun6i_set_burst_length_a31,
 	.src_burst_lengths =3D BIT(1) | BIT(8),
 	.dst_burst_lengths =3D BIT(1) | BIT(8),
+	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
 };
=20
 static const struct of_device_id sun6i_dma_match[] =3D {
@@ -1177,12 +1217,8 @@ static int sun6i_dma_probe(struct platform_device *p=
dev)
 	sdc->slave.device_pause			=3D sun6i_dma_pause;
 	sdc->slave.device_resume		=3D sun6i_dma_resume;
 	sdc->slave.device_terminate_all		=3D sun6i_dma_terminate_all;
-	sdc->slave.src_addr_widths		=3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
-						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
-						  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	sdc->slave.dst_addr_widths		=3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
-						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
-						  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
+	sdc->slave.src_addr_widths		=3D sdc->cfg->src_addr_widths;
+	sdc->slave.dst_addr_widths		=3D sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			=3D BIT(DMA_DEV_TO_MEM) |
 						  BIT(DMA_MEM_TO_DEV);
 	sdc->slave.residue_granularity		=3D DMA_RESIDUE_GRANULARITY_BURST;
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
