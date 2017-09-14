From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2] ARC: reset: introduce AXS10x reset driver
Date: Thu, 14 Sep 2017 17:28:42 +0300
Message-ID: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

ARC AXS10x boards support custom IP-block which allows to control
reset signals of selected peripherals. For example DW GMAC, etc...
This block is controlled via memory-mapped register (AKA CREG) which
represents up-to 32 reset lines. This regiter is self-clearing so we
don't need to deassert line after reset.

As of today only the following lines are used:
 - DW GMAC - line 5

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1 -> v2:
  * The creg reset register is self-clearing so we don't need to clear it
    manually. Fixed it.
  * Use reset callback instead of assert/deassert pair.
  * Rename reset node in documentation to "reset-controller" for consistency
    with the other bindings.
  * Use devm_reset_controller_register instead of reset_controller_register

NOTE:
    This driver couldn't be replaced by reset-simple driver as we mustn't
    read from reset register or clear it.

 .../bindings/reset/snps,axs10x-reset.txt           | 33 +++++++++
 MAINTAINERS                                        |  6 ++
 drivers/reset/Kconfig                              |  6 ++
 drivers/reset/Makefile                             |  1 +
 drivers/reset/reset-axs10x.c                       | 83 ++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 create mode 100644 drivers/reset/reset-axs10x.c

diff --git a/Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt b/Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
new file mode 100644
index 0000000..32d8435
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
@@ -0,0 +1,33 @@
+Binding for the AXS10x reset controller
+
+This binding describes the ARC AXS10x boards custom IP-block which allows
+to control reset signals of selected peripherals. For example DW GMAC, etc...
+This block is controlled via memory-mapped register (AKA CREG) which
+represents up-to 32 reset lines.
+
+As of today only the following lines are used:
+ - DW GMAC - line 5
+
+This binding uses the common reset binding[1].
+
+[1] Documentation/devicetree/bindings/reset/reset.txt
+
+Required properties:
+- compatible: should be "snps,axs10x-reset".
+- reg: should always contain pair address - length: for creg reset
+  bits register.
+- #reset-cells: from common reset binding; Should always be set to 1.
+
+Example:
+	reset: reset-controller@11220 {
+		compatible = "snps,axs10x-reset";
+		#reset-cells = <1>;
+		reg = <0x11220 0x4>;
+	};
+
+Specifying reset lines connected to IP modules:
+	ethernet@.... {
+		....
+		resets = <&reset 5>;
+		....
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 93dfb9d..f14e804 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12711,6 +12711,12 @@ F:	arch/arc/plat-axs10x
 F:	arch/arc/boot/dts/ax*
 F:	Documentation/devicetree/bindings/arc/axs10*
 
+SYNOPSYS AXS10x RESET CONTROLLER DRIVER
+M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+S:	Supported
+F:	drivers/reset/reset-axs10x.c
+F:	Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
+
 SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 52d5251..65d13f4 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -28,6 +28,12 @@ config RESET_ATH79
 	  This enables the ATH79 reset controller driver that supports the
 	  AR71xx SoC reset controller.
 
+config RESET_AXS10X
+	bool "AXS10x Reset Driver" if COMPILE_TEST
+	default ARC_PLAT_AXS10X
+	help
+	  This enables the reset controller driver for AXS10x.
+
 config RESET_BERLIN
 	bool "Berlin Reset Driver" if COMPILE_TEST
 	default ARCH_BERLIN
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index b62783f..45000a5 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_STI) += sti/
 obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
+obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
diff --git a/drivers/reset/reset-axs10x.c b/drivers/reset/reset-axs10x.c
new file mode 100644
index 0000000..afb298e
--- /dev/null
+++ b/drivers/reset/reset-axs10x.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright (C) 2017 Synopsys.
+ *
+ * Synopsys AXS10x reset driver.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#define to_axs10x_rst(p)	container_of((p), struct axs10x_rst, rcdev)
+
+#define AXS10X_MAX_RESETS	32
+
+struct axs10x_rst {
+	void __iomem			*regs_rst;
+	spinlock_t			lock;
+	struct reset_controller_dev	rcdev;
+};
+
+static int axs10x_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct axs10x_rst *rst = to_axs10x_rst(rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&rst->lock, flags);
+	writel(BIT(id), rst->regs_rst);
+	spin_unlock_irqrestore(&rst->lock, flags);
+
+	return 0;
+}
+
+static const struct reset_control_ops axs10x_reset_ops = {
+	.reset	= axs10x_reset_reset,
+};
+
+static int axs10x_reset_probe(struct platform_device *pdev)
+{
+	struct axs10x_rst *rst;
+	struct resource *mem;
+
+	rst = devm_kzalloc(&pdev->dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rst->regs_rst = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(rst->regs_rst))
+		return PTR_ERR(rst->regs_rst);
+
+	spin_lock_init(&rst->lock);
+
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.ops = &axs10x_reset_ops;
+	rst->rcdev.of_node = pdev->dev.of_node;
+	rst->rcdev.nr_resets = AXS10X_MAX_RESETS;
+
+	return devm_reset_controller_register(&pdev->dev, &rst->rcdev);
+}
+
+static const struct of_device_id axs10x_reset_dt_match[] = {
+	{ .compatible = "snps,axs10x-reset" },
+	{ },
+};
+
+static struct platform_driver axs10x_reset_driver = {
+	.probe	= axs10x_reset_probe,
+	.driver	= {
+		.name = "axs10x-reset",
+		.of_match_table = axs10x_reset_dt_match,
+	},
+};
+builtin_platform_driver(axs10x_reset_driver);
+
+MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
+MODULE_DESCRIPTION("Synopsys AXS10x reset driver");
+MODULE_LICENSE("GPL v2");
-- 
2.9.3
