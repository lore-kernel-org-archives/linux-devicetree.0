From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/13] pinctrl: add bcm63xx base code
Date: Fri, 19 Aug 2016 12:53:33 +0200
Message-ID: <1471604025-21575-2-git-send-email-jonas.gorski@gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471604025-21575-1-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Setup directory and add a helper for bcm63xx pinctrl support.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 MAINTAINERS                               |   1 +
 drivers/pinctrl/Kconfig                   |   1 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/bcm63xx/Kconfig           |   3 +
 drivers/pinctrl/bcm63xx/Makefile          |   1 +
 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c | 141 ++++++++++++++++++++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h |  14 +++
 7 files changed, 162 insertions(+)
 create mode 100644 drivers/pinctrl/bcm63xx/Kconfig
 create mode 100644 drivers/pinctrl/bcm63xx/Makefile
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bb1d0..33c3026 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2604,6 +2604,7 @@ F:	arch/mips/boot/dts/brcm/bcm*.dts*
 F:	drivers/irqchip/irq-bcm63*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
+F:	drivers/pinctrl/bcm63xx/*
 F:	include/linux/bcm963xx_nvram.h
 F:	include/linux/bcm963xx_tag.h
 
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b3fe1d3..13a2b29 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -255,6 +255,7 @@ config PINCTRL_ZYNQ
 	  This selects the pinctrl driver for Xilinx Zynq.
 
 source "drivers/pinctrl/bcm/Kconfig"
+source "drivers/pinctrl/bcm63xx/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
 source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 8ebd7b8..366e574 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= bcm/
+obj-y				+= bcm63xx/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
diff --git a/drivers/pinctrl/bcm63xx/Kconfig b/drivers/pinctrl/bcm63xx/Kconfig
new file mode 100644
index 0000000..dd58f95
--- /dev/null
+++ b/drivers/pinctrl/bcm63xx/Kconfig
@@ -0,0 +1,3 @@
+config PINCTRL_BCM63XX
+	bool
+	select GPIO_GENERIC
diff --git a/drivers/pinctrl/bcm63xx/Makefile b/drivers/pinctrl/bcm63xx/Makefile
new file mode 100644
index 0000000..d16e74b
--- /dev/null
+++ b/drivers/pinctrl/bcm63xx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PINCTRL_BCM63XX)	+= pinctrl-bcm63xx.o
diff --git a/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c
new file mode 100644
index 0000000..e118171
--- /dev/null
+++ b/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c
@@ -0,0 +1,141 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2016 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+
+#include "pinctrl-bcm63xx.h"
+#include "../core.h"
+
+#define BANK_SIZE	sizeof(u32)
+#define PINS_PER_BANK	(BANK_SIZE * BITS_PER_BYTE)
+
+#ifdef CONFIG_OF
+static int bcm63xx_gpio_of_xlate(struct gpio_chip *gc,
+				 const struct of_phandle_args *gpiospec,
+				 u32 *flags)
+{
+	struct gpio_chip *base = gpiochip_get_data(gc);
+	int pin = gpiospec->args[0];
+
+	if (gc != &base[pin / PINS_PER_BANK])
+		return -EINVAL;
+
+	pin = pin % PINS_PER_BANK;
+
+	if (pin >= gc->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return pin;
+}
+#endif
+
+static int bcm63xx_setup_gpio(struct device *dev, struct gpio_chip *gc,
+			      void __iomem *dirout, void __iomem *data,
+			      size_t sz, int ngpio)
+
+{
+	int banks, chips, i, ret = -EINVAL;
+
+	chips = DIV_ROUND_UP(ngpio, PINS_PER_BANK);
+	banks = sz / BANK_SIZE;
+
+	for (i = 0; i < chips; i++) {
+		int offset, pins;
+		int reg_offset;
+		char *label;
+
+		label = devm_kasprintf(dev, GFP_KERNEL, "bcm63xx-gpio.%i", i);
+		if (!label)
+			return -ENOMEM;
+
+		offset = i * PINS_PER_BANK;
+		pins = min_t(int, ngpio - offset, PINS_PER_BANK);
+
+		/* the registers are treated like a huge big endian register */
+		reg_offset = (banks - i - 1) * BANK_SIZE;
+
+		ret = bgpio_init(&gc[i], dev, BANK_SIZE, data + reg_offset,
+				 NULL, NULL, dirout + reg_offset, NULL,
+				 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+		if (ret)
+			return ret;
+
+		gc[i].request = gpiochip_generic_request;
+		gc[i].free = gpiochip_generic_free;
+
+#ifdef CONFIG_OF
+		gc[i].of_gpio_n_cells = 2;
+		gc[i].of_xlate = bcm63xx_gpio_of_xlate;
+#endif
+
+		gc[i].label = label;
+		gc[i].ngpio = pins;
+
+		devm_gpiochip_add_data(dev, &gc[i], gc);
+	}
+
+	return 0;
+}
+
+static void bcm63xx_setup_pinranges(struct gpio_chip *gc, const char *name,
+				    int ngpio)
+{
+	int i, chips = DIV_ROUND_UP(ngpio, PINS_PER_BANK);
+
+	for (i = 0; i < chips; i++) {
+		int offset, pins;
+
+		offset = i * PINS_PER_BANK;
+		pins = min_t(int, ngpio - offset, PINS_PER_BANK);
+
+		gpiochip_add_pin_range(&gc[i], name, 0, offset, pins);
+	}
+}
+
+struct pinctrl_dev *bcm63xx_pinctrl_register(struct platform_device *pdev,
+					     struct pinctrl_desc *desc,
+					     void *priv, struct gpio_chip *gc,
+					     int ngpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct resource *res;
+	void __iomem *dirout, *data;
+	size_t sz;
+	int ret;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirout");
+	dirout = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dirout))
+		return ERR_CAST(dirout);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
+	data = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data))
+		return ERR_CAST(data);
+
+	sz = resource_size(res);
+
+	ret = bcm63xx_setup_gpio(&pdev->dev, gc, dirout, data, sz, ngpio);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pctldev = devm_pinctrl_register(&pdev->dev, desc, priv);
+	if (IS_ERR(pctldev))
+		return pctldev;
+
+	bcm63xx_setup_pinranges(gc, pinctrl_dev_get_devname(pctldev), ngpio);
+
+	dev_info(&pdev->dev, "registered at mmio %p\n", dirout);
+
+	return pctldev;
+}
diff --git a/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h
new file mode 100644
index 0000000..9bfe1d0
--- /dev/null
+++ b/drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h
@@ -0,0 +1,14 @@
+#ifndef __PINCTRL_BCM63XX
+#define __PINCTRL_BCM63XX
+
+#include <linux/kernel.h>
+#include <linux/gpio.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+
+struct pinctrl_dev *bcm63xx_pinctrl_register(struct platform_device *pdev,
+					     struct pinctrl_desc *desc,
+					     void *priv, struct gpio_chip *gc,
+					     int ngpio);
+
+#endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
