From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/8] usb: bdc: Add support for suspend/resume
Date: Tue, 27 Jun 2017 14:23:24 -0400
Message-ID: <1498587806-24781-7-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Based on a previous commit by Danesh Petigara <dpetigara-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
that added resume to solve the following problem:
"The BDC driver will fail after resuming from S3 suspend and this
will cause any upper layer gadget driver to fail."
This commit also adds support for suspend and manages the clock during
suspend/resume.

Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/udc/bdc/bdc.h      |  1 +
 drivers/usb/gadget/udc/bdc/bdc_core.c | 36 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 3664808..f838647 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -454,6 +454,7 @@ struct bdc {
 	 * Func Wake packet every 2.5 secs. Refer to USB3 spec section 8.5.6.4
 	 */
 	struct delayed_work	func_wake_notify;
+	struct clk		*clk;
 };
 
 static inline u32 bdc_readl(void __iomem *base, u32 offset)
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 1714bd3..021c0e7 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -473,6 +473,8 @@ static int bdc_probe(struct platform_device *pdev)
 	if (!bdc)
 		return -ENOMEM;
 
+	bdc->clk = clk;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	bdc->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(bdc->regs)) {
@@ -529,10 +531,43 @@ static int bdc_remove(struct platform_device *pdev)
 	dev_dbg(bdc->dev, "%s ()\n", __func__);
 	bdc_udc_exit(bdc);
 	bdc_hw_exit(bdc);
+	clk_disable_unprepare(bdc->clk);
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int bdc_suspend(struct device *dev)
+{
+	struct bdc *bdc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(bdc->clk);
+	return 0;
+}
+
+static int bdc_resume(struct device *dev)
+{
+	struct bdc *bdc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(bdc->clk);
+	if (ret) {
+		dev_err(bdc->dev, "err enabling the clock\n");
+		return ret;
+	}
+	ret = bdc_reinit(bdc);
+	if (ret) {
+		dev_err(bdc->dev, "err in bdc reinit\n");
+		return ret;
+	}
 
 	return 0;
 }
 
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(bdc_pm_ops, bdc_suspend,
+		bdc_resume);
+
 static const struct of_device_id bdc_of_match[] = {
 	{ .compatible = "brcm,bdc-udc-v0.16" },
 	{ .compatible = "brcm,bdc-udc" },
@@ -543,6 +578,7 @@ static int bdc_remove(struct platform_device *pdev)
 	.driver		= {
 		.name	= BRCM_BDC_NAME,
 		.owner	= THIS_MODULE,
+		.pm = &bdc_pm_ops,
 		.of_match_table	= bdc_of_match,
 	},
 	.probe		= bdc_probe,
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
