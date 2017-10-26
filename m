From: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Subject: [PATCHv5 2/2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Thu, 26 Oct 2017 15:28:25 +0000
Message-ID: <AM5PR0701MB26575D4E585B51AC8784E49BE4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an internal 32-bit input and 32-bit output port to the FPGA logic.

Instantiate this in the device tree as:

  gpio3: gpio@ff706010 {
   #address-cells = <1>;
   #size-cells = <0>;
   compatible = "altr,fpgamgr-gpio";
   reg = <0xff706010 0x8>;
   status = "okay";

   portd: gpio-controller@0 {
    compatible = "altr,fpgamgr-gpio-output";
    gpio-controller;
    #gpio-cells = <2>;
    reg = <0>;
   };

   porte: gpio-controller@1 {
    compatible = "altr,fpgamgr-gpio-input";
    gpio-controller;
    #gpio-cells = <2>;
    reg = <1>;
   };
  };

Signed-off-by: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
---
 drivers/gpio/Kconfig               |   6 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-altera-fpgamgr.c | 219 +++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 drivers/gpio/gpio-altera-fpgamgr.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3f80f16..6e01a31 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -97,6 +97,12 @@ config GPIO_ALTERA
 
 	  If driver is built as a module it will be called gpio-altera.
 
+config GPIO_ALTERA_FPGAMGR
+	tristate "Altera FPGAMGR GPIO"
+	depends on OF_GPIO
+	help
+	  Say yes here to support the Altera FPGAMGR GPIO device.
+
 config GPIO_AMDPT
 	tristate "AMD Promontory GPIO support"
 	depends on ACPI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index aeb70e9d..3eb73d4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_ALTERA_A10SR)	+= gpio-altera-a10sr.o
+obj-$(CONFIG_GPIO_ALTERA_FPGAMGR)	+= gpio-altera-fpgamgr.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
diff --git a/drivers/gpio/gpio-altera-fpgamgr.c b/drivers/gpio/gpio-altera-fpgamgr.c
new file mode 100644
index 0000000..80eed6d
--- /dev/null
+++ b/drivers/gpio/gpio-altera-fpgamgr.c
@@ -0,0 +1,219 @@
+/*
+ * This is a GPIO driver for the internal FPGA Manager I/O ports
+ * connecting the HPS to the FPGA logic on certain Altera parts.
+ *
+ * Copyright (c) 2015 Softing Industrial Automation GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+#include <linux/gpio/driver.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+struct fpgamgr_port_property {
+	struct device_node		*node;
+	const char			*name;
+	unsigned int			idx;
+};
+
+struct fpgamgr_platform_data {
+	struct fpgamgr_port_property	*properties;
+	unsigned int			nports;
+};
+
+struct fpgamgr_gpio_port {
+	struct gpio_chip		bgc;
+	struct fpgamgr_gpio		*gpio;
+	unsigned int			idx;
+};
+
+struct fpgamgr_gpio {
+	struct	device			*dev;
+	void __iomem			*regs;
+	struct fpgamgr_gpio_port	*ports;
+	unsigned int			nr_ports;
+};
+
+static int fpgamgr_gpio_add_port(struct fpgamgr_gpio *gpio,
+				 struct fpgamgr_port_property *pp,
+				 unsigned int offs)
+{
+	struct fpgamgr_gpio_port *port;
+	void __iomem *dat;
+	int err;
+
+	port = &gpio->ports[offs];
+	port->gpio = gpio;
+	port->idx = pp->idx;
+
+	dat = gpio->regs + (pp->idx * 4);
+
+	err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
+			 NULL, NULL, pp->idx ? BGPIOF_NO_OUTPUT : 0);
+	if (err) {
+		dev_err(gpio->dev, "failed to init gpio chip for %s\n",
+			pp->name);
+		return err;
+	}
+
+	port->bgc.of_node = pp->node;
+
+	err = devm_gpiochip_add_data(gpio->dev, &port->bgc, NULL);
+	if (err)
+		dev_err(gpio->dev, "failed to register gpiochip for %s\n",
+			pp->name);
+
+	return err;
+}
+
+static struct fpgamgr_platform_data *
+fpgamgr_gpio_get_pdata_of(struct device *dev)
+{
+	struct device_node *np = dev->of_node, *port_np;
+	struct fpgamgr_platform_data *pdata;
+	struct fpgamgr_port_property *pp;
+	int nports;
+	int i;
+
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	nports = of_get_child_count(np);
+	if (nports == 0)
+		return ERR_PTR(-ENODEV);
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->properties = kcalloc(nports, sizeof(*pp), GFP_KERNEL);
+	if (!pdata->properties) {
+		kfree(pdata);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	pdata->nports = nports;
+
+	i = 0;
+	for_each_child_of_node(np, port_np) {
+		pp = &pdata->properties[i++];
+		pp->node = port_np;
+
+		if (of_property_read_u32(port_np, "reg", &pp->idx) ||
+		    pp->idx > 1) {
+			dev_err(dev, "missing/invalid port index for %s\n",
+				port_np->full_name);
+			kfree(pdata->properties);
+			kfree(pdata);
+			return ERR_PTR(-EINVAL);
+		}
+
+		pp->name = port_np->full_name;
+	}
+
+	return pdata;
+}
+
+static inline void fpgamgr_free_pdata_of(struct fpgamgr_platform_data *pdata)
+{
+	if (!pdata)
+		return;
+
+	kfree(pdata->properties);
+	kfree(pdata);
+}
+
+static int fpgamgr_gpio_probe(struct platform_device *pdev)
+{
+	unsigned int i;
+	struct resource *res;
+	struct fpgamgr_gpio *fgpio;
+	int err;
+	struct device *dev = &pdev->dev;
+	struct fpgamgr_platform_data *pdata = dev_get_platdata(dev);
+	bool is_pdata_alloc = !pdata;
+
+	if (is_pdata_alloc) {
+		pdata = fpgamgr_gpio_get_pdata_of(dev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	}
+
+	if (!pdata->nports) {
+		err = -ENODEV;
+		goto out_err;
+	}
+
+	fgpio = devm_kzalloc(dev, sizeof(*fgpio), GFP_KERNEL);
+	if (!fgpio) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+	fgpio->dev = dev;
+	fgpio->nr_ports = pdata->nports;
+
+	fgpio->ports = devm_kcalloc(dev, fgpio->nr_ports,
+				   sizeof(*fgpio->ports), GFP_KERNEL);
+	if (!fgpio->ports) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fgpio->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(fgpio->regs)) {
+		err = PTR_ERR(fgpio->regs);
+		goto out_err;
+	}
+
+	for (i = 0; i < fgpio->nr_ports; i++) {
+		err = fpgamgr_gpio_add_port(fgpio, &pdata->properties[i], i);
+		if (err)
+			goto out_unregister;
+	}
+	platform_set_drvdata(pdev, fgpio);
+
+	goto out_err;
+
+out_unregister:
+	while (i > 0)
+		devm_gpiochip_remove(dev, &fgpio->ports[--i].bgc);
+
+out_err:
+	if (is_pdata_alloc)
+		fpgamgr_free_pdata_of(pdata);
+
+	return err;
+}
+
+static const struct of_device_id fpgamgr_of_match[] = {
+	{ .compatible = "altr,fpgamgr-gpio" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fpgamgr_of_match);
+
+static struct platform_driver fpgamgr_gpio_driver = {
+	.driver		= {
+		.name	= "gpio-altera-fpgamgr",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(fpgamgr_of_match),
+	},
+	.probe		= fpgamgr_gpio_probe,
+};
+
+module_platform_driver(fpgamgr_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Bernd Edlinger");
+MODULE_DESCRIPTION("Altera fpgamgr GPIO driver");
-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
