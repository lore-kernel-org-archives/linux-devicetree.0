From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/9] rc: sunxi-cir: Add support for an optional
 reset controller
Date: Thu, 20 Nov 2014 16:55:23 +0100
Message-ID: <1416498928-1300-5-git-send-email-hdegoede@redhat.com>
References: <1416498928-1300-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBA46XCRQKGQEEHLJE4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1416498928-1300-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On sun6i the cir block is attached to the reset controller, add support
for de-asserting the reset if a reset controller is specified in dt.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/media/rc/sunxi-cir.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index bcee8e1..895fb65 100644
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
