From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 2/4] musb: sunxi: add support for the variant in H3/V3s SoC
Date: Tue,  3 Jan 2017 23:25:32 +0800
Message-ID: <20170103152534.20118-3-icenowy@aosc.xyz>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103152534.20118-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bin Liu <b-liu@ti.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

Allwinner H3/V3s features a variant of MUSB controller, which lacks one
endpoint.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 .../bindings/usb/allwinner,sun4i-a10-musb.txt      |  4 +--
 drivers/usb/musb/sunxi.c                           | 35 ++++++++++++++++++++--
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
index 862cd7c79805..d9b42da016f3 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
@@ -2,8 +2,8 @@ Allwinner sun4i A10 musb DRC/OTG controller
 -------------------------------------------
 
 Required properties:
- - compatible      : "allwinner,sun4i-a10-musb", "allwinner,sun6i-a31-musb"
-                     or "allwinner,sun8i-a33-musb"
+ - compatible      : "allwinner,sun4i-a10-musb", "allwinner,sun6i-a31-musb",
+                     "allwinner,sun8i-a33-musb" or "allwinner,sun8i-h3-musb"
  - reg             : mmio address range of the musb controller
  - clocks          : clock specifier for the musb controller ahb gate clock
  - reset           : reset specifier for the ahb reset (A31 and newer only)
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index d0be0eadd0d9..48ecb1580817 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -645,6 +645,20 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg[] = {
 	MUSB_EP_FIFO_SINGLE(5, FIFO_RX, 512),
 };
 
+/* H3/V3s OTG supports only 4 endpoints */
+#define SUNXI_MUSB_MAX_EP_NUM_H3	5
+
+static struct musb_fifo_cfg sunxi_musb_mode_cfg_h3[] = {
+	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
+	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
+	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
+	MUSB_EP_FIFO_SINGLE(2, FIFO_RX, 512),
+	MUSB_EP_FIFO_SINGLE(3, FIFO_TX, 512),
+	MUSB_EP_FIFO_SINGLE(3, FIFO_RX, 512),
+	MUSB_EP_FIFO_SINGLE(4, FIFO_TX, 512),
+	MUSB_EP_FIFO_SINGLE(4, FIFO_RX, 512),
+};
+
 static struct musb_hdrc_config sunxi_musb_hdrc_config = {
 	.fifo_cfg       = sunxi_musb_mode_cfg,
 	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg),
@@ -656,6 +670,18 @@ static struct musb_hdrc_config sunxi_musb_hdrc_config = {
 	.dma		= 0,
 };
 
+static struct musb_hdrc_config sunxi_musb_hdrc_config_h3 = {
+	.fifo_cfg       = sunxi_musb_mode_cfg_h3,
+	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_h3),
+	.multipoint	= true,
+	.dyn_fifo	= true,
+	.soft_con       = true,
+	.num_eps	= SUNXI_MUSB_MAX_EP_NUM_H3,
+	.ram_bits	= SUNXI_MUSB_RAM_BITS,
+	.dma		= 0,
+};
+
+
 static int sunxi_musb_probe(struct platform_device *pdev)
 {
 	struct musb_hdrc_platform_data	pdata;
@@ -698,7 +724,10 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	pdata.platform_ops	= &sunxi_musb_ops;
-	pdata.config		= &sunxi_musb_hdrc_config;
+	if (!of_device_is_compatible(np, "allwinner,sun8i-h3-musb"))
+		pdata.config = &sunxi_musb_hdrc_config;
+	else
+		pdata.config = &sunxi_musb_hdrc_config_h3;
 
 	glue->dev = &pdev->dev;
 	INIT_WORK(&glue->work, sunxi_musb_work);
@@ -710,7 +739,8 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 
-	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb")) {
+	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
+	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb")) {
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
 	}
@@ -804,6 +834,7 @@ static const struct of_device_id sunxi_musb_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-musb", },
 	{ .compatible = "allwinner,sun6i-a31-musb", },
 	{ .compatible = "allwinner,sun8i-a33-musb", },
+	{ .compatible = "allwinner,sun8i-h3-musb", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_musb_match);
-- 
2.11.0
