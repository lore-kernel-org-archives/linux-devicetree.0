From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 4/4] usb: chipidea: imx: Add system suspend/resume API
Date: Thu, 10 Jan 2013 16:35:54 +0800
Message-ID: <1357806954-27960-4-git-send-email-peter.chen@freescale.com>
References: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357806954-27960-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

During the system suspend/resume procedure, the USB also
needs to go suspend/resume procedure, this patch adds
related APIs. It is tested at i.mx6q sabrelite. Meanwhile,
it fixes the bug that the USB will out of work after
system suspend/resume.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/bits.h        |    1 +
 drivers/usb/chipidea/ci13xxx_imx.c |   61 ++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
index ba9c6ef..d1467bb 100644
--- a/drivers/usb/chipidea/bits.h
+++ b/drivers/usb/chipidea/bits.h
@@ -47,6 +47,7 @@
 #define PORTSC_FPR            BIT(6)
 #define PORTSC_SUSP           BIT(7)
 #define PORTSC_HSP            BIT(9)
+#define PORTSC_PHCD           BIT(23) /* phy suspend mode */
 #define PORTSC_PTC            (0x0FUL << 16)
 
 /* DEVLC */
diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
index 342eab0..dd257b1 100644
--- a/drivers/usb/chipidea/ci13xxx_imx.c
+++ b/drivers/usb/chipidea/ci13xxx_imx.c
@@ -25,6 +25,7 @@
 #include <linux/mfd/syscon.h>
 
 #include "ci.h"
+#include "bits.h"
 #include "ci13xxx_imx.h"
 
 #define pdev_to_phy(pdev) \
@@ -321,6 +322,63 @@ static int ci13xxx_imx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int ci13xxx_imx_suspend(struct device *dev)
+{
+	struct ci13xxx_imx_data *data =
+		platform_get_drvdata(to_platform_device(dev));
+	struct platform_device *plat_ci;
+	struct ci13xxx	*ci;
+
+	plat_ci = data->ci_pdev;
+	ci = platform_get_drvdata(plat_ci);
+
+	hw_write(ci, OP_PORTSC, PORTSC_PHCD, 1);
+
+	if (data->phy)
+		usb_phy_set_suspend(data->phy, 1);
+
+	clk_disable_unprepare(data->clk);
+
+	return 0;
+}
+
+static int ci13xxx_imx_resume(struct device *dev)
+{
+	int ret;
+	struct ci13xxx_imx_data *data =
+		platform_get_drvdata(to_platform_device(dev));
+	struct platform_device *plat_ci;
+	struct ci13xxx	*ci;
+
+	plat_ci = data->ci_pdev;
+	ci = platform_get_drvdata(plat_ci);
+
+	ret = clk_prepare_enable(data->clk);
+	if (ret) {
+		dev_err(dev,
+			"Failed to prepare or enable clock, err=%d\n", ret);
+		return ret;
+	}
+
+	if (hw_read(ci, OP_PORTSC, PORTSC_PHCD)) {
+		hw_write(ci, OP_PORTSC, PORTSC_PHCD, 0);
+		/* Some clks sync between Controller and USB PHY */
+		mdelay(1);
+	}
+
+	if (data->phy)
+		usb_phy_set_suspend(data->phy, 0);
+
+	return ret;
+}
+
+static const struct dev_pm_ops ci13xxx_imx_pm_ops = {
+	.suspend	= ci13xxx_imx_suspend,
+	.resume		= ci13xxx_imx_resume,
+};
+#endif
+
 static const struct of_device_id ci13xxx_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx27-usb", },
 	{ /* sentinel */ }
@@ -334,6 +392,9 @@ static struct platform_driver ci13xxx_imx_driver = {
 		.name = "imx_usb",
 		.owner = THIS_MODULE,
 		.of_match_table = ci13xxx_imx_dt_ids,
+#ifdef CONFIG_PM
+		.pm	= &ci13xxx_imx_pm_ops,
+#endif
 	 },
 };
 
-- 
1.7.0.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
