From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sunxi: fix wrong irq_banks number
 for H5 pinctrl
Date: Fri, 11 Aug 2017 22:27:34 +0800
Message-ID: <20170811142735.2970-2-icenowy@aosc.io>
References: <20170811142735.2970-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB4H5W3GAKGQEOUWYYBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170811142735.2970-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pin controller of Allwinner H5 has three IRQ banks, however in old
versions of drivers and device trees, only two are set, which makes
PG bank IRQ not available.

If it's directly set to 3, the old device trees will fail to boot.

Add a workaround (and a warning) for older device trees, and allow new
device trees to use correct 3 IRQ banks.

Fixes: 838adb576d4a ("drivers: pinctrl: add driver for Allwinner H5 SoC")
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
index ccf9419e9418..97b48336f84a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-sunxi.h"
@@ -530,17 +531,36 @@ static const struct sunxi_desc_pin sun50i_h5_pins[] = {
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),	/* PG_EINT13 */
 };
 
-static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data = {
+static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data_broken = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 2,
 	.irq_read_needs_mux = true
 };
 
+static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data = {
+	.pins = sun50i_h5_pins,
+	.npins = ARRAY_SIZE(sun50i_h5_pins),
+	.irq_banks = 3,
+	.irq_read_needs_mux = true
+};
+
 static int sun50i_h5_pinctrl_probe(struct platform_device *pdev)
 {
-	return sunxi_pinctrl_init(pdev,
-				  &sun50i_h5_pinctrl_data);
+	switch (of_irq_count(pdev->dev.of_node)) {
+	case 2:
+		dev_warn(&pdev->dev,
+			 "Your device tree's pinctrl node is broken, which has no IRQ of PG bank routed.\n");
+		dev_warn(&pdev->dev,
+			 "Please update the device tree, otherwise PG bank IRQ won't work.\n");
+		return sunxi_pinctrl_init(pdev,
+					  &sun50i_h5_pinctrl_data_broken);
+	case 3:
+		return sunxi_pinctrl_init(pdev,
+					  &sun50i_h5_pinctrl_data);
+	default:
+		return -EINVAL;
+	}
 }
 
 static const struct of_device_id sun50i_h5_pinctrl_match[] = {
-- 
2.13.0
