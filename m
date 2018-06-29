Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 4/7] mmc: pxamci: fix indenting
Date: Fri, 29 Jun 2018 16:47:35 +0200
Message-Id: <20180629144738.446-5-daniel@zonque.org>
In-Reply-To: <20180629144738.446-1-daniel@zonque.org>
References: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

pxamci_of_init() had some weird indenting.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mmc/host/pxamci.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index ee1c32862ef8..3df60c7babce 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -593,16 +593,16 @@ MODULE_DEVICE_TABLE(of, pxa_mmc_dt_ids);
 
 static int pxamci_of_init(struct platform_device *pdev)
 {
-        struct device_node *np = pdev->dev.of_node;
-        struct pxamci_platform_data *pdata;
-        u32 tmp;
+	struct device_node *np = pdev->dev.of_node;
+	struct pxamci_platform_data *pdata;
+	u32 tmp;
 
-        if (!np)
-                return 0;
+	if (!np)
+		return 0;
 
-        pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-        if (!pdata)
-                return -ENOMEM;
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
 
 	pdata->gpio_card_detect =
 		of_get_named_gpio(np, "cd-gpios", 0);
@@ -616,9 +616,9 @@ static int pxamci_of_init(struct platform_device *pdev)
 	if (of_property_read_u32(np, "pxa-mmc,detect-delay-ms", &tmp) == 0)
 		pdata->detect_delay_ms = tmp;
 
-        pdev->dev.platform_data = pdata;
+	pdev->dev.platform_data = pdata;
 
-        return 0;
+	return 0;
 }
 #else
 static int pxamci_of_init(struct platform_device *pdev)
-- 
2.17.1
