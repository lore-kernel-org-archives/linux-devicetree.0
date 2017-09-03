From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 04/10] dmaengine: sun6i: Enable additional burst
 lengths/widths on H3
Date: Mon, 4 Sep 2017 00:40:55 +0200
Message-ID: <20170903224100.17893-5-stefan.bruens@rwth-aachen.de>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBB4KWLGQKGQEBI7NTPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The H3 supports bursts lengths of 1, 4, 8 and 16 transfers, each with
a width of 1, 2, 4 or 8 bytes.

The register value for the the width is log2-encoded, change the
conversion function to provide the correct value for width =3D=3D 8.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c5644bd0f91a..335a8ec88b0b 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -263,8 +263,12 @@ static inline s8 convert_burst(u32 maxburst)
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
@@ -272,7 +276,7 @@ static inline s8 convert_burst(u32 maxburst)
=20
 static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
 {
-	return addr_width >> 1;
+	return ilog2(addr_width);
 }
=20
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
@@ -1152,6 +1156,12 @@ static int sun6i_dma_probe(struct platform_device *p=
dev)
 						  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	sdc->src_burst_lengths			=3D BIT(1) | BIT(8);
 	sdc->dst_burst_lengths			=3D BIT(1) | BIT(8);
+	if (sdc->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3) {
+		sdc->slave.src_addr_widths |=3D BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
+		sdc->slave.dst_addr_widths |=3D BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
+		sdc->src_burst_lengths     |=3D BIT(4) | BIT(16);
+		sdc->dst_burst_lengths     |=3D BIT(4) | BIT(16);
+	}
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
