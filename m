From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [RFC PATCH] basic-mmio-gpio: add support for device tree
Date: Wed, 27 Jul 2011 15:24:16 +0100
Message-ID: <1311776656-6755-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for basic-mmio-gpio controllers to be
instantiated from the device tree.  It's RFC at the moment because I'm
really not happy with the way that the registers are described (zero
size meaning the register is not present).  In a previous discussion
(https://lkml.org/lkml/2011/5/4/117) Grant suggested using a reg
property to describe the whole controller then arrays of reg-offset
values for multiple banks e.g:

	gpio@fedc0000 {
		compatible = "acme,super-soc-gpio", "mmio-gpio";
		reg = <0xfedc0000 0x100>;
		gpio-controller;
		#gpio-cells = <1>;

		mmgpio-regoffset-data = <0x00 0x04 0x08 0x0c>;
		mmgpio-regoffset-dir  = <0x20 0x24 0x28 0x2c>;
		mmgpio-regoffset-set  = <0x10 0x14 0x18 0x1c>;
		mmgpio-regoffset-clr  = <0x30 0x34 0x38 0x3c>;
	};

but this loses the hierarchy as Anton pointed out, so I've tried this
approach instead.  This probably needs to be able to support a
"basic-mmio-gpio" gpio device with "basic-mmio-gpio-bank" sub-nodes but
I haven't done this yet.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Not-yet-signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 .../devicetree/bindings/gpio/basic-mmio-gpio.txt   |   34 ++++++
 drivers/gpio/basic_mmio_gpio.c                     |  122 +++++++++++++++-----
 include/linux/basic_mmio_gpio.h                    |   20 +++
 3 files changed, 149 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
new file mode 100644
index 0000000..5582dfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
@@ -0,0 +1,34 @@
+Basic MMIO GPIO controller
+
+Required properties:
+- compatible : "basic-mmio-gpio"
+- #gpio-cells : Should be two. The first cell is the pin number and the
+  second cell is used to specify optional parameters (currently unused).
+- gpio-controller : Marks the device node as a GPIO controller.
+- regs : The register addresses for the registers in the controller.  The
+  registers should be listed in the following order:
+	- dat
+	- set
+	- clr
+	- dirout
+	- dirin
+  registers that are not present in the controller should have a zero size.
+
+Optional properties:
+- basic-mmio-gpio,big-endian : big-endian register accesses should be used.
+- basic-mmio-gpio,nr-gpio : the number of GPIO pins in the controller.
+
+Examples:
+
+banka: gpio@20000 {
+	compatible = "picochip,picoxcell-gpio", "basic-mmio-gpio";
+	gpio-controller;
+	#gpio-cells = <2>;
+	basic-mmio-gpio,nr-gpio = <8>;
+
+	reg = <0x20050 0x4 /* dat */
+	       0x20000 0x4 /* set */
+	       0x20000 0x0 /* no clr register */
+	       0x20004 0x4 /* dirout */
+	       0x20000 0x0 /* no dirin register */>;
+};
diff --git a/drivers/gpio/basic_mmio_gpio.c b/drivers/gpio/basic_mmio_gpio.c
index 8152e9f..da85352 100644
--- a/drivers/gpio/basic_mmio_gpio.c
+++ b/drivers/gpio/basic_mmio_gpio.c
@@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
 
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -353,8 +356,14 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 
 int __devexit bgpio_remove(struct bgpio_chip *bgc)
 {
-	int err = gpiochip_remove(&bgc->gc);
+	int err;
+
+#ifdef CONFIG_OF
+	if (bgc->gc.of_node)
+		of_node_put(bgc->gc.of_node);
+#endif /* CONFIG_OF */
 
+	err = gpiochip_remove(&bgc->gc);
 	kfree(bgc);
 
 	return err;
@@ -385,6 +394,9 @@ int __devinit bgpio_init(struct bgpio_chip *bgc,
 	bgc->gc.label = dev_name(dev);
 	bgc->gc.base = -1;
 	bgc->gc.ngpio = bgc->bits;
+	bgc->gc.of_node = dev->of_node;
+	bgc->gc.of_gpio_n_cells = 2;
+	bgc->gc.of_xlate = of_gpio_simple_xlate;
 
 	ret = bgpio_setup_io(bgc, dat, set, clr);
 	if (ret)
@@ -400,6 +412,11 @@ int __devinit bgpio_init(struct bgpio_chip *bgc,
 
 	bgc->data = bgc->read_reg(bgc->reg_dat);
 
+#ifdef CONFIG_OF
+	if (bgc->gc.of_node)
+		of_node_get(bgc->gc.of_node);
+#endif /* CONFIG_OF */
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(bgpio_init);
@@ -444,63 +461,107 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	return ret;
 }
 
-static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
+static int bgpio_platform_probe(struct platform_device *pdev,
+				struct bgpio_info *info)
 {
-	struct device *dev = &pdev->dev;
 	struct resource *r;
-	void __iomem *dat;
-	void __iomem *set;
-	void __iomem *clr;
-	void __iomem *dirout;
-	void __iomem *dirin;
-	unsigned long sz;
-	bool be;
 	int err;
-	struct bgpio_chip *bgc;
-	struct bgpio_pdata *pdata = dev_get_platdata(dev);
+	struct bgpio_pdata *pdata = dev_get_platdata(&pdev->dev);
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
 		return -EINVAL;
 
-	sz = resource_size(r);
+	info->sz = resource_size(r);
+	info->ngpio = info->sz * 8;
+	info->base = -1;
 
-	dat = bgpio_map(pdev, "dat", sz, &err);
-	if (!dat)
+	info->dat = bgpio_map(pdev, "dat", info->sz, &err);
+	if (!info->dat)
 		return err ? err : -EINVAL;
 
-	set = bgpio_map(pdev, "set", sz, &err);
+	info->set = bgpio_map(pdev, "set", info->sz, &err);
 	if (err)
 		return err;
 
-	clr = bgpio_map(pdev, "clr", sz, &err);
+	info->clr = bgpio_map(pdev, "clr", info->sz, &err);
 	if (err)
 		return err;
 
-	dirout = bgpio_map(pdev, "dirout", sz, &err);
+	info->dirout = bgpio_map(pdev, "dirout", info->sz, &err);
 	if (err)
 		return err;
 
-	dirin = bgpio_map(pdev, "dirin", sz, &err);
+	info->dirin = bgpio_map(pdev, "dirin", info->sz, &err);
 	if (err)
 		return err;
 
-	be = !strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be");
+	info->be = !strcmp(platform_get_device_id(pdev)->name,
+			   "basic-mmio-gpio-be");
+
+	if (pdata) {
+		info->base = pdata->base;
+		if (pdata->ngpio > 0)
+			info->ngpio = pdata->ngpio;
+	}
+
+	return err;
+}
+
+static int bgpio_of_probe(struct platform_device *pdev,
+			  struct bgpio_info *info)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource r;
+	int err;
+	u32 ngpio;
+
+	err = of_address_to_resource(np, 0, &r);
+	if (err)
+		return err;
+
+	info->dat = of_iomap(np, 0);
+	info->set = of_iomap(np, 1);
+	info->clr = of_iomap(np, 2);
+	info->dirout = of_iomap(np, 3);
+	info->dirin = of_iomap(np, 4);
+	info->sz = resource_size(&r);
+	info->ngpio = info->sz * 8;
+	info->base = -1;
+
+	info->be = of_get_property(np, "basic-mmio-gpio,big-endian", NULL) ?
+		true : false;
+
+	if (of_property_read_u32(np, "basic-mmio-gpio,nr-gpio", &ngpio))
+		return -EINVAL;
+	info->ngpio = ngpio;
+
+	return 0;
+}
+
+static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int err;
+	struct bgpio_chip *bgc;
+	struct bgpio_info info = {};
+
+	if (platform_get_device_id(pdev))
+		err = bgpio_platform_probe(pdev, &info);
+	else
+		err = bgpio_of_probe(pdev, &info);
+
+	if (err)
+		return err;
 
 	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
 	if (!bgc)
 		return -ENOMEM;
 
-	err = bgpio_init(bgc, dev, sz, dat, set, clr, dirout, dirin, be);
+	err = bgpio_init_info(bgc, dev, &info);
 	if (err)
 		return err;
 
-	if (pdata) {
-		bgc->gc.base = pdata->base;
-		if (pdata->ngpio > 0)
-			bgc->gc.ngpio = pdata->ngpio;
-	}
-
 	platform_set_drvdata(pdev, bgc);
 
 	return gpiochip_add(&bgc->gc);
@@ -520,9 +581,16 @@ static const struct platform_device_id bgpio_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 
+static const struct of_device_id bgpio_of_id_table[] = {
+	{ .compatible = "basic-mmio-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bgpio_of_id_table);
+
 static struct platform_driver bgpio_driver = {
 	.driver = {
 		.name = "basic-mmio-gpio",
+		.of_match_table = bgpio_of_id_table,
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 98999cf..edaa807 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -74,4 +74,24 @@ int __devinit bgpio_init(struct bgpio_chip *bgc,
 			 void __iomem *dirin,
 			 bool big_endian);
 
+struct bgpio_info {
+	void __iomem *dat;
+	void __iomem *set;
+	void __iomem *clr;
+	void __iomem *dirout;
+	void __iomem *dirin;
+	unsigned long sz;
+	bool be;
+	int ngpio;
+	int base;
+};
+
+static inline int bgpio_init_info(struct bgpio_chip *bgc,
+				  struct device *dev,
+				  const struct bgpio_info *info)
+{
+	return bgpio_init(bgc, dev, info->sz, info->dat, info->set, info->clr,
+			  info->dirout, info->dirin, info->be);
+}
+
 #endif /* __BASIC_MMIO_GPIO_H */
-- 
1.7.4.1
