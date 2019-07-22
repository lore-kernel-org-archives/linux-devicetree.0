From: Evgeny Kolesnikov <evgenyz@gmail.com>
Subject: [PATCH 3/5] power/reset: Add a power off driver for UART-based PM MCUs
Date: Mon, 22 Jul 2019 21:53:03 +0200
Message-ID: <efdea0d2c7c5ed65e79fb3604130a4488ec8057c.1563822216.git.evgenyz@gmail.com>
References: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Evgeny Kolesnikov <evgenyz@gmail.com>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the poweroff driver for power managing
micro controller units that are connected to a board
via the UART interface.

Signed-off-by: Evgeny Kolesnikov <evgenyz@gmail.com>
---
 drivers/power/reset/Kconfig         |   7 ++
 drivers/power/reset/Makefile        |   1 +
 drivers/power/reset/uart-poweroff.c | 155 ++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 drivers/power/reset/uart-poweroff.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index a564237278ff..02fdf45e3988 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -216,6 +216,13 @@ config POWER_RESET_RMOBILE
 	help
 	  Reboot support for Renesas R-Mobile and SH-Mobile SoCs.
 
+config POWER_RESET_UART_POWEROFF
+	tristate "UART-based PM MCU power off driver"
+	depends on OF_GPIO
+	help
+	  Power off support for boards with UART-based PM MCU
+	  such as WD My Cloud NAS, QNAP Turbo NAS, Synology devices.
+
 config POWER_RESET_ZX
 	tristate "ZTE SoCs reset driver"
 	depends on ARCH_ZX || COMPILE_TEST
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 85da3198e4e0..efe8f25f463d 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_POWER_RESET_KEYSTONE) += keystone-reset.o
 obj-$(CONFIG_POWER_RESET_SYSCON) += syscon-reboot.o
 obj-$(CONFIG_POWER_RESET_SYSCON_POWEROFF) += syscon-poweroff.o
 obj-$(CONFIG_POWER_RESET_RMOBILE) += rmobile-reset.o
+obj-$(CONFIG_POWER_RESET_UART_POWEROFF) += uart-poweroff.o
 obj-$(CONFIG_POWER_RESET_ZX) += zx-reboot.o
 obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
diff --git a/drivers/power/reset/uart-poweroff.c b/drivers/power/reset/uart-poweroff.c
new file mode 100644
index 000000000000..8122a6b306d7
--- /dev/null
+++ b/drivers/power/reset/uart-poweroff.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Power off for boards with UART-based PM MCUs
+ * such as WD My Cloud NAS, QNAP Turbo NAS, Synology devices.
+ *
+ * Copyright (C) 2019 Evgeny Kolesnikov <evgenyz@gmail.com>
+ *
+ * Based on the code from:
+ *
+ * Copyright (C) 2016 Martin Mueller <mm@sig21.net>
+ * Copyright (C) 2012 Andrew Lunn <andrew@lunn.ch>
+ * Copyright (C) 2009 Martin Michlmayr <tbm@cyrius.com>
+ * Copyright (C) 2008 Byron Bradley <byron.bbradley@gmail.com>
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/serial_reg.h>
+#include <linux/kallsyms.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+
+#define UART_REG(b, x)	(b + ((UART_##x) << 2))
+
+struct uart_poweroff {
+	const u8 *cmd;
+	int cmd_len;
+	void __iomem *base;
+	unsigned int divisor;
+	u32 byte_delay_ms;
+	u32 timeout_ms;
+};
+
+static void *pm_power_off_org;
+static struct uart_poweroff uart_poweroff;
+
+static void uart_power_off(void)
+{
+	int i;
+
+	/* Hijack UART and reset into sane state */
+	writel(0x83, UART_REG(uart_poweroff.base, LCR));
+	writel(uart_poweroff.divisor & 0xFF, UART_REG(uart_poweroff.base, DLL));
+	writel((uart_poweroff.divisor >> 8) & 0xFF, UART_REG(uart_poweroff.base, DLM));
+	writel(0x03, UART_REG(uart_poweroff.base, LCR));
+	writel(0x00, UART_REG(uart_poweroff.base, IER));
+	writel(0x00, UART_REG(uart_poweroff.base, FCR));
+	writel(0x00, UART_REG(uart_poweroff.base, MCR));
+
+	/* Send the command */
+	for (i = 0; i < uart_poweroff.cmd_len; i++) {
+		writel(uart_poweroff.cmd[i], UART_REG(uart_poweroff.base, TX));
+		mdelay(uart_poweroff.byte_delay_ms);
+	}
+
+	mdelay(uart_poweroff.timeout_ms);
+	WARN_ON(1);
+}
+
+static int uart_poweroff_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	static void __iomem *base;
+	struct clk *clk;
+	u32 baud;
+	bool override;
+	char symname[KSYM_NAME_LEN];
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Missing resource\n");
+		return -EINVAL;
+	}
+
+	base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!base) {
+		dev_err(&pdev->dev, "Unable to map resource\n");
+		return -EINVAL;
+	}
+
+	/* We need to know tclk in order to calculate the UART divisor */
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(&pdev->dev, "Clk missing\n");
+		return PTR_ERR(clk);
+	}
+
+	uart_poweroff.cmd = of_get_property(pdev->dev.of_node, "cmd",
+						&uart_poweroff.cmd_len);
+	if (uart_poweroff.cmd == NULL || uart_poweroff.cmd_len < 1) {
+		dev_err(&pdev->dev, "Cmd is missing or empty\n");
+		return -EINVAL;
+	}
+
+	of_property_read_u32(pdev->dev.of_node, "baud", &baud);
+	if (baud < 75 || baud > 460800) {
+		dev_err(&pdev->dev, "Baud rate is missing or invalid\n");
+		return -EINVAL;
+	}
+
+	uart_poweroff.base = base;
+	uart_poweroff.divisor =
+		((clk_get_rate(clk) + (8 * baud)) / (16 * baud));
+	uart_poweroff.byte_delay_ms = 5;
+	uart_poweroff.timeout_ms = 1000;
+	of_property_read_u32(pdev->dev.of_node, "byte-delay",
+				&uart_poweroff.byte_delay_ms);
+	of_property_read_u32(pdev->dev.of_node, "timeout",
+				&uart_poweroff.timeout_ms);
+
+	override = of_property_read_bool(pdev->dev.of_node, "override");
+
+	if (pm_power_off && !override) {
+		lookup_symbol_name((ulong)pm_power_off, symname);
+		dev_err(&pdev->dev,
+			"The pm_power_off is already claimed by %s (%p) and override is false",
+			symname, pm_power_off);
+		return -EBUSY;
+	}
+	pm_power_off_org = pm_power_off;
+	pm_power_off = uart_power_off;
+
+	return 0;
+}
+
+static int uart_poweroff_remove(struct platform_device *pdev)
+{
+	if (pm_power_off == uart_power_off)
+		pm_power_off = pm_power_off_org;
+
+	return 0;
+}
+
+static const struct of_device_id of_uart_poweroff_match[] = {
+	{ .compatible = "uart-poweroff", },
+	{},
+};
+
+static struct platform_driver uart_poweroff_driver = {
+	.probe	= uart_poweroff_probe,
+	.remove	= uart_poweroff_remove,
+	.driver	= {
+		.name	= "uart_poweroff",
+		.of_match_table = of_uart_poweroff_match,
+	},
+};
+module_platform_driver(uart_poweroff_driver);
+
+MODULE_AUTHOR("Evgeny Kolesnikov <evgenyz@gmail.com>");
+MODULE_DESCRIPTION("UART-based PM MCU power off driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0
