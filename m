From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v9 REBASE 3/9] USB: Chipidea: add ci13xxx device id management
Date: Sat, 7 Jul 2012 22:56:42 +0800
Message-ID: <1341673008-29808-4-git-send-email-richard.zhao@freescale.com>
References: <1341673008-29808-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341673008-29808-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

We use ida_simple_get and ida_simple_remove to manage the ids.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/usb/chipidea/core.c |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 8b9d06f..39603d7 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -56,6 +56,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
+#include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -332,17 +333,24 @@ static irqreturn_t ci_irq(int irq, void *data)
 	return ci->role == CI_ROLE_END ? ret : ci_role(ci)->irq(ci);
 }
 
+static DEFINE_IDA(ci_ida);
+
 struct platform_device *ci13xxx_add_device(struct device *dev,
 			struct resource *res, int nres,
 			struct ci13xxx_platform_data *platdata)
 {
 	struct platform_device *pdev;
-	int ret;
+	int id, ret;
 
-	/* FIXME: find a way to choose id */
-	pdev = platform_device_alloc("ci_hdrc", -1);
-	if (!pdev)
-		return ERR_PTR(-ENOMEM);
+	id = ida_simple_get(&ci_ida, 0, 0, GFP_KERNEL);
+	if (id < 0)
+		return ERR_PTR(id);
+
+	pdev = platform_device_alloc("ci_hdrc", id);
+	if (!pdev) {
+		ret = -ENOMEM;
+		goto put_id;
+	}
 
 	pdev->dev.parent = dev;
 	pdev->dev.dma_mask = dev->dma_mask;
@@ -365,6 +373,8 @@ struct platform_device *ci13xxx_add_device(struct device *dev,
 
 err:
 	platform_device_put(pdev);
+put_id:
+	ida_simple_remove(&ci_ida, id);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(ci13xxx_add_device);
@@ -372,6 +382,7 @@ EXPORT_SYMBOL_GPL(ci13xxx_add_device);
 void ci13xxx_remove_device(struct platform_device *pdev)
 {
 	platform_device_unregister(pdev);
+	ida_simple_remove(&ci_ida, pdev->id);
 }
 EXPORT_SYMBOL_GPL(ci13xxx_remove_device);
 
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
