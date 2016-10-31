From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v3 3/7] rtc: rtc-jz4740: Add support for devicetree
Date: Mon, 31 Oct 2016 21:39:47 +0100
Message-ID: <20161031203951.5444-3-paul@crapouillou.net>
References: <20161030230247.20538-1-paul@crapouillou.net>
 <20161031203951.5444-1-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161031203951.5444-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

See
Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
for a description of the bindings.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Acked-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
---
 drivers/rtc/rtc-jz4740.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

v2: No change
v3: No change

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index c616efe..4213554 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
@@ -245,6 +246,13 @@ void jz4740_rtc_poweroff(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(jz4740_rtc_poweroff);
 
+static const struct of_device_id jz4740_rtc_of_match[] = {
+	{ .compatible = "ingenic,jz4740-rtc", .data = (void *) ID_JZ4740 },
+	{ .compatible = "ingenic,jz4780-rtc", .data = (void *) ID_JZ4780 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
+
 static int jz4740_rtc_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -252,12 +260,17 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	uint32_t scratchpad;
 	struct resource *mem;
 	const struct platform_device_id *id = platform_get_device_id(pdev);
+	const struct of_device_id *of_id = of_match_device(
+			jz4740_rtc_of_match, &pdev->dev);
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->type = id->driver_data;
+	if (of_id)
+		rtc->type = (enum jz4740_rtc_type) of_id->data;
+	else
+		rtc->type = id->driver_data;
 
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0) {
@@ -345,6 +358,7 @@ static struct platform_driver jz4740_rtc_driver = {
 	.driver	 = {
 		.name  = "jz4740-rtc",
 		.pm    = JZ4740_RTC_PM_OPS,
+		.of_match_table = of_match_ptr(jz4740_rtc_of_match),
 	},
 	.id_table = jz4740_rtc_ids,
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
