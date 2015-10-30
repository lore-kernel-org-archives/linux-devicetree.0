From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 2/3] clk: bcm: Add BCM63138 clock support
Date: Thu, 29 Oct 2015 18:23:18 -0700
Message-ID: <1446168199-5959-3-git-send-email-f.fainelli@gmail.com>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

BCM63138 has a simple clocking domain which is primarily the ARMPLL
clocking complex, from which the ARM (CPU), APB and AXI clocks would be
derived from.

Since the ARMPLL controller is entirely compatible with the iProc ARM
PLL, we just initialize it without additional parameters.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v4

Changes in v3:

- made default depend on ARCH_BCM_63XX per Stephen Boyd's comment

Changes in v2:
- added COMPILE_TEST per Scott Branden's comment

 drivers/clk/bcm/Kconfig       | 10 ++++++++++
 drivers/clk/bcm/Makefile      |  1 +
 drivers/clk/bcm/clk-bcm63xx.c | 22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-bcm63xx.c

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 85260fb96b36..f2878459199a 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -1,3 +1,13 @@
+config CLK_BCM_63XX
+	bool "Broadcom BCM63xx clock support"
+	depends on ARCH_BCM_63XX || COMPILE_TEST
+	depends on COMMON_CLK
+	select COMMON_CLK_IPROC
+	default ARCH_BCM_63XX
+	help
+	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
+	  based on the ARM architecture
+
 config CLK_BCM_KONA
 	bool "Broadcom Kona CCU clock support"
 	depends on ARCH_BCM_MOBILE || COMPILE_TEST
diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
index 3fc95060d875..247c26750d8b 100644
--- a/drivers/clk/bcm/Makefile
+++ b/drivers/clk/bcm/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_CLK_BCM_63XX)	+= clk-bcm63xx.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona-setup.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-bcm281xx.o
diff --git a/drivers/clk/bcm/clk-bcm63xx.c b/drivers/clk/bcm/clk-bcm63xx.c
new file mode 100644
index 000000000000..fbc17ae5ff2b
--- /dev/null
+++ b/drivers/clk/bcm/clk-bcm63xx.c
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2015 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/init.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include "clk-iproc.h"
+
+static void __init bcm63138_armpll_init(struct device_node *node)
+{
+	iproc_armpll_setup(node);
+}
+CLK_OF_DECLARE(bcm63138_armpll, "brcm,bcm63138-armpll", bcm63138_armpll_init);
-- 
2.1.0

