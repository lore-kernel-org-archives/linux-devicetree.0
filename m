From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 05/13] rc: sunxi-cir: Add support for the
 larger fifo found on sun5i and sun6i
Date: Wed, 17 Dec 2014 18:18:16 +0100
Message-ID: <1418836704-15689-6-git-send-email-hdegoede@redhat.com>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB47VY2SAKGQEN5ADS6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Add support for the larger fifo found on sun5i and sun6i, having a separate
compatible for the ir found on sun5i & sun6i also is useful if we ever want
to add ir transmit support, because the sun5i & sun6i version do not have
transmit support.

Note this commits also adds checking for the end-of-packet interrupt flag
(which was already enabled), as the fifo-data-available interrupt flag only
gets set when the trigger-level is exceeded. So far we've been getting away
with not doing this because of the low trigger-level, but this is something
which we should have done since day one.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/media/sunxi-ir.txt          |  2 +-
 drivers/media/rc/sunxi-cir.c                        | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 6b70b9b..1811a06 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -1,7 +1,7 @@
 Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
 
 Required properties:
-- compatible	    : should be "allwinner,sun4i-a10-ir";
+- compatible	    : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : should contain "apb" and "ir" entries;
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 06170e0..7830aef 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -56,12 +56,12 @@
 #define REG_RXINT_RAI_EN		BIT(4)
 
 /* Rx FIFO available byte level */
-#define REG_RXINT_RAL(val)    (((val) << 8) & (GENMASK(11, 8)))
+#define REG_RXINT_RAL(val)    ((val) << 8)
 
 /* Rx Interrupt Status */
 #define SUNXI_IR_RXSTA_REG    0x30
 /* RX FIFO Get Available Counter */
-#define REG_RXSTA_GET_AC(val) (((val) >> 8) & (GENMASK(5, 0)))
+#define REG_RXSTA_GET_AC(val) (((val) >> 8) & (ir->fifo_size * 2 - 1))
 /* Clear all interrupt status value */
 #define REG_RXSTA_CLEARALL    0xff
 
@@ -72,10 +72,6 @@
 /* CIR_REG register idle threshold */
 #define REG_CIR_ITHR(val)    (((val) << 8) & (GENMASK(15, 8)))
 
-/* Hardware supported fifo size */
-#define SUNXI_IR_FIFO_SIZE    16
-/* How many messages in FIFO trigger IRQ */
-#define TRIGGER_LEVEL         8
 /* Required frequency for IR0 or IR1 clock in CIR mode */
 #define SUNXI_IR_BASE_CLK     8000000
 /* Frequency after IR internal divider  */
@@ -94,6 +90,7 @@ struct sunxi_ir {
 	struct rc_dev   *rc;
 	void __iomem    *base;
 	int             irq;
+	int		fifo_size;
 	struct clk      *clk;
 	struct clk      *apb_clk;
 	struct reset_control *rst;
@@ -115,11 +112,11 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	/* clean all pending statuses */
 	writel(status | REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
 
-	if (status & REG_RXINT_RAI_EN) {
+	if (status & (REG_RXINT_RAI_EN | REG_RXINT_RPEI_EN)) {
 		/* How many messages in fifo */
 		rc  = REG_RXSTA_GET_AC(status);
 		/* Sanity check */
-		rc = rc > SUNXI_IR_FIFO_SIZE ? SUNXI_IR_FIFO_SIZE : rc;
+		rc = rc > ir->fifo_size ? ir->fifo_size : rc;
 		/* If we have data */
 		for (cnt = 0; cnt < rc; cnt++) {
 			/* for each bit in fifo */
@@ -156,6 +153,11 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
+	if (of_device_is_compatible(dn, "allwinner,sun5i-a13-ir"))
+		ir->fifo_size = 64;
+	else
+		ir->fifo_size = 16;
+
 	/* Clock */
 	ir->apb_clk = devm_clk_get(dev, "apb");
 	if (IS_ERR(ir->apb_clk)) {
@@ -271,7 +273,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	 * level
 	 */
 	writel(REG_RXINT_ROI_EN | REG_RXINT_RPEI_EN |
-	       REG_RXINT_RAI_EN | REG_RXINT_RAL(TRIGGER_LEVEL - 1),
+	       REG_RXINT_RAI_EN | REG_RXINT_RAL(ir->fifo_size / 2 - 1),
 	       ir->base + SUNXI_IR_RXINT_REG);
 
 	/* Enable IR Module */
@@ -319,6 +321,7 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 
 static const struct of_device_id sunxi_ir_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ir", },
+	{ .compatible = "allwinner,sun5i-a13-ir", },
 	{},
 };
 
-- 
2.1.0
