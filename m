Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp46.i.mail.ru ([94.100.177.106]:56017 "EHLO smtp46.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753193Ab3HFI6U (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Tue, 6 Aug 2013 04:58:20 -0400
From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v3 1/4] mtd: nand: gpio: Add DT property to automatically determine bus width
Date: Tue,  6 Aug 2013 12:57:38 +0400
Message-Id: <1375779459-32549-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, Alexander Shiyan <shc_work@mail.ru>
List-ID: <devicetree@vger.kernel.org>

This patch adds a property to automatically determine the NAND
bus width. This property works if the bus width is not specified
explicitly.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt        |  2 ++
 drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d..91070d0 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -19,6 +19,8 @@ Optional properties:
   defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
   read registers (tR).  If not present then a default of 20us is used.
+- gpio-control-nand,bank-width-auto : Device bus width is determined
+  automatically if "bank-width" is omitted (Boolean).
 - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
   location used to guard against bus reordering with regards to accesses to
   the GPIO's and the NAND flash data bus.  If present, then after changing
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..c75f92e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -116,6 +116,10 @@ static int gpio_nand_get_config_of(const struct device *dev,
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
+	} else {
+		if (of_get_property(dev->of_node,
+				    "gpio-control-nand,bank-width-auto", NULL))
+			plat->options |= NAND_BUSWIDTH_AUTO;
 	}
 
 	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
@@ -223,6 +227,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
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
@@ -230,10 +242,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
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

