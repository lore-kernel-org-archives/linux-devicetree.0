From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] reset: Add reset controller support for BM1880 SoC
Date: Thu, 25 Apr 2019 18:25:08 +0530
Message-ID: <20190425125508.5965-4-manivannan.sadhasivam@linaro.org>
References: <20190425125508.5965-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425125508.5965-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add reset controller support for Bitmain BM1880 SoC reusing the
reset-simple driver. While we are at it, this driver has also been
modified to make use of the SPDX license identifier.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/reset/Kconfig        |  3 ++-
 drivers/reset/Makefile       |  1 +
 drivers/reset/reset-simple.c | 16 +++++++++++-----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2c8c23db92fb..b25e8d139f0d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -117,7 +117,7 @@ config RESET_QCOM_PDC
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED
+	default ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED || ARCH_BITMAIN
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
@@ -129,6 +129,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - ZTE's zx2967 family
+	   - Bitmain BM1880 SoC
 
 config RESET_STM32MP157
 	bool "STM32MP157 Reset Driver" if COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 61456b8f659c..b87968771166 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
+#obj-$(CONFIG_RESET_BM1880) += reset-bm1880.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 77fbba3100c8..fd1fa4984d76 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Simple Reset Controller Driver
  *
@@ -8,11 +9,6 @@
  * Copyright 2013 Maxime Ripard
  *
  * Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #include <linux/device.h>
@@ -119,6 +115,14 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+#define BM1880_NR_BANKS		2
+
+static const struct reset_simple_devdata reset_simple_bm1880 = {
+	.nr_resets = BM1880_NR_BANKS * 32,
+	.active_low = true,
+	.status_active_low = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
@@ -129,6 +133,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "aspeed,ast2400-lpc-reset" },
 	{ .compatible = "aspeed,ast2500-lpc-reset" },
+	{ .compatible = "bitmain,bm1880-reset",
+		.data = &reset_simple_bm1880 },
 	{ /* sentinel */ },
 };
 
-- 
2.17.1
