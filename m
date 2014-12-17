From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 04/13] rc: sunxi-cir: Add support for an
 optional reset controller
Date: Wed, 17 Dec 2014 18:18:15 +0100
Message-ID: <1418836704-15689-5-git-send-email-hdegoede@redhat.com>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB4PVY2SAKGQEMCADHSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1418836704-15689-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On sun6i the cir block is attached to the reset controller, add support
for de-asserting the reset if a reset controller is specified in dt.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/media/sunxi-ir.txt         |  2 ++
 drivers/media/rc/sunxi-cir.c                       | 25 ++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 23dd5ad..6b70b9b 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -10,6 +10,7 @@ Required properties:
 
 Optional properties:
 - linux,rc-map-name : Remote control map name.
+- resets : phandle + reset specifier pair
 
 Example:
 
@@ -17,6 +18,7 @@ ir0: ir@01c21800 {
 	compatible = "allwinner,sun4i-a10-ir";
 	clocks = <&apb0_gates 6>, <&ir0_clk>;
 	clock-names = "apb", "ir";
+	resets = <&apb0_rst 1>;
 	interrupts = <0 5 1>;
 	reg = <0x01C21800 0x40>;
 	linux,rc-map-name = "rc-rc6-mce";
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 340f7f5..06170e0 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -23,6 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/reset.h>
 #include <media/rc-core.h>
 
 #define SUNXI_IR_DEV "sunxi-ir"
@@ -95,6 +96,7 @@ struct sunxi_ir {
 	int             irq;
 	struct clk      *clk;
 	struct clk      *apb_clk;
+	struct reset_control *rst;
 	const char      *map_name;
 };
 
@@ -166,15 +168,29 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 		return PTR_ERR(ir->clk);
 	}
 
+	/* Reset (optional) */
+	ir->rst = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(ir->rst)) {
+		ret = PTR_ERR(ir->rst);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+		ir->rst = NULL;
+	} else {
+		ret = reset_control_deassert(ir->rst);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_set_rate(ir->clk, SUNXI_IR_BASE_CLK);
 	if (ret) {
 		dev_err(dev, "set ir base clock failed!\n");
-		return ret;
+		goto exit_reset_assert;
 	}
 
 	if (clk_prepare_enable(ir->apb_clk)) {
 		dev_err(dev, "try to enable apb_ir_clk failed\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto exit_reset_assert;
 	}
 
 	if (clk_prepare_enable(ir->clk)) {
@@ -271,6 +287,9 @@ exit_clkdisable_clk:
 	clk_disable_unprepare(ir->clk);
 exit_clkdisable_apb_clk:
 	clk_disable_unprepare(ir->apb_clk);
+exit_reset_assert:
+	if (ir->rst)
+		reset_control_assert(ir->rst);
 
 	return ret;
 }
@@ -282,6 +301,8 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ir->clk);
 	clk_disable_unprepare(ir->apb_clk);
+	if (ir->rst)
+		reset_control_assert(ir->rst);
 
 	spin_lock_irqsave(&ir->ir_lock, flags);
 	/* disable IR IRQ */
-- 
2.1.0
