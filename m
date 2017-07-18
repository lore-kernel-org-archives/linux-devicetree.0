From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARC: reset: introduce HSDKv1 reset driver
Date: Tue, 18 Jul 2017 20:25:20 +0300
Message-ID: <20170718172520.25546-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The HSDK v1 periphery IPs can be reset by accessing some registers
from the CGU block.

The list of available reset lines is documented in the DT bindings.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 .../bindings/reset/snps,hsdk-v1-reset.txt          |  28 ++++
 MAINTAINERS                                        |   7 +
 drivers/reset/Kconfig                              |   6 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-hsdk-v1.c                      | 141 +++++++++++++++++++++
 include/dt-bindings/reset/snps,hsdk-v1-reset.h     |  17 +++
 6 files changed, 200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
 create mode 100644 drivers/reset/reset-hsdk-v1.c
 create mode 100644 include/dt-bindings/reset/snps,hsdk-v1-reset.h

diff --git a/Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt b/Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
new file mode 100644
index 0000000..4fdea89
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
@@ -0,0 +1,28 @@
+Binding for the HSDK v1 reset controller
+
+This binding uses the common reset binding[1].
+
+[1] Documentation/devicetree/bindings/reset/reset.txt
+
+Required properties:
+- compatible: should be "snps,hsdk-v1.0-reset".
+- reg: should always contain 2 pairs address - length: first for reset
+  configuration registers and second for corresponding SW reset and status bits
+  register.
+- #reset-cells: from common reset binding; Should always be set to 1.
+
+Example:
+	reset: reset@880 {
+		compatible = "snps,hsdk-v1.0-reset";
+		#reset-cells = <1>;
+		reg = <0x880 0x80>, <0xFF0 0x4>;
+	};
+
+Specifying reset lines connected to IP modules:
+	ethernet@.... {
+		....
+		resets = <&reset HSDK_V1_ETH_RESET>;
+		....
+	};
+
+The index could be found in <dt-bindings/reset/snps,hsdk-v1-reset.h>
diff --git a/MAINTAINERS b/MAINTAINERS
index 09b5ab6..99deabb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11307,6 +11307,13 @@ L:	linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	drivers/mmc/host/dw_mmc*
 
+SYNOPSYS HSDK RESET CONTROLLER DRIVER
+M:	Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
+S:	Supported
+F:	drivers/reset/reset-hsdk-v1.c
+F:	include/dt-bindings/reset/snps,hsdk-v1-reset.h
+F:	Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
+
 SYSTEM TRACE MODULE CLASS
 M:	Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 S:	Maintained
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d21c07c..cb13f0d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -34,6 +34,12 @@ config RESET_BERLIN
 	help
 	  This enables the reset controller driver for Marvell Berlin SoCs.
 
+config RESET_HSDK_V1
+	bool "HSDK v1 Reset Driver"
+	default n
+	help
+	  This enables the reset controller driver for HSDK v1.
+
 config RESET_IMX7
 	bool "i.MX7 Reset Driver" if COMPILE_TEST
 	default SOC_IMX7D
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 02a74db..772e5f2 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
+obj-$(CONFIG_RESET_HSDK_V1) += reset-hsdk-v1.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
diff --git a/drivers/reset/reset-hsdk-v1.c b/drivers/reset/reset-hsdk-v1.c
new file mode 100644
index 0000000..64d2a6e
--- /dev/null
+++ b/drivers/reset/reset-hsdk-v1.c
@@ -0,0 +1,141 @@
+/*
+ * Copyright (C) 2017 Synopsys.
+ *
+ * Synopsys HSDKv1 SDP reset driver.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define to_hsdkv1_rst(p)	container_of((p), struct hsdkv1_rst, rcdev)
+
+struct hsdkv1_rst {
+	void __iomem			*regs_ctl;
+	void __iomem			*regs_rst;
+	spinlock_t			lock;
+	struct reset_controller_dev	rcdev;
+};
+
+static const u32 rst_map[] = {
+	BIT(16), /* APB_RST  */
+	BIT(17), /* AXI_RST  */
+	BIT(18), /* ETH_RST  */
+	BIT(19), /* USB_RST  */
+	BIT(20), /* SDIO_RST */
+	BIT(21), /* HDMI_RST */
+	BIT(22), /* GFX_RST  */
+	BIT(25), /* DMAC_RST */
+	BIT(31), /* EBI_RST  */
+};
+
+#define HSDK_MAX_RESETS			ARRAY_SIZE(rst_map)
+
+#define CGU_ARC_RST_CTRL		0x0
+#define CGU_SYS_RST_CTRL		0x20
+#define CGU_DDR_RST_CTRL		0x40
+#define CGU_TUN_RST_CTRL		0x60
+
+#define CGU_IP_SW_RESET			0x0
+#define CGU_IP_SW_RESET_DELAY_SHIFT	16
+#define CGU_IP_SW_RESET_DELAY_MASK	GENMASK(31, CGU_IP_SW_RESET_DELAY_SHIFT)
+#define CGU_IP_SW_RESET_DELAY		0
+#define CGU_IP_SW_RESET_RESET		BIT(0)
+#define SW_RESET_TIMEOUT		10000
+
+static void hsdkv1_reset_config(struct hsdkv1_rst *rst, unsigned long id)
+{
+	writel(rst_map[id], rst->regs_ctl + CGU_SYS_RST_CTRL);
+}
+
+static int hsdkv1_reset_do(struct hsdkv1_rst *rst)
+{
+	u32 reg;
+
+	reg = readl(rst->regs_rst + CGU_IP_SW_RESET);
+	reg &= ~CGU_IP_SW_RESET_DELAY_MASK;
+	reg |= CGU_IP_SW_RESET_DELAY << CGU_IP_SW_RESET_DELAY_SHIFT;
+	reg |= CGU_IP_SW_RESET_RESET;
+	writel(reg, rst->regs_rst + CGU_IP_SW_RESET);
+
+	/* wait till reset bit is back to 0 */
+	return readl_poll_timeout_atomic(rst->regs_rst + CGU_IP_SW_RESET, reg,
+		!(reg & CGU_IP_SW_RESET_RESET), 5, SW_RESET_TIMEOUT);
+}
+
+static int hsdkv1_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct hsdkv1_rst *rst = to_hsdkv1_rst(rcdev);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&rst->lock, flags);
+	hsdkv1_reset_config(rst, id);
+	ret = hsdkv1_reset_do(rst);
+	spin_unlock_irqrestore(&rst->lock, flags);
+
+	return ret;
+}
+
+static const struct reset_control_ops hsdkv1_reset_ops = {
+	.reset	= hsdkv1_reset_reset,
+};
+
+static int hsdkv1_reset_probe(struct platform_device *pdev)
+{
+	struct hsdkv1_rst *rst;
+	struct resource *mem;
+
+	rst = devm_kzalloc(&pdev->dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rst->regs_ctl = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(rst->regs_ctl))
+		return PTR_ERR(rst->regs_ctl);
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	rst->regs_rst = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(rst->regs_rst))
+		return PTR_ERR(rst->regs_rst);
+
+	spin_lock_init(&rst->lock);
+
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.ops = &hsdkv1_reset_ops;
+	rst->rcdev.of_node = pdev->dev.of_node;
+	rst->rcdev.nr_resets = HSDK_MAX_RESETS;
+	rst->rcdev.of_reset_n_cells = 1;
+
+	return reset_controller_register(&rst->rcdev);
+}
+
+static const struct of_device_id hsdkv1_reset_dt_match[] = {
+	{ .compatible = "snps,hsdk-v1.0-reset" },
+	{ },
+};
+
+static struct platform_driver hsdkv1_reset_driver = {
+	.probe	= hsdkv1_reset_probe,
+	.driver	= {
+		.name = "hsdk-v1.0-reset",
+		.of_match_table = hsdkv1_reset_dt_match,
+	},
+};
+builtin_platform_driver(hsdkv1_reset_driver);
+
+MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>");
+MODULE_DESCRIPTION("Synopsys HSDKv1 SDP reset driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/reset/snps,hsdk-v1-reset.h b/include/dt-bindings/reset/snps,hsdk-v1-reset.h
new file mode 100644
index 0000000..d898c89
--- /dev/null
+++ b/include/dt-bindings/reset/snps,hsdk-v1-reset.h
@@ -0,0 +1,17 @@
+/**
+ * This header provides index for the HSDK v1 reset controller.
+ */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_HSDK_V1
+#define _DT_BINDINGS_RESET_CONTROLLER_HSDK_V1
+
+#define HSDK_V1_APB_RESET	0
+#define HSDK_V1_AXI_RESET	1
+#define HSDK_V1_ETH_RESET	2
+#define HSDK_V1_USB_RESET	3
+#define HSDK_V1_SDIO_RESET	4
+#define HSDK_V1_HDMI_RESET	5
+#define HSDK_V1_GFX_RESET	6
+#define HSDK_V1_DMAC_RESET	7
+#define HSDK_V1_EBI_RESET	8
+
+#endif /*_DT_BINDINGS_RESET_CONTROLLER_HSDK_V1*/
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
