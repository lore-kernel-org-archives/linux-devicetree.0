From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv2 2/2] basic-mmio-gpio: add support for device tree probing
Date: Thu, 28 Jul 2011 16:25:42 +0100
Message-ID: <1311866742-29997-2-git-send-email-jamie@jamieiles.com>
References: <1311866742-29997-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311866742-29997-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
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
instantiated from the device tree.  The binding supports devices with
multiple banks.

v2:
	- Added more detail to the binding.
	- Added CONFIG_OF guards.
	- Use regoffset-* properties for each register in each bank
	  relative to the registers of the controller.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 .../devicetree/bindings/gpio/basic-mmio-gpio.txt   |   85 ++++++++
 drivers/gpio/basic_mmio_gpio.c                     |  229 +++++++++++++++-----
 include/linux/basic_mmio_gpio.h                    |   78 ++++++-
 3 files changed, 331 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
new file mode 100644
index 0000000..3c4edf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
@@ -0,0 +1,85 @@
+Basic MMIO GPIO controller
+
+This binding allows lots of common GPIO controllers to use a generic GPIO
+driver.  The top level GPIO node describes the registers for the controller
+and high level properties such as endianness and register width.  Each bank in
+the controller is represented as a child node.
+
+Required properties:
+- compatible : "basic-mmio-gpio"
+- reg : The register window for the GPIO device.  If the device has multiple
+  banks then this window should cover all of the banks.
+- basic-mmio-gpio,reg-io-width : The width of the registers in the controller
+  (in bytes).
+- #address-cells : should be set to 1.
+- #size-cells : should be set to 0.  The addresses of the child nodes are the
+  bank numbers and the child nodes themselves represent the banks in the
+  controller.
+
+Optional properties:
+- basic-mmio-gpio,big-endian : the registers are in big-endian byte ordering.
+  If present then the first gpio in the controller occupies the MSB for
+  each register.
+
+Basic MMIO GPIO controller bank
+
+Required properties:
+- compatible : "basic-mmio-gpio-bank"
+- gpio-controller : Marks the node as a GPIO controller.
+- #gpio-cells : Should be two.  The first cell is the pin number and the
+  second cell encodes optional flags (currently unused).
+- basic-mmio-gpio,nr-gpio : The number of GPIO pins in the bank.
+- regoffset-dat : The offset from the beginning of the controller for the
+  "dat" register for this bank.  This register is read to get the value of the
+  GPIO pins, and if there is no regoffset-set property then it is also used to
+  set the value of the pins.
+
+Optional properties:
+- regoffset-set : The offset from the beginning of the controller for the
+  "set" register for this bank.  If present then the GPIO values are set
+  through this register (writing a 1 bit sets the GPIO high).  If there is no
+  regoffset-clr property then writing a 0 bit to this register will set the
+  pin to a low value.
+- regoffset-clr : The offset from the beginning of the controller for the
+  "clr" register for this bank.  Writing a 1 bit to this register will set the
+  GPIO to a low output value.
+- regoffset-dirout : The offset from the beginning of the controller for the
+  "dirout" register for this bank.  Writing a 1 bit to this register sets the
+  pin to be an output pin, writing a zero sets the pin to be an input.
+- regoffset-dirin : The offset from the beginning of the controller for the
+  "dirin" register for this bank.  Writing a 1 bit to this register sets the
+  pin to be an input pin, writing a zero sets the pin to be an output.
+
+Examples:
+
+gpio: gpio@20000 {
+	compatible = "picoxcell,picoxcell-gpio", "basic-mmio-gpio";
+	reg = <0x20000 0x1000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	basic-mmio-gpio,reg-io-width = <4>;
+
+	banka: gpio-controller@0 {
+		compatible = "picochip,picoxcell-gpio-bank",
+			     "basic-mmio-gpio-bank";
+		gpio-controller;
+		#gpio-cells = <2>;
+		basic-mmio-gpio,nr-gpio = <8>;
+
+		regoffset-dat = <0x50>;
+		regoffset-set = <0x00>;
+		regoffset-dirout = <0x04>;
+	};
+
+	bankb: gpio-controller@1 {
+		compatible = "picochip,picoxcell-gpio-bank",
+			     "basic-mmio-gpio-bank";
+		gpio-controller;
+		#gpio-cells = <2>;
+		basic-mmio-gpio,nr-gpio = <16>;
+
+		regoffset-dat = <0x54>;
+		regoffset-set = <0x0c>;
+		regoffset-dirout = <0x10>;
+	};
+};
diff --git a/drivers/gpio/basic_mmio_gpio.c b/drivers/gpio/basic_mmio_gpio.c
index 8152e9f..50044c3 100644
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
@@ -353,56 +356,65 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
 
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
 }
 EXPORT_SYMBOL_GPL(bgpio_remove);
 
-int __devinit bgpio_init(struct bgpio_chip *bgc,
-			 struct device *dev,
-			 unsigned long sz,
-			 void __iomem *dat,
-			 void __iomem *set,
-			 void __iomem *clr,
-			 void __iomem *dirout,
-			 void __iomem *dirin,
-			 bool big_endian)
+int bgpio_init_info(struct bgpio_chip *bgc, struct device *dev,
+		    const struct bgpio_info *info)
 {
 	int ret;
 
-	if (!is_power_of_2(sz))
+	if (!is_power_of_2(info->sz))
 		return -EINVAL;
 
-	bgc->bits = sz * 8;
+	bgc->bits = info->sz * 8;
 	if (bgc->bits > BITS_PER_LONG)
 		return -EINVAL;
 
 	spin_lock_init(&bgc->lock);
 	bgc->gc.dev = dev;
 	bgc->gc.label = dev_name(dev);
-	bgc->gc.base = -1;
-	bgc->gc.ngpio = bgc->bits;
-
-	ret = bgpio_setup_io(bgc, dat, set, clr);
+	bgc->gc.base = info->base;
+	bgc->gc.ngpio = info->ngpio;
+#ifdef CONFIG_OF
+	bgc->gc.of_node = info->of_node;
+	bgc->gc.of_gpio_n_cells = 2;
+	bgc->gc.of_xlate = of_gpio_simple_xlate;
+#endif /* CONFIG_OF */
+
+	ret = bgpio_setup_io(bgc, info->dat, info->set, info->clr);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_accessors(dev, bgc, big_endian);
+	ret = bgpio_setup_accessors(dev, bgc, info->be);
 	if (ret)
 		return ret;
 
-	ret = bgpio_setup_direction(bgc, dirout, dirin);
+	ret = bgpio_setup_direction(bgc, info->dirout, info->dirin);
 	if (ret)
 		return ret;
 
 	bgc->data = bgc->read_reg(bgc->reg_dat);
 
+#ifdef CONFIG_OF
+	if (bgc->gc.of_node)
+		of_node_get(bgc->gc.of_node);
+#endif /* CONFIG_OF */
+
 	return ret;
 }
-EXPORT_SYMBOL_GPL(bgpio_init);
+EXPORT_SYMBOL_GPL(bgpio_init_info);
 
 #ifdef CONFIG_GPIO_BASIC_MMIO
 
@@ -444,73 +456,185 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	return ret;
 }
 
-static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
+static int bgpio_add_info(struct platform_device *pdev,
+			  const struct bgpio_info *info)
+{
+	int err;
+	struct bgpio_chip *bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc),
+					      GFP_KERNEL);
+	struct list_head *banks = platform_get_drvdata(pdev);
+
+	if (!bgc)
+		return -ENOMEM;
+
+	err = bgpio_init_info(bgc, &pdev->dev, info);
+	if (err)
+		return err;
+
+	list_add_tail(&bgc->head, banks);
+
+	return gpiochip_add(&bgc->gc);
+}
+
+static int bgpio_platform_probe(struct platform_device *pdev)
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
+	struct bgpio_info info = {};
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
 		return -EINVAL;
 
-	sz = resource_size(r);
+	info.sz = resource_size(r);
+	info.ngpio = info.sz * 8;
+	info.base = -1;
 
-	dat = bgpio_map(pdev, "dat", sz, &err);
-	if (!dat)
+	info.dat = bgpio_map(pdev, "dat", info.sz, &err);
+	if (!info.dat)
 		return err ? err : -EINVAL;
 
-	set = bgpio_map(pdev, "set", sz, &err);
+	info.set = bgpio_map(pdev, "set", info.sz, &err);
 	if (err)
 		return err;
 
-	clr = bgpio_map(pdev, "clr", sz, &err);
+	info.clr = bgpio_map(pdev, "clr", info.sz, &err);
 	if (err)
 		return err;
 
-	dirout = bgpio_map(pdev, "dirout", sz, &err);
+	info.dirout = bgpio_map(pdev, "dirout", info.sz, &err);
 	if (err)
 		return err;
 
-	dirin = bgpio_map(pdev, "dirin", sz, &err);
+	info.dirin = bgpio_map(pdev, "dirin", info.sz, &err);
 	if (err)
 		return err;
 
-	be = !strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be");
-
-	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
-	if (!bgc)
-		return -ENOMEM;
-
-	err = bgpio_init(bgc, dev, sz, dat, set, clr, dirout, dirin, be);
-	if (err)
-		return err;
+	info.be = !strcmp(platform_get_device_id(pdev)->name,
+			   "basic-mmio-gpio-be");
 
 	if (pdata) {
-		bgc->gc.base = pdata->base;
+		info.base = pdata->base;
 		if (pdata->ngpio > 0)
-			bgc->gc.ngpio = pdata->ngpio;
+			info.ngpio = pdata->ngpio;
 	}
 
-	platform_set_drvdata(pdev, bgc);
+	return bgpio_add_info(pdev, &info);
+}
 
-	return gpiochip_add(&bgc->gc);
+static void bgpio_remove_all_banks(struct platform_device *pdev)
+{
+	struct bgpio_chip *bgc;
+	struct list_head *banks = platform_get_drvdata(pdev);
+
+	list_for_each_entry(bgc, banks, head)
+		bgpio_remove(bgc);
+}
+
+#ifdef CONFIG_OF
+static int bgpio_of_add_one_bank(struct platform_device *pdev,
+				 struct device_node *np, void __iomem *iobase,
+				 size_t reg_width_bytes, bool be)
+{
+	struct bgpio_info info = {
+		.sz = reg_width_bytes,
+		.base = -1,
+		.be = be,
+	};
+	u32 val;
+
+	if (of_property_read_u32(np, "regoffset-dat", &val))
+		return -EINVAL;
+	info.dat = iobase + val;
+
+	if (!of_property_read_u32(np, "regoffset-set", &val))
+		info.set = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-clr", &val))
+		info.clr = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-dirout", &val))
+		info.dirout = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-dirin", &val))
+		info.dirin = iobase + val;
+
+	if (of_property_read_u32(np, "basic-mmio-gpio,nr-gpio", &val))
+		return -EINVAL;
+
+	info.ngpio = val;
+	info.of_node = np;
+
+	return bgpio_add_info(pdev, &info);
+}
+
+static int bgpio_of_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	void __iomem *iobase = of_iomap(np, 0);
+	int err = 0;
+	u32 val;
+	size_t reg_width_bytes;
+	bool be;
+
+	if (!iobase)
+		return -EIO;
+
+	if (of_property_read_u32(np, "basic-mmio-gpio,reg-io-width", &val))
+		return -EINVAL;
+	reg_width_bytes = val;
+
+	be = of_get_property(np, "basic-mmio-gpio,big-endian", NULL) ?
+		true : false;
+
+	for_each_compatible_node(np, NULL, "basic-mmio-gpio-bank") {
+		err = bgpio_of_add_one_bank(pdev, np, iobase,
+					    reg_width_bytes, be);
+		if (err)
+			goto out_remove;
+	}
+
+	return 0;
+
+out_remove:
+	bgpio_remove_all_banks(pdev);
+
+	return err;
+}
+
+static const struct of_device_id bgpio_of_id_table[] = {
+	{ .compatible = "basic-mmio-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bgpio_of_id_table);
+#else /* CONFIG_OF */
+static inline int bgpio_of_probe(struct platform_device *pdev)
+{
+	return -ENODEV;
+}
+
+#define bgpio_of_id_table NULL
+#endif /* CONFIG_OF */
+
+static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
+{
+	struct list_head *banks = devm_kzalloc(&pdev->dev, sizeof(*banks),
+					       GFP_KERNEL);
+
+	if (!banks)
+		return -ENOMEM;
+	INIT_LIST_HEAD(banks);
+	platform_set_drvdata(pdev, banks);
+
+	if (platform_get_device_id(pdev))
+		return bgpio_platform_probe(pdev);
+	else
+		return bgpio_of_probe(pdev);
 }
 
 static int __devexit bgpio_pdev_remove(struct platform_device *pdev)
 {
-	struct bgpio_chip *bgc = platform_get_drvdata(pdev);
+	bgpio_remove_all_banks(pdev);
 
-	return bgpio_remove(bgc);
+	return 0;
 }
 
 static const struct platform_device_id bgpio_id_table[] = {
@@ -523,6 +647,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver = {
 	.driver = {
 		.name = "basic-mmio-gpio",
+		.of_match_table = bgpio_of_id_table,
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 98999cf..6df1766 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -56,6 +56,9 @@ struct bgpio_chip {
 
 	/* Shadowed direction registers to clear/set direction safely. */
 	unsigned long dir;
+
+	/* List to store multiple banks for a single device. */
+	struct list_head head;
 };
 
 static inline struct bgpio_chip *to_bgpio_chip(struct gpio_chip *gc)
@@ -64,14 +67,71 @@ static inline struct bgpio_chip *to_bgpio_chip(struct gpio_chip *gc)
 }
 
 int __devexit bgpio_remove(struct bgpio_chip *bgc);
-int __devinit bgpio_init(struct bgpio_chip *bgc,
-			 struct device *dev,
-			 unsigned long sz,
-			 void __iomem *dat,
-			 void __iomem *set,
-			 void __iomem *clr,
-			 void __iomem *dirout,
-			 void __iomem *dirin,
-			 bool big_endian);
+
+/**
+ * struct bgpio_info - generic gpio chip descriptor
+ *
+ * @dat: the data register, used to read the gpio values and set them if
+ *	@set == NULL.
+ * @set: the set register, used to set the value of a GPIO pin (write a 1 bit
+ *	to set high).  Writing a 0 bit will set the pin to low if @clr ==
+ *	NULL.
+ * @clr: the clear register, used to set the value of a pin to low.
+ * @dirout: the direction out register.  Writing a 1 bit here will set the
+ *	pin to an output.  Writing a 0 bit will set the gpio to be an input
+ *	pin.
+ * @dirin: the direction in register.  Writing a 1 bit here will set the
+ *	pin to an input.  Writing a 0 bit will set the gpio to be an output
+ *	pin.
+ * @sz: the width of the registers in bytes.
+ * @be: set to true to indicate the registers are big endian.
+ * @ngpio: the number of pins in the bank.
+ * @base: the base Linux GPIO number to use for the gpio_chip.
+ * @of_node: the device tree node associated with the bank.
+ *
+ * This structure defines the properties of a GPIO controller for use with
+ * bgpio_init_info().  This should be populated with the registers, sizes and
+ * other characteristics then passed to bgpio_init_info() to intitialise a
+ * bgpio_chip ready for registration.
+ */
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
+	struct device_node *of_node;
+};
+
+int bgpio_init_info(struct bgpio_chip *bgc, struct device *dev,
+		    const struct bgpio_info *info);
+
+static inline int bgpio_init(struct bgpio_chip *bgc,
+			     struct device *dev,
+			     unsigned long sz,
+			     void __iomem *dat,
+			     void __iomem *set,
+			     void __iomem *clr,
+			     void __iomem *dirout,
+			     void __iomem *dirin,
+			     bool big_endian)
+{
+	struct bgpio_info info = {
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.sz = sz,
+		.ngpio = sz * 8,
+		.base = -1,
+	};
+
+	return bgpio_init_info(bgc, dev, &info);
+}
 
 #endif /* __BASIC_MMIO_GPIO_H */
-- 
1.7.4.1
