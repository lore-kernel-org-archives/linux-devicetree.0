From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 2/3] dmaengine: sun6i: Add support for
 Allwinner A23 (sun8i) variant
Date: Thu, 18 Sep 2014 11:24:39 +0800
Message-ID: <1411010680-4481-3-git-send-email-wens@csie.org>
References: <1411010680-4481-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7VA5GQAKGQER62SXQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1411010680-4481-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A23 SoC has the same dma engine as the A31 (sun6i), with a
reduced amount of endpoints and physical channels. Add the proper
config data and compatible string to support it.

A slight difference in sun8i is an undocumented register needs
to be toggled for dma to function.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../devicetree/bindings/dma/sun6i-dma.txt          |  2 +-
 drivers/dma/Kconfig                                |  4 ++--
 drivers/dma/sun6i-dma.c                            | 27 ++++++++++++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
index 3e145c1..9cdcba24d 100644
--- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
@@ -4,7 +4,7 @@ This driver follows the generic DMA bindings defined in dma.txt.
 
 Required properties:
 
-- compatible:	Must be "allwinner,sun6i-a31-dma"
+- compatible:	Must be "allwinner,sun6i-a31-dma" or "allwinner,sun8i-a23-dma"
 - reg:		Should contain the registers base address and length
 - interrupts:	Should contain a reference to the interrupt used by this device
 - clocks:	Should contain a reference to the parent AHB clock
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 9b1ea0e..5361aa7 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -395,12 +395,12 @@ config XILINX_VDMA
 
 config DMA_SUN6I
 	tristate "Allwinner A31 SoCs DMA support"
-	depends on MACH_SUN6I || COMPILE_TEST
+	depends on MACH_SUN6I || MACH_SUN8I || COMPILE_TEST
 	depends on RESET_CONTROLLER
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-	  Support for the DMA engine for Allwinner A31 SoCs.
+	  Support for the DMA engine first found in Allwinner A31 SoCs.
 
 config NBPFAXI_DMA
 	tristate "Renesas Type-AXI NBPF DMA support"
diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 89ca0c4..cb9aa43 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -43,6 +43,12 @@
 #define DMA_STAT		0x30
 
 /*
+ * sun8i specific registers
+ */
+#define SUN8I_DMA_GATE		0x20
+#define SUN8I_DMA_GATE_ENABLE	0x4
+
+/*
  * Channels specific registers
  */
 #define DMA_CHAN_ENABLE		0x00
@@ -878,8 +884,20 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.nr_max_vchans   = 53,
 };
 
+/*
+ * The A23 only has 8 physical channels, a maximum DRQ port id of 24,
+ * and a total of 37 usable source and destination endpoints.
+ */
+
+static struct sun6i_dma_config sun8i_a23_dma_cfg = {
+	.nr_max_channels = 8,
+	.nr_max_requests = 24,
+	.nr_max_vchans   = 37,
+};
+
 static struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-dma", .data = &sun6i_a31_dma_cfg },
+	{ .compatible = "allwinner,sun8i-a23-dma", .data = &sun8i_a23_dma_cfg },
 	{ /* sentinel */ }
 };
 
@@ -1008,6 +1026,15 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		goto err_dma_unregister;
 	}
 
+	/*
+	 * sun8i variant requires us to toggle a dma gating register,
+	 * as seen in Allwinner's SDK. This register is not documented
+	 * in the A23 user manual.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun8i-a23-dma"))
+		writel(SUN8I_DMA_GATE_ENABLE, sdc->base + SUN8I_DMA_GATE);
+
 	return 0;
 
 err_dma_unregister:
-- 
2.1.0
