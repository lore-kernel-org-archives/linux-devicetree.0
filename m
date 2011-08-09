From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv4] mtd: gpio-nand: add device tree bindings
Date: Tue,  9 Aug 2011 16:12:27 +0100
Message-ID: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
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
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings so that the gpio-nand driver may be
instantiated from the device tree.  This also allows the partitions
to be specified in the device tree.

v4:
	- get io sync address from gpio-control-nand,io-sync-reg
	  property rather than a resource
	- clarified a few details in the binding
v3:
	- remove redundant cast and a couple of whitespace/naming
	  changes
v2:
	- add CONFIG_OF guards for non-dt platforms
	- compatible becomes gpio-control-nand
	- clarify some binding details

Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---

Grant, I dropped your Acked-by as I thought the change to the io-sync
stuff was significant enough for that.  

 .../devicetree/bindings/mtd/gpio-control-nand.txt  |   44 ++++++
 drivers/mtd/nand/gpio.c                            |  139 ++++++++++++++++++-
 2 files changed, 175 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
new file mode 100644
index 0000000..8654294
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -0,0 +1,44 @@
+GPIO assisted NAND flash
+
+The GPIO assisted NAND flash uses a memory mapped interface to
+read/write the NAND commands and data and GPIO pins for the control
+signals.
+
+Required properties:
+- compatible : "gpio-control-nand"
+- reg : should specify localbus chip select and size used for the chip.  The
+  resource describes the data bus connected to the NAND flash and all accesses
+  are made in native endianness.
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- gpios : specifies the gpio pins to control the NAND device.  nwp is an
+  optional gpio and may be set to 0 if not present.
+
+Optional properties:
+- bank-width : Width (in bytes) of the device.  If not present, the width
+  defaults to 8 bits.
+- chip-delay : chip dependent delay for transferring data from array to
+  read registers (tR).  If not present then a default of 0 is used.
+- gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
+  location used to guard against bus reordering with regards to accesses to
+  the GPIO's and the NAND flash data bus.  If present, then after changing
+  GPIO state, this register will be read to ensure that the accesses have
+  completed.
+
+Examples:
+
+gpio-nand@1,0 {
+	compatible = "gpio-control-nand";
+	reg = <1 0x0000 0x2>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	gpios = <&banka 1 0	/* rdy */
+		 &banka 2 0 	/* nce */
+		 &banka 3 0 	/* ale */
+		 &banka 4 0 	/* cle */
+		 0		/* nwp */>;
+
+	partition@0 {
+	...
+	};
+};
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 2c2060b..89b819b 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -27,6 +27,9 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/nand-gpio.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
 
 struct gpiomtd {
 	void __iomem		*io_sync;
@@ -171,6 +174,99 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 	return gpio_get_value(gpiomtd->plat.gpio_rdy);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_nand_id_table[] = {
+	{ .compatible = "gpio-control-nand" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
+
+static int gpio_nand_of_get_options(struct device *dev,
+				    struct gpio_nand_platdata *plat)
+{
+	u32 width;
+
+	if (!of_property_read_u32(dev->of_node, "bank-width", &width)) {
+		if (width == 2) {
+			plat->options |= NAND_BUSWIDTH_16;
+		} else if (width != 1) {
+			dev_err(dev, "invalid bank-width %u\n", width);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void gpio_nand_of_get_gpio(struct device *dev,
+				  struct gpio_nand_platdata *plat)
+{
+	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
+	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
+	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
+	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
+	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
+}
+
+static void gpio_nand_of_get_chip_delay(struct device *dev,
+					struct gpio_nand_platdata *plat)
+{
+	u32 chip_delay;
+
+	if (!of_property_read_u32(dev->of_node, "chip-delay", &chip_delay))
+		plat->chip_delay = (int)chip_delay;
+}
+
+static int gpio_nand_of_get_config(struct device *dev,
+				   struct gpio_nand_platdata *plat)
+{
+	int ret = gpio_nand_of_get_options(dev, plat);
+
+	if (ret < 0)
+		return ret;
+
+	gpio_nand_of_get_gpio(dev, plat);
+	gpio_nand_of_get_chip_delay(dev, plat);
+
+	return 0;
+}
+
+static struct resource *gpio_nand_of_get_io_sync(struct device *dev)
+{
+	struct resource *r = kzalloc(sizeof(*r), GFP_KERNEL);
+	u64 addr;
+
+	if (!r)
+		return NULL;
+
+	if (of_property_read_u64(dev->of_node,
+				 "gpio-control-nand,io-sync-reg", &addr))
+		goto out_free;
+
+	r->start = addr;
+	r->end = r->start + 0x3;
+	r->flags = IORESOURCE_MEM;
+
+	return r;
+
+out_free:
+	kfree(r);
+
+	return NULL;
+}
+#else /* CONFIG_OF */
+#define gpio_nand_id_table NULL
+static inline int gpio_nand_of_get_config(struct device *dev,
+					  struct gpio_nand_platdata *plat)
+{
+	return -ENODEV;
+}
+static inline struct resource *gpio_nand_of_get_io_sync(struct device *dev)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 static int __devexit gpio_nand_remove(struct platform_device *dev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
@@ -178,10 +274,15 @@ static int __devexit gpio_nand_remove(struct platform_device *dev)
 
 	nand_release(&gpiomtd->mtd_info);
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	if (!dev->dev.of_node)
+		res = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	else
+		res = gpio_nand_of_get_io_sync(&dev->dev);
 	iounmap(gpiomtd->io_sync);
 	if (res)
 		release_mem_region(res->start, resource_size(res));
+	if (!dev->dev.of_node)
+		kfree(res);
 
 	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
@@ -226,9 +327,9 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 	struct gpiomtd *gpiomtd;
 	struct nand_chip *this;
 	struct resource *res0, *res1;
-	int ret;
+	int ret = 0;
 
-	if (!dev->dev.platform_data)
+	if (!dev->dev.of_node && !dev->dev.platform_data)
 		return -EINVAL;
 
 	res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
@@ -248,7 +349,11 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		goto err_map;
 	}
 
-	res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	if (!dev->dev.of_node)
+		res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	else
+		res1 = gpio_nand_of_get_io_sync(&dev->dev);
+
 	if (res1) {
 		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
 		if (!gpiomtd->io_sync) {
@@ -257,7 +362,16 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		}
 	}
 
-	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
+	if (dev->dev.of_node)
+		kfree(res1);
+
+	if (dev->dev.platform_data)
+		memcpy(&gpiomtd->plat, dev->dev.platform_data,
+		       sizeof(gpiomtd->plat));
+	else
+		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
+	if (ret)
+		goto err_nce;
 
 	ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
 	if (ret)
@@ -312,10 +426,18 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		goto err_wp;
 	}
 
-	if (gpiomtd->plat.adjust_parts)
-		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
-					   gpiomtd->mtd_info.size);
+	if (dev->dev.platform_data) {
+		if (gpiomtd->plat.adjust_parts)
+			gpiomtd->plat.adjust_parts(&gpiomtd->plat,
+						   gpiomtd->mtd_info.size);
+	} else {
+		ret = of_mtd_parse_partitions(&dev->dev, dev->dev.of_node,
+					      &gpiomtd->plat.parts);
+		if (ret < 0)
+			goto err_wp;
 
+		gpiomtd->plat.num_parts = ret;
+	}
 	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
 			    gpiomtd->plat.num_parts);
 	platform_set_drvdata(dev, gpiomtd);
@@ -352,6 +474,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove		= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
+		.of_match_table = gpio_nand_id_table,
 	},
 };
 
-- 
1.7.4.1
