Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:39604 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932239AbeBSXEb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 18:04:31 -0500
Received: by mail-pl0-f66.google.com with SMTP id s13so6411924plq.6
        for <devicetree@vger.kernel.org>; Mon, 19 Feb 2018 15:04:31 -0800 (PST)
From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH v2 2/2] power: reset: gpio-poweroff: Add support for timeout from DT
Date: Mon, 19 Feb 2018 14:59:18 -0800
Message-Id: <20180219225918.2311-2-mdf@kernel.org>
In-Reply-To: <20180219225918.2311-1-mdf@kernel.org>
References: <20180219225918.2311-1-mdf@kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, sre@kernel.org, Moritz Fischer <mdf@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add support for reading a timeout value from devicetree.
Fall back to previous default of 3s if nothing is specified.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Changes from v1:
- of_property_read_u32() overwrites the output only if it succeeds,
  simplify error handling
---
 drivers/power/reset/gpio-poweroff.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/gpio-poweroff.c b/drivers/power/reset/gpio-poweroff.c
index be3d81ff51cc..265cc37646a9 100644
--- a/drivers/power/reset/gpio-poweroff.c
+++ b/drivers/power/reset/gpio-poweroff.c
@@ -19,11 +19,13 @@
 #include <linux/of_platform.h>
 #include <linux/module.h>
 
+#define DEFAULT_TIMEOUT_MS 3000
 /*
  * Hold configuration here, cannot be more than one instance of the driver
  * since pm_power_off itself is global.
  */
 static struct gpio_desc *reset_gpio;
+static u32 timeout = DEFAULT_TIMEOUT_MS;
 
 static void gpio_poweroff_do_poweroff(void)
 {
@@ -40,7 +42,7 @@ static void gpio_poweroff_do_poweroff(void)
 	gpiod_set_value(reset_gpio, 1);
 
 	/* give it some time */
-	mdelay(3000);
+	mdelay(timeout);
 
 	WARN_ON(1);
 }
@@ -64,6 +66,8 @@ static int gpio_poweroff_probe(struct platform_device *pdev)
 	else
 		flags = GPIOD_OUT_LOW;
 
+	of_property_read_u32(pdev->dev.of_node, "timeout_ms", &timeout);
+
 	reset_gpio = devm_gpiod_get(&pdev->dev, NULL, flags);
 	if (IS_ERR(reset_gpio))
 		return PTR_ERR(reset_gpio);
-- 
2.16.1

