From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv3] gpio-generic: add support for device tree probing
Date: Fri, 29 Jul 2011 11:45:01 +0100
Message-ID: <1311936301-19942-1-git-send-email-jamie@jamieiles.com>
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

This patch adds support for gpio-generic controllers to be
instantiated from the device tree.  The binding supports devices with
multiple banks.

v3:
	- Remove extraneous of_node_{get,put}().
	- Rename basic-mmio-gpio,reg-io-width to reg-io-width.
	- Use vendor specific compatible values for now.
	- Only add child banks, and allocate banks as an array.
	- Remove bgpio_init_info() and populate bgpio_chip directly.
	- Rename properties to gpio-generic,* to match the driver name.
v2:
	- Added more detail to the binding.
	- Added CONFIG_OF guards.
	- Use regoffset-* properties for each register in each bank.
	  relative to the registers of the controller.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-generic.txt      |   85 ++++++++++
 drivers/gpio/gpio-generic.c                        |  174 ++++++++++++++++++--
 2 files changed, 245 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
new file mode 100644
index 0000000..91c9441
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
@@ -0,0 +1,85 @@
+Generic MMIO GPIO controller
+
+This binding allows lots of common GPIO controllers to use a generic GPIO
+driver.  The top level GPIO node describes the registers for the controller
+and high level properties such as endianness and register width.  Each bank in
+the controller is represented as a child node.
+
+Required properties:
+- compatible : Must be one of:
+  - "snps,dw-apb-gpio" : Synopsys DesignWare APB GPIO controller
+- reg : The register window for the GPIO device.  If the device has multiple
+  banks then this window should cover all of the banks.
+- gpio-generic,reg-io-width : The width of the registers in the controller
+  (in bytes).
+- #address-cells : should be set to 1.
+- #size-cells : should be set to 0.  The addresses of the child nodes are the
+  bank numbers and the child nodes themselves represent the banks in the
+  controller.
+
+Optional properties:
+- gpio-generic,big-endian : the registers are in big-endian byte ordering.
+  If present then the first gpio in the controller occupies the MSB for
+  each register.
+
+Generic MMIO GPIO controller bank
+
+Required properties:
+- compatible : Must be one of:
+  - "snps,dw-apb-gpio-bank" : Synopsys DesignWare APB GPIO controller bank
+- gpio-controller : Marks the node as a GPIO controller.
+- #gpio-cells : Should be two.  The first cell is the pin number and the
+  second cell encodes optional flags (currently unused).
+- gpio-generic,nr-gpio : The number of GPIO pins in the bank.
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
+	compatible = "snps,dw-apb-gpio";
+	reg = <0x20000 0x1000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	gpio-generic,reg-io-width = <4>;
+
+	banka: gpio-controller@0 {
+		compatible = "snps,dw-apb-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-generic,nr-gpio = <8>;
+
+		regoffset-dat = <0x50>;
+		regoffset-set = <0x00>;
+		regoffset-dirout = <0x04>;
+	};
+
+	bankb: gpio-controller@1 {
+		compatible = "snps,dw-apb-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-generic,nr-gpio = <16>;
+
+		regoffset-dat = <0x54>;
+		regoffset-set = <0x0c>;
+		regoffset-dirout = <0x10>;
+	};
+};
diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 231714d..92ae38d 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
 
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -444,7 +447,29 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	return ret;
 }
 
-static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
+struct bgpio_drvdata {
+	struct bgpio_chip	*banks;
+	unsigned int		nr_banks;
+};
+
+static struct bgpio_drvdata *bgpio_alloc_banks(struct device *dev,
+					       unsigned int nr_banks)
+{
+	struct bgpio_drvdata *banks;
+
+	banks = devm_kzalloc(dev, sizeof(*banks), GFP_KERNEL);
+	if (!banks)
+		return NULL;
+
+	banks->banks = devm_kzalloc(dev, sizeof(*banks->banks) * nr_banks,
+				    GFP_KERNEL);
+	if (!banks->banks)
+		return NULL;
+
+	return banks;
+}
+
+static int bgpio_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *r;
@@ -456,8 +481,12 @@ static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long sz;
 	bool be;
 	int err;
-	struct bgpio_chip *bgc;
-	struct bgpio_pdata *pdata = dev_get_platdata(dev);
+	struct bgpio_pdata *pdata = dev_get_platdata(&pdev->dev);
+	struct bgpio_drvdata *banks = bgpio_alloc_banks(&pdev->dev, 1);
+
+	if (!banks)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, banks);
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -485,32 +514,148 @@ static int __devinit bgpio_pdev_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	be = !strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be");
-
-	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
-	if (!bgc)
-		return -ENOMEM;
+	be = !strcmp(platform_get_device_id(pdev)->name,
+		     "basic-mmio-gpio-be");
 
-	err = bgpio_init(bgc, dev, sz, dat, set, clr, dirout, dirin, be);
+	banks->nr_banks = 1;
+	err = bgpio_init(&banks->banks[0], dev, sz, dat, set, clr, dirout,
+			 dirin, be);
 	if (err)
 		return err;
 
 	if (pdata) {
-		bgc->gc.base = pdata->base;
+		banks->banks[0].gc.base = pdata->base;
 		if (pdata->ngpio > 0)
-			bgc->gc.ngpio = pdata->ngpio;
+			banks->banks[0].gc.ngpio = pdata->ngpio;
 	}
 
-	platform_set_drvdata(pdev, bgc);
+	return gpiochip_add(&banks->banks[0].gc);
+}
+
+static void bgpio_remove_all_banks(struct platform_device *pdev)
+{
+	struct bgpio_drvdata *banks = platform_get_drvdata(pdev);
+	unsigned int m;
+
+	for (m = 0; m < banks->nr_banks; ++m)
+		bgpio_remove(&banks->banks[m]);
+}
+
+#ifdef CONFIG_OF
+static int bgpio_of_add_one_bank(struct platform_device *pdev,
+				 struct bgpio_chip *bgc,
+				 struct device_node *np, void __iomem *iobase,
+				 size_t reg_width_bytes, bool be)
+{
+	void __iomem *dat = NULL;
+	void __iomem *set = NULL;
+	void __iomem *clr = NULL;
+	void __iomem *dirout = NULL;
+	void __iomem *dirin = NULL;
+	u32 val;
+	int err;
+
+	if (of_property_read_u32(np, "regoffset-dat", &val))
+		return -EINVAL;
+	dat = iobase + val;
+
+	if (!of_property_read_u32(np, "regoffset-set", &val))
+		set = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-clr", &val))
+		clr = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-dirout", &val))
+		dirout = iobase + val;
+	if (!of_property_read_u32(np, "regoffset-dirin", &val))
+		dirin = iobase + val;
+
+	err = bgpio_init(bgc, &pdev->dev, reg_width_bytes, dat, set, clr,
+			 dirout, dirin, be);
+	if (err)
+		return err;
+
+	if (of_property_read_u32(np, "gpio-generic,nr-gpio", &val))
+		return -EINVAL;
+
+	bgc->gc.ngpio = val;
+	bgc->gc.of_node = np;
 
 	return gpiochip_add(&bgc->gc);
 }
 
+static int bgpio_of_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	void __iomem *iobase = of_iomap(np, 0);
+	int err = 0;
+	u32 val;
+	size_t reg_width_bytes;
+	bool be;
+	int nr_banks = 0;
+	struct bgpio_drvdata *banks;
+
+	if (!iobase)
+		return -EIO;
+
+	if (of_property_read_u32(np, "reg-io-width", &val))
+		return -EINVAL;
+	reg_width_bytes = val;
+
+	be = of_get_property(np, "gpio-generic,big-endian", NULL) ?
+		true : false;
+
+	for_each_child_of_node(pdev->dev.of_node, np)
+		++nr_banks;
+
+	banks = bgpio_alloc_banks(&pdev->dev, nr_banks);
+	if (!banks)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, banks);
+	banks->nr_banks = 0;
+
+	for_each_child_of_node(pdev->dev.of_node, np) {
+		err = bgpio_of_add_one_bank(pdev,
+					    &banks->banks[banks->nr_banks],
+					    np, iobase, reg_width_bytes, be);
+		if (err)
+			goto out_remove;
+		++banks->nr_banks;
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
+	{ .compatible = "snps,dw-apb-gpio", },
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
+	if (platform_get_device_id(pdev))
+		return bgpio_platform_probe(pdev);
+	else
+		return bgpio_of_probe(pdev);
+}
+
 static int __devexit bgpio_pdev_remove(struct platform_device *pdev)
 {
-	struct bgpio_chip *bgc = platform_get_drvdata(pdev);
+	bgpio_remove_all_banks(pdev);
 
-	return bgpio_remove(bgc);
+	return 0;
 }
 
 static const struct platform_device_id bgpio_id_table[] = {
@@ -523,6 +668,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver = {
 	.driver = {
 		.name = "basic-mmio-gpio",
+		.of_match_table = bgpio_of_id_table,
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
-- 
1.7.4.1
