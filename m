From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 04/14] usb: chipidea: msm: add remove method
Date: Fri, 29 Jun 2012 17:48:52 +0800
Message-ID: <1340963342-28735-5-git-send-email-richard.zhao@freescale.com>
References: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340963342-28735-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

allow this driver to be removed too.

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/ci13xxx_msm.c |   21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci13xxx_msm.c b/drivers/usb/chipidea/ci13xxx_msm.c
index 8d438b8..11a7bef 100644
--- a/drivers/usb/chipidea/ci13xxx_msm.c
+++ b/drivers/usb/chipidea/ci13xxx_msm.c
@@ -84,6 +84,8 @@ static int __devinit ci13xxx_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_platform;
 
+	platform_set_drvdata(pdev, plat_ci);
+
 	pm_runtime_no_callbacks(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
@@ -95,16 +97,23 @@ put_platform:
 	return ret;
 }
 
+static int __devexit ci13xxx_msm_remove(struct platform_device *pdev)
+{
+	struct platform_device *plat_ci = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	platform_device_unregister(plat_ci);
+
+	return 0;
+}
+
 static struct platform_driver ci13xxx_msm_driver = {
 	.probe = ci13xxx_msm_probe,
+	.remove = __devexit_p(ci13xxx_msm_remove),
 	.driver = { .name = "msm_hsusb", },
 };
-MODULE_ALIAS("platform:msm_hsusb");
 
-static int __init ci13xxx_msm_init(void)
-{
-	return platform_driver_register(&ci13xxx_msm_driver);
-}
-module_init(ci13xxx_msm_init);
+module_platform_driver(ci13xxx_msm_driver);
 
+MODULE_ALIAS("platform:msm_hsusb");
 MODULE_LICENSE("GPL v2");
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
