From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Sat, 16 May 2015 00:27:23 +0200
Message-ID: <1431728843-21583-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: devicetree@vger.kernel.org

Add a GPIO driver for the General I/O block on Axis ETRAX FS SoCs.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 .../devicetree/bindings/gpio/gpio-etraxfs.txt      |  21 +++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-etraxfs.c                        | 181 +++++++++++++++++++++
 4 files changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
 create mode 100644 drivers/gpio/gpio-etraxfs.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
new file mode 100644
index 0000000..dad24ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
@@ -0,0 +1,21 @@
+Axis ETRAX FS General I/O controller bindings
+
+Required properties:
+
+- compatible:
+  - "axis,etraxfs-gio"
+- reg: Physical base address and length of the controller's registers.
+- #gpio-cells: Should be 3
+  - The first cell is the port number (hex).
+  - The seconds cell is the gpio offset number.
+  - The third cell is reserved and is currently unused.
+- gpio-controller: Marks the device node as a GPIO controller.
+
+Example:
+
+	gio: gpio@b001a000 {
+		compatible = "axis,etraxfs-gio";
+		reg = <0xb001a000 0x1000>;
+		gpio-controller;
+		#gpio-cells = <3>;
+	};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index caefe80..fe0b9da 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -159,6 +159,14 @@ config GPIO_EP93XX
 	depends on ARCH_EP93XX
 	select GPIO_GENERIC
 
+config GPIO_ETRAXFS
+	bool "Axis ETRAX FS General I/O"
+	depends on CRIS || COMPILE_TEST
+	depends on OF
+	select GPIO_GENERIC
+	help
+	  Say yes here to support the GPIO controller on Axis ETRAX FS SoCs.
+
 config GPIO_F7188X
 	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
 	depends on X86
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f71bb97..4f816ec 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_DLN2)		+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DWAPB)	+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EM)		+= gpio-em.o
 obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
+obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o
 obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
 obj-$(CONFIG_GPIO_GE_FPGA)	+= gpio-ge.o
 obj-$(CONFIG_GPIO_GRGPIO)	+= gpio-grgpio.o
diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
new file mode 100644
index 0000000..93ec548
--- /dev/null
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -0,0 +1,181 @@
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/basic_mmio_gpio.h>
+
+#define ETRAX_FS_rw_pa_dout	0
+#define ETRAX_FS_r_pa_din	4
+#define ETRAX_FS_rw_pa_oe	8
+#define ETRAX_FS_rw_intr_cfg	12
+#define ETRAX_FS_rw_intr_mask	16
+#define ETRAX_FS_rw_ack_intr	20
+#define ETRAX_FS_r_intr		24
+#define ETRAX_FS_rw_pb_dout	32
+#define ETRAX_FS_r_pb_din	36
+#define ETRAX_FS_rw_pb_oe	40
+#define ETRAX_FS_rw_pc_dout	48
+#define ETRAX_FS_r_pc_din	52
+#define ETRAX_FS_rw_pc_oe	56
+#define ETRAX_FS_rw_pd_dout	64
+#define ETRAX_FS_r_pd_din	68
+#define ETRAX_FS_rw_pd_oe	72
+#define ETRAX_FS_rw_pe_dout	80
+#define ETRAX_FS_r_pe_din	84
+#define ETRAX_FS_rw_pe_oe	88
+
+struct etraxfs_gpio_port {
+	const char *label;
+	unsigned int oe;
+	unsigned int dout;
+	unsigned int din;
+	unsigned int ngpio;
+};
+
+struct etraxfs_gpio_info {
+	int num_ports;
+	const struct etraxfs_gpio_port *ports;
+};
+
+static const struct etraxfs_gpio_port etraxfs_gpio_etraxfs_ports[] = {
+	{
+		.label	= "A",
+		.ngpio	= 8,
+		.oe	= ETRAX_FS_rw_pa_oe,
+		.dout	= ETRAX_FS_rw_pa_dout,
+		.din	= ETRAX_FS_r_pa_din,
+	},
+	{
+		.label	= "B",
+		.ngpio	= 18,
+		.oe	= ETRAX_FS_rw_pb_oe,
+		.dout	= ETRAX_FS_rw_pb_dout,
+		.din	= ETRAX_FS_r_pb_din,
+	},
+	{
+		.label	= "C",
+		.ngpio	= 18,
+		.oe	= ETRAX_FS_rw_pc_oe,
+		.dout	= ETRAX_FS_rw_pc_dout,
+		.din	= ETRAX_FS_r_pc_din,
+	},
+	{
+		.label	= "D",
+		.ngpio	= 18,
+		.oe	= ETRAX_FS_rw_pd_oe,
+		.dout	= ETRAX_FS_rw_pd_dout,
+		.din	= ETRAX_FS_r_pd_din,
+	},
+	{
+		.label	= "E",
+		.ngpio	= 18,
+		.oe	= ETRAX_FS_rw_pe_oe,
+		.dout	= ETRAX_FS_rw_pe_dout,
+		.din	= ETRAX_FS_r_pe_din,
+	},
+};
+
+static const struct etraxfs_gpio_info etraxfs_gpio_etraxfs = {
+	.num_ports = ARRAY_SIZE(etraxfs_gpio_etraxfs_ports),
+	.ports = etraxfs_gpio_etraxfs_ports,
+};
+
+static int etraxfs_gpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	/*
+	 * Port numbers are A to E, and the properties are integers, so we
+	 * specify them as 0xA - 0xE.
+	 */
+	if (gc->label[0] - 'A' + 0xA != gpiospec->args[0])
+		return -EINVAL;
+
+	if (gpiospec->args[1] >= gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[2];
+
+	return gpiospec->args[1];
+}
+
+static const struct of_device_id etraxfs_gpio_of_table[] = {
+	{
+		.compatible = "axis,etraxfs-gio",
+		.data = &etraxfs_gpio_etraxfs,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, etraxfs_gpio_of_table);
+
+static int etraxfs_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct etraxfs_gpio_info *info;
+	const struct of_device_id *match;
+	struct bgpio_chip *chips;
+	struct resource *res;
+	void __iomem *regs;
+	int ret;
+	int i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(dev, res);
+	if (!regs)
+		return -ENOMEM;
+
+	match = of_match_node(etraxfs_gpio_of_table, dev->of_node);
+	if (!match)
+		return -EINVAL;
+
+	info = match->data;
+
+	chips = devm_kzalloc(dev, sizeof(*chips) * info->num_ports, GFP_KERNEL);
+	if (!chips)
+		return -ENOMEM;
+
+	for (i = 0; i < info->num_ports; i++) {
+		struct bgpio_chip *bgc = &chips[i];
+		const struct etraxfs_gpio_port *port = &info->ports[i];
+
+		ret = bgpio_init(bgc, dev, 4,
+				 regs + port->din,	/* dat */
+				 regs + port->dout,	/* set */
+				 NULL,			/* clr */
+				 regs + port->oe,	/* dirout */
+				 NULL,			/* dirin */
+				 BGPIOF_UNREADABLE_REG_SET);
+		if (ret)
+			return ret;
+
+		bgc->gc.ngpio = port->ngpio;
+		bgc->gc.label = port->label;
+
+		bgc->gc.of_node = dev->of_node;
+		bgc->gc.of_gpio_n_cells = 3;
+		bgc->gc.of_xlate = etraxfs_gpio_of_xlate;
+
+		ret = gpiochip_add(&bgc->gc);
+		if (ret)
+			dev_err(dev, "Unable to register port %s\n",
+				bgc->gc.label);
+	}
+
+	return 0;
+}
+
+static struct platform_driver etraxfs_gpio_driver = {
+	.driver = {
+		.name		= "etraxfs-gpio",
+		.of_match_table = of_match_ptr(etraxfs_gpio_of_table),
+	},
+	.probe	= etraxfs_gpio_probe,
+};
+
+module_platform_driver(etraxfs_gpio_driver);
+
+MODULE_DESCRIPTION("ETRAX FS GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.1.4
