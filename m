From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v14 04/13] mfd: Add Ingenic TCU driver
Date: Mon,  1 Jul 2019 17:14:01 +0200
Message-ID: <20190701151410.23127-5-paul@crapouillou.net>
References: <20190701151410.23127-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701151410.23127-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

This driver will provide a regmap that can be retrieved very early in
the boot process through the API function ingenic_tcu_get_regmap().

Additionally, it will call devm_of_platform_populate() so that all the
children devices will be probed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Reviewed-by: Paul Burton <paul.burton@mips.com>
---

Notes:
    v12: New patch
    
    v13: No change
    
    v14:
     - Use ERR_CAST() instead of ERR_PTR(PTR_ERR())
     - Remove ingenic_tcu_can_use_pwm(); it belongs in the PWM driver.

 drivers/mfd/Kconfig             |  8 +++
 drivers/mfd/Makefile            |  1 +
 drivers/mfd/ingenic-tcu.c       | 87 +++++++++++++++++++++++++++++++++
 include/linux/mfd/ingenic-tcu.h |  6 +++
 4 files changed, 102 insertions(+)
 create mode 100644 drivers/mfd/ingenic-tcu.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a17d275bf1d4..f3ed22613cbc 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -495,6 +495,14 @@ config HTC_I2CPLD
 	  This device provides input and output GPIOs through an I2C
 	  interface to one or more sub-chips.
 
+config INGENIC_TCU
+	bool "Ingenic Timer/Counter Unit (TCU) support"
+	depends on MIPS || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the Timer/Counter Unit (TCU) IP present
+	  in the JZ47xx SoCs from Ingenic.
+
 config MFD_INTEL_QUARK_I2C_GPIO
 	tristate "Intel Quark MFD I2C GPIO"
 	depends on PCI
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 52b1a90ff515..fb89e131ae98 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
 obj-$(CONFIG_MFD_TIMBERDALE)    += timberdale.o
 obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
+obj-$(CONFIG_INGENIC_TCU)	+= ingenic-tcu.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
diff --git a/drivers/mfd/ingenic-tcu.c b/drivers/mfd/ingenic-tcu.c
new file mode 100644
index 000000000000..2d12bebd5430
--- /dev/null
+++ b/drivers/mfd/ingenic-tcu.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ47xx SoCs TCU MFD driver
+ * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/mfd/ingenic-tcu.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static struct regmap *tcu_regmap __initdata;
+
+static const struct regmap_config ingenic_tcu_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = TCU_REG_OST_CNTHBUF,
+};
+
+static const struct of_device_id ingenic_tcu_of_match[] = {
+	{ .compatible = "ingenic,jz4740-tcu" },
+	{ .compatible = "ingenic,jz4725b-tcu" },
+	{ .compatible = "ingenic,jz4770-tcu" },
+	{ /* sentinel */ }
+};
+
+static struct regmap * __init ingenic_tcu_create_regmap(struct device_node *np)
+{
+	struct resource res;
+	void __iomem *base;
+	struct regmap *map;
+
+	if (!of_match_node(ingenic_tcu_of_match, np))
+		return ERR_PTR(-EINVAL);
+
+	base = of_io_request_and_map(np, 0, "TCU");
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	map = regmap_init_mmio(NULL, base, &ingenic_tcu_regmap_config);
+	if (IS_ERR(map))
+		goto err_iounmap;
+
+	return map;
+
+err_iounmap:
+	iounmap(base);
+	of_address_to_resource(np, 0, &res);
+	release_mem_region(res.start, resource_size(&res));
+
+	return map;
+}
+
+static int __init ingenic_tcu_probe(struct platform_device *pdev)
+{
+	struct regmap *map = ingenic_tcu_get_regmap(pdev->dev.of_node);
+
+	platform_set_drvdata(pdev, map);
+
+	regmap_attach_dev(&pdev->dev, map, &ingenic_tcu_regmap_config);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static struct platform_driver ingenic_tcu_driver = {
+	.driver = {
+		.name = "ingenic-tcu",
+		.of_match_table = ingenic_tcu_of_match,
+	},
+};
+
+static int __init ingenic_tcu_platform_init(void)
+{
+	return platform_driver_probe(&ingenic_tcu_driver,
+				     ingenic_tcu_probe);
+}
+subsys_initcall(ingenic_tcu_platform_init);
+
+struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np)
+{
+	if (!tcu_regmap)
+		tcu_regmap = ingenic_tcu_create_regmap(np);
+
+	return tcu_regmap;
+}
diff --git a/include/linux/mfd/ingenic-tcu.h b/include/linux/mfd/ingenic-tcu.h
index 2083fa20821d..045fb90c57fd 100644
--- a/include/linux/mfd/ingenic-tcu.h
+++ b/include/linux/mfd/ingenic-tcu.h
@@ -6,6 +6,10 @@
 #define __LINUX_MFD_INGENIC_TCU_H_
 
 #include <linux/bitops.h>
+#include <linux/init.h>
+
+struct device_node;
+struct regmap;
 
 #define TCU_REG_WDT_TDR		0x00
 #define TCU_REG_WDT_TCER	0x04
@@ -53,4 +57,6 @@
 #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) * TCU_CHANNEL_STRIDE))
 #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) * TCU_CHANNEL_STRIDE))
 
+struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np);
+
 #endif /* __LINUX_MFD_INGENIC_TCU_H_ */
-- 
2.21.0.593.g511ec345e18
