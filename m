Return-Path: <devicetree-owner@vger.kernel.org>
Received: from fallback8.mail.ru ([94.100.176.136]:33716 "EHLO
	fallback8.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750848Ab3G3LL7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 07:11:59 -0400
Received: from smtp46.i.mail.ru (smtp46.i.mail.ru [94.100.177.106])
	by fallback8.mail.ru (mPOP.Fallback_MX) with ESMTP id 31FB136AA364
	for <devicetree@vger.kernel.org>; Tue, 30 Jul 2013 15:06:16 +0400 (MSK)
From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 1/4] mtd: nand: gpio: Determine bus width automatically
Date: Tue, 30 Jul 2013 15:05:24 +0400
Message-Id: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Alexander Shiyan <shc_work@mail.ru>
List-ID: <devicetree@vger.kernel.org>

This patch provide automatically determine of NAND bus width if
"bank-width" parameter is ommited.
Patch depends on "mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices".

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt         |  4 ++--
 drivers/mtd/nand/gpio.c                                   | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..2ac14d8 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -15,8 +15,8 @@ Required properties:
   optional gpio and may be set to 0 if not present.
 
 Optional properties:
-- bank-width : Width (in bytes) of the device.  If not present, the width
-  defaults to 1 byte.
+- bank-width : Width (in bytes) of the device. If not present, the bus width
+  of the device is determined automatically.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..674a790 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -116,7 +116,8 @@ static int gpio_nand_get_config_of(const struct device *dev,
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
-	}
+	} else
+		plat->options |= NAND_BUSWIDTH_AUTO;
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
 	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
@@ -223,6 +224,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->IO_ADDR_R))
 		return PTR_ERR(chip->IO_ADDR_R);
 
+	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
+	if (ret)
+		return ret;
+
+	if (resource_size(res) < 2)
+		gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 |
+					   NAND_BUSWIDTH_AUTO);
+
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
 		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
@@ -230,10 +239,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
-	if (ret)
-		return ret;
-
 	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
 		return ret;
-- 
1.8.1.5

