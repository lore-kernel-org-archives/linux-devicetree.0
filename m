From: Romain Baeriswyl <romain.baeriswyl@alitech.com>
Subject: [PATCH V3] added device tree support to gpio-generic driver
Date: Wed, 24 Jun 2015 11:54:49 +0200
Message-ID: <1435139689-5800-1-git-send-email-romain.baeriswyl@alitech.com>
References: <CACRpkdaOQmRQFNn7z1UOxMpQpi=ZVMzWBm=YpcPP=2EXSXZHBQ@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaOQmRQFNn7z1UOxMpQpi=ZVMzWBm=YpcPP=2EXSXZHBQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>, devicetree@vger.kernel.org
Cc: Romain Baeriswyl <romain.baeriswyl@alitech.com>
List-Id: devicetree@vger.kernel.org

This patch adds support of device tree to the gpio-generic driver.

Signed-off-by: Romain Baeriswyl <romain.baeriswyl@alitech.com> 
---
 .../devicetree/bindings/gpio/gpio-generic.txt      |   62 ++++++++++++++++++++
 drivers/gpio/gpio-generic.c                        |   60 ++++++++++++++++++-
 include/linux/basic_mmio_gpio.h                    |    1 +
 3 files changed, 120 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
new file mode 100644
index 0000000..5259b2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
@@ -0,0 +1,62 @@
+Bindings for gpio-generic
+
+Required properties:
+- compatible : should be "single-register-gpio"
+- ngpios: specifies the number of gpio mapped in the register from bit 0 to
+          bit ngpios-1. The value is limited to the number of bits of the
+	  LONG type.
+- reg-names: must contain
+      "dat" - data register
+  may contain
+      "set" - data set register
+      "clr" - data clear register
+      "dirout" - direction output register
+      "dirin" - direction input register
+- reg: address + size pairs describing the GPIO register sets; order must
+       correspond with the order of entries in reg-names
+- #gpio-cells = must be set to 2
+
+Optional property:
+- big-endian: tells that register is big endian.
+
+For setting GPIO's there are three supported configurations:
+- single input/output register resource (named "dat"),
+- set/clear pair (named "set" and "clr"),
+- single output register resource and single input resource ("set" and dat").
+
+For the single output register, this drives a 1 by setting a bit and a zero
+by clearing a bit.  For the set clr pair, this drives a 1 by setting a bit
+in the set register and clears it by setting a bit in the clear register.
+The configuration is detected by which resources are present.
+
+For setting the GPIO direction, there are three supported configurations:
+- simple bidirection GPIO that requires no configuration,
+- an output direction register (named "dirout") where a 1 bit
+  indicates the GPIO is an output,
+- an input direction register (named "dirin") where a 1 bit indicates
+  the GPIO is an input.
+
+Examples:
+
+	/* Configuration with single input/output register and
+	 * simple bidirection GPIO.
+	 */
+	gpio_a {
+		compatible = "basic-mmio-gpio";
+		ngpios = <32>;
+		reg = <0x18000000 0x4>;
+		reg-names = "dat";
+		#gpio-cells = <2>;
+	};
+
+	/* Configuration with set/clear pair registers and with an output
+	 * direction register
+	 */
+	gpio_b {
+		compatible = "single-register-gpio";
+		ngpios = <32>;
+		reg = <0x18000000 0x4>, <0x18000010 0x4>,
+		      <0x18000004 0x4>, <0x18000008 0x4>;
+		reg-names = "dat", "set", "clr", "dirout";
+		#gpio-cells = <2>;
+	};
diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b92a690..da1408a 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -61,6 +61,8 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -564,6 +566,35 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static int bgpio_parse_dt(struct device *dev)
+{
+	struct bgpio_pdata *pdata;
+
+	pdata = devm_kzalloc(dev, sizeof(struct bgpio_pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (of_property_read_u32(dev->of_node, "ngpio", &pdata->ngpio)) {
+		dev_err(dev, "Failed to get field ngpio");
+		return -EINVAL;
+	}
+	pdata->base = -1;
+
+	if (of_device_is_big_endian(dev->of_node))
+		pdata->flags = BGPIOF_BIG_ENDIAN;
+
+	dev->platform_data = pdata;
+	return 0;
+}
+#else
+static int bgpio_parse_dt(struct device *dev)
+{
+	return 0;
+}
+#endif /* CONFIG_OF */
+
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -574,10 +605,21 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirout;
 	void __iomem *dirin;
 	unsigned long sz;
-	unsigned long flags = pdev->id_entry->driver_data;
 	int err;
 	struct bgpio_chip *bgc;
-	struct bgpio_pdata *pdata = dev_get_platdata(dev);
+	struct bgpio_pdata *pdata;
+
+	if (of_have_populated_dt()) {
+		err = bgpio_parse_dt(dev);
+		if (err < 0) {
+			dev_err(dev, "Failed to get DT data\n");
+			return err;
+		}
+	}
+	pdata = dev_get_platdata(dev);
+
+	if (!of_have_populated_dt())
+		pdata->flags = pdev->id_entry->driver_data;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -609,7 +651,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (!bgc)
 		return -ENOMEM;
 
-	err = bgpio_init(bgc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	err = bgpio_init(bgc, dev, sz, dat, set, clr, dirout, dirin,
+			 pdata->flags);
 	if (err)
 		return err;
 
@@ -633,6 +676,14 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
 	return bgpio_remove(bgc);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id  bgpio_of_match[] = {
+	{ .compatible = "basic-mmio-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bgpio_of_match);
+#endif
+
 static const struct platform_device_id bgpio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
@@ -648,6 +699,9 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver = {
 	.driver = {
 		.name = "basic-mmio-gpio",
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(bgpio_of_match),
+#endif
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 0e97856..d85d9ca 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -22,6 +22,7 @@ struct bgpio_pdata {
 	const char *label;
 	int base;
 	int ngpio;
+	int flags;
 };
 
 struct device;
-- 
1.7.1

*********************************************************
This message contains information that may be confidential and/or privileged and is intended only for the individual or entity named in the body of email above. If this message has been received in error, your receipt of this message is not intended to waive any applicable privilege. No one else may disclose, copy, distribute or use the contents of this message. Unauthorized use, dissemination and duplication is strictly prohibited, and may be unlawful.




