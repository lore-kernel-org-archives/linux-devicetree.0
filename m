Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp45.i.mail.ru ([94.100.177.105]:35249 "EHLO smtp45.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752533Ab3G3LSx (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Tue, 30 Jul 2013 07:18:53 -0400
From: Alexander Shiyan <shc_work@mail.ru>
Subject: [RFC RESEND] GPIO: gpio-generic: Add DT support
Date: Tue, 30 Jul 2013 15:18:35 +0400
Message-Id: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, Alexander Shiyan <shc_work@mail.ru>
List-ID: <devicetree@vger.kernel.org>

This patch adds DT support for generic (MMIO) GPIO driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/gpio/gpio-generic.txt      | 25 ++++++++++++++
 drivers/gpio/gpio-generic.c                        | 40 +++++++++++++++-------
 2 files changed, 53 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
new file mode 100644
index 0000000..a9417ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
@@ -0,0 +1,25 @@
+Generic memory-mapped GPIO controller
+
+Required properties:
+- compatible: Should be "basic-mmio-gpio" or "basic-mmio-gpio-be".
+- reg: Physical base GPIO controller registers location and length.
+- reg-names: Should be the names of reg resources. Each register uses
+  its own reg name, so there should be as many reg names as referenced
+  registers:
+  "dat"		: Input/output register (Required),
+  "set"		: Register for set output bits (Optional),
+  "clr"		: Register for clear output bits (Optional),
+  "dirout"	: Register for setup direction as output (Optional),
+  "dirin"	: Register for setup direction as input (Optional).
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be two.
+
+Example (Simple 8-bit memory cell):
+
+bgpio: gpio@20000000 {
+	compatible = "basic-mmio-gpio";
+	reg = <0x20000000 0x1>;
+	reg-names = "dat";
+	gpio-controller;
+	#gpio-cells = <2>;
+};
diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index d2196bf..055c7f5 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
@@ -440,6 +441,26 @@ EXPORT_SYMBOL_GPL(bgpio_init);
 
 #ifdef CONFIG_GPIO_GENERIC_PLATFORM
 
+static const struct platform_device_id bgpio_id_table[] = {
+	{ .name = "basic-mmio-gpio",	.driver_data = 0, },
+	{ .name = "basic-mmio-gpio-be",	.driver_data = BGPIOF_BIG_ENDIAN, },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, bgpio_id_table);
+
+static const struct of_device_id bgpio_id_dt_table[] = {
+	{
+		.compatible	= "basic-mmio-gpio",
+		.data		= (const void *)0,
+	},
+	{
+		.compatible	= "basic-mmio-gpio-be",
+		.data		= (const void *)BGPIOF_BIG_ENDIAN,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bgpio_id_dt_table);
+
 static void __iomem *bgpio_map(struct platform_device *pdev,
 			       const char *name,
 			       resource_size_t sane_sz,
@@ -487,11 +508,12 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *clr;
 	void __iomem *dirout;
 	void __iomem *dirin;
-	unsigned long sz;
-	unsigned long flags = 0;
+	unsigned long sz, flags;
 	int err;
 	struct bgpio_chip *bgc;
 	struct bgpio_pdata *pdata = dev_get_platdata(dev);
+	const struct of_device_id *of_id =
+		of_match_device(bgpio_id_dt_table, &pdev->dev);
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -519,8 +541,7 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	if (!strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be"))
-		flags |= BGPIOF_BIG_ENDIAN;
+	flags = of_id ? (ulong)of_id->data : pdev->id_entry->driver_data;
 
 	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
 	if (!bgc)
@@ -548,16 +569,11 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
 	return bgpio_remove(bgc);
 }
 
-static const struct platform_device_id bgpio_id_table[] = {
-	{ "basic-mmio-gpio", },
-	{ "basic-mmio-gpio-be", },
-	{},
-};
-MODULE_DEVICE_TABLE(platform, bgpio_id_table);
-
 static struct platform_driver bgpio_driver = {
 	.driver = {
-		.name = "basic-mmio-gpio",
+		.name		= "basic-mmio-gpio",
+		.owner		= THIS_MODULE,
+		.of_match_table	= bgpio_id_dt_table,
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
-- 
1.8.1.5

