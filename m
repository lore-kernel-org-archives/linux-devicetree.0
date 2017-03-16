From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/5] rtc: rtc-sh: add support for rza series
Date: Thu, 16 Mar 2017 13:51:08 -0400
Message-ID: <20170316175112.27913-2-chris.brandt@renesas.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDXOFUXT2UGBBNFBVPDAKGQE5AQXNSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170316175112.27913-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This same RTC is used in RZ/A series MPUs, therefore with some slight
changes, this driver can be reused. Additionally, since ARM architectures
require Device Tree configurations, device tree support has been added.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 drivers/rtc/Kconfig  |  4 ++--
 drivers/rtc/rtc-sh.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ee1b0e9..77d1495 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1303,10 +1303,10 @@ config RTC_DRV_SA1100
 
 config RTC_DRV_SH
 	tristate "SuperH On-Chip RTC"
-	depends on SUPERH && HAVE_CLK
+	depends on (SUPERH || ARCH_RENESAS) && HAVE_CLK
 	help
 	  Say Y here to enable support for the on-chip RTC found in
-	  most SuperH processors.
+	  most SuperH processors. This RTC is also found in RZ/A SoCs.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called rtc-sh.
diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index c626e43..2ef4ac7 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -27,7 +27,15 @@
 #include <linux/log2.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
+#ifdef CONFIG_SUPERH
 #include <asm/rtc.h>
+#else
+/* Default values for RZ/A RTC */
+#define rtc_reg_size		sizeof(u16)
+#define RTC_BIT_INVERTED        0	/* no chip bugs */
+#define RTC_CAP_4_DIGIT_YEAR    (1 << 0)
+#define RTC_DEF_CAPABILITIES    RTC_CAP_4_DIGIT_YEAR
+#endif
 
 #define DRV_NAME	"sh-rtc"
 
@@ -570,6 +578,8 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_irq = platform_get_irq(pdev, 2);
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (res == NULL)
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (unlikely(res == NULL)) {
 		dev_err(&pdev->dev, "No IO resource\n");
 		return -ENOENT;
@@ -608,6 +618,8 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	clk_enable(rtc->clk);
 
 	rtc->capabilities = RTC_DEF_CAPABILITIES;
+
+#ifdef CONFIG_SUPERH
 	if (dev_get_platdata(&pdev->dev)) {
 		struct sh_rtc_platform_info *pinfo =
 			dev_get_platdata(&pdev->dev);
@@ -618,6 +630,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 		 */
 		rtc->capabilities |= pinfo->capabilities;
 	}
+#endif
 
 	if (rtc->carry_irq <= 0) {
 		/* register shared periodic/carry/alarm irq */
@@ -738,10 +751,17 @@ static int sh_rtc_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(sh_rtc_pm_ops, sh_rtc_suspend, sh_rtc_resume);
 
+static const struct of_device_id sh_rtc_of_match[] = {
+	{ .compatible = "renesas,sh-rtc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sh_rtc_of_match);
+
 static struct platform_driver sh_rtc_platform_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.pm	= &sh_rtc_pm_ops,
+		.of_match_table = sh_rtc_of_match,
 	},
 	.remove		= __exit_p(sh_rtc_remove),
 };
-- 
2.10.1


-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
