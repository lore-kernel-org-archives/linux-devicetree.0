From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/6] ARM: bcm476x: Add stub clock driver
Date: Sun, 07 Oct 2012 03:53:04 +0200
Message-ID: <20121007015407.154476821@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=arm-bcm476x-add-stub-clock-driver.patch
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>

This is the minimal clock support required for the boot, a more complete
implementation will follow (shortly).

Signed-off-by: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-bcm476x/bcm476x.c |    3 ++
 drivers/clk/Makefile            |    1 +
 drivers/clk/clk-bcm476x.c       |   52 ++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/bcm476x.h     |   22 +++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 drivers/clk/clk-bcm476x.c
 create mode 100644 include/linux/clk/bcm476x.h

Index: b/arch/arm/mach-bcm476x/bcm476x.c
===================================================================
--- a/arch/arm/mach-bcm476x/bcm476x.c
+++ b/arch/arm/mach-bcm476x/bcm476x.c
@@ -18,6 +18,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/bcm476x_timer.h>
+#include <linux/clk/bcm476x.h>
 
 #include <asm/hardware/vic.h>
 #include <asm/mach/arch.h>
@@ -43,6 +44,8 @@ void __init bcm476x_init(void)
 {
 	int ret;
 
+	bcm476x_init_clocks();
+
 	ret = of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 	if (ret) {
 		pr_err("of_platform_populate failed: %d\n", ret);
Index: b/drivers/clk/Makefile
===================================================================
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-fi
 				   clk-mux.o clk-divider.o clk-fixed-factor.o
 # SoCs specific
 obj-$(CONFIG_ARCH_BCM2835)	+= clk-bcm2835.o
+obj-$(CONFIG_ARCH_BCM476X)	+= clk-bcm476x.o
 obj-$(CONFIG_ARCH_NOMADIK)	+= clk-nomadik.o
 obj-$(CONFIG_ARCH_HIGHBANK)	+= clk-highbank.o
 obj-$(CONFIG_ARCH_MXS)		+= mxs/
Index: b/drivers/clk/clk-bcm476x.c
===================================================================
--- /dev/null
+++ b/drivers/clk/clk-bcm476x.c
@@ -0,0 +1,52 @@
+/*
+ * Broadcom BCM476x SoCs clocks
+ *
+ * Copyright (C) 2011-2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-private.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/clk/bcm476x.h>
+
+/*
+ * These are fixed clocks (and device tree doesn't support clk!).
+ *
+ * They're probably not all root clocks and it may be possible to
+ * turn them on and off but until this is mapped out better it's
+ * the only way they can be used.
+ */
+DEFINE_CLK_FIXED_RATE(sys_pclk,   CLK_IS_ROOT, 312000000, 0);
+DEFINE_CLK_FIXED_RATE(apb_pclk,   CLK_IS_ROOT, 156000000, 0);
+DEFINE_CLK_FIXED_RATE(uart0_pclk, CLK_IS_ROOT, 78000000, 0);
+DEFINE_CLK_FIXED_RATE(uart1_pclk, CLK_IS_ROOT, 78000000, 0);
+DEFINE_CLK_FIXED_RATE(uart2_pclk, CLK_IS_ROOT, 78000000, 0);
+
+static struct clk_lookup lookups[] = {
+	{ .con_id = "sys_pclk", .clk = &sys_pclk },
+	{ .con_id = "apb_pclk", .clk = &apb_pclk },
+	{ .dev_id = "c0000.uart0", .clk = &uart0_pclk },
+	{ .dev_id = "c1000.uart1", .clk = &uart1_pclk },
+	{ .dev_id = "b2000.uart2", .clk = &uart2_pclk },
+};
+
+void __init bcm476x_init_clocks(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(lookups); i++) {
+		__clk_init(NULL, lookups[i].clk);
+		clkdev_add(&lookups[i]);
+	}
+}
Index: b/include/linux/clk/bcm476x.h
===================================================================
--- /dev/null
+++ b/include/linux/clk/bcm476x.h
@@ -0,0 +1,22 @@
+/*
+ * Broadcom BCM476x SoCs clocks
+ *
+ * Copyright (C) 2011-2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __LINUX_CLK_BCM476X_H_
+#define __LINUX_CLK_BCM476X_H_
+
+void __init bcm476x_init_clocks(void);
+
+#endif
