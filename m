From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/5] rtc: rtc-jz4740: Add support for devicetree
Date: Sat,  5 Mar 2016 23:38:49 +0100
Message-ID: <1457217531-26064-3-git-send-email-paul@crapouillou.net>
References: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Alessandro Zummo <a.zummo@towertech.it>, Paul Cercueil <paul@crapouillou.net>, Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, rtc-linux@googlegroups.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 47617bd..3914b1c 100644
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
2.7.0
