From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH RESEND 1/2] dmaengine: sun6i: make gate bit in
 sun8i's DMA engines a common quirk
Date: Tue, 29 Aug 2017 12:51:26 +0800
Message-ID: <20170829045127.19951-2-icenowy@aosc.io>
References: <20170829045127.19951-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB37FSPGQKGQE62TGUCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170829045127.19951-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

Originally we enable a special gate bit when the compatible indicates
A23/33.

But according to BSP sources and user manuals, more SoCs will need this
gate bit.

So make it a common quirk configured in the config struct.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a2358780ab2c..252b59c1d1d5 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -101,6 +101,17 @@ struct sun6i_dma_config {
 	u32 nr_max_channels;
 	u32 nr_max_requests;
 	u32 nr_max_vchans;
+	/*
+	 * In the datasheets/user manuals of newer Allwinner SoCs, a special
+	 * bit (bit 2 at register 0x20) is present.
+	 * It's named "DMA MCLK interface circuit auto gating bit" in the
+	 * documents, and the footnote of this register says that this bit
+	 * should be set up when initializing the DMA controller.
+	 * Allwinner A23/A33 user manuals do not have this bit documented,
+	 * however these SoCs really have and need this bit, as seen in the
+	 * BSP kernel source code.
+	 */
+	bool gate_needed;
 };
 
 /*
@@ -1009,6 +1020,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.nr_max_channels = 8,
 	.nr_max_requests = 24,
 	.nr_max_vchans   = 37,
+	.gate_needed	 = true,
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1174,13 +1186,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		goto err_dma_unregister;
 	}
 
-	/*
-	 * sun8i variant requires us to toggle a dma gating register,
-	 * as seen in Allwinner's SDK. This register is not documented
-	 * in the A23 user manual.
-	 */
-	if (of_device_is_compatible(pdev->dev.of_node,
-				    "allwinner,sun8i-a23-dma"))
+	if (sdc->cfg->gate_needed)
 		writel(SUN8I_DMA_GATE_ENABLE, sdc->base + SUN8I_DMA_GATE);
 
 	return 0;
-- 
2.13.5
