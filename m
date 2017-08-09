From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 4/4] drivers: soc: sunxi: add support for A64
 and its SRAM C
Date: Wed,  9 Aug 2017 16:56:27 +0800
Message-ID: <20170809085627.32687-5-icenowy@aosc.io>
References: <20170809085627.32687-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCE5VPGAKGQE67VOHQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170809085627.32687-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner A64's display engine claims the SRAM C section to work.

Add support for the A64 SRAM controller and the SRAM C section of it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index edc993480020..882be5ed7e84 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -69,6 +69,12 @@ static struct sunxi_sram_desc sun4i_a10_sram_d = {
 				  SUNXI_SRAM_MAP(1, 1, "usb-otg")),
 };
 
+static struct sunxi_sram_desc sun50i_a64_sram_c = {
+	.data	= SUNXI_SRAM_DATA("C", 0x4, 24, 1,
+				  SUNXI_SRAM_MAP(0, 1, "cpu"),
+				  SUNXI_SRAM_MAP(1, 0, "de2")),
+};
+
 static const struct of_device_id sunxi_sram_dt_ids[] = {
 	{
 		.compatible	= "allwinner,sun4i-a10-sram-a3-a4",
@@ -78,6 +84,10 @@ static const struct of_device_id sunxi_sram_dt_ids[] = {
 		.compatible	= "allwinner,sun4i-a10-sram-d",
 		.data		= &sun4i_a10_sram_d.data,
 	},
+	{
+		.compatible	= "allwinner,sun50i-a64-sram-c",
+		.data		= &sun50i_a64_sram_c.data,
+	},
 	{}
 };
 
@@ -295,6 +305,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 
 static const struct of_device_id sunxi_sram_dt_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-sram-controller" },
+	{ .compatible = "allwinner,sun50i-a64-sram-controller" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
-- 
2.13.0
