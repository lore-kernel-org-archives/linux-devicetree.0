From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/7] ARM: s5pv310-dt: Add s5pv310 machine with device tree
	support
Date: Sat, 12 Feb 2011 18:16:59 +0530
Message-ID: <1297514825-10345-2-git-send-email-thomas.abraham@linaro.org>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1297514825-10345-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a new Samsung's s5pv310 machine that boots with a minimal
device tree support. The bootargs, memory information, console port
register defaults and external crystal frequency are obtained from the
device tree during boot.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-s5pv310/Kconfig           |    7 +++
 arch/arm/mach-s5pv310/Makefile          |    1 +
 arch/arm/mach-s5pv310/mach-s5pv310-dt.c |   73 +++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/mach-s5pv310-dt.c

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index 09c4c21..f0c1afd 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -127,6 +127,13 @@ config MACH_SMDKV310
 	help
 	  Machine support for Samsung SMDKV310
 
+config MACH_S5PV310_DT
+	bool "S5PV310 with device tree support"
+	select CPU_S5PV310
+	select USE_OF
+	help
+	  Machine support for Samsung's S5PV310 SoC with device tree based initialization.
+
 endmenu
 
 comment "Configuration for HSMMC bus width"
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index 036fb38..7fa7842 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
 
 obj-$(CONFIG_MACH_SMDKC210)	+= mach-smdkc210.o
 obj-$(CONFIG_MACH_SMDKV310)	+= mach-smdkv310.o
+obj-$(CONFIG_MACH_S5PV310_DT)	+= mach-s5pv310-dt.o
 obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 
 # device support
diff --git a/arch/arm/mach-s5pv310/mach-s5pv310-dt.c b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
new file mode 100644
index 0000000..a5e33ff
--- /dev/null
+++ b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
@@ -0,0 +1,73 @@
+/*
+ * Samsung's S5PV310 machine with device tree enabled.
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/serial_core.h>
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach-types.h>
+
+#include <plat/regs-serial.h>
+#include <plat/s5pv310.h>
+#include <plat/cpu.h>
+#include <plat/devs.h>
+
+#include <mach/map.h>
+
+/*
+ * Platfrom data for uart devices. Some elements of the platform data will
+ * be set by the s5pv310 platform code and the rest will be obtained from the
+ * device tree. TODO: remove this when driver is able to obtain all the
+ * platform data information from the device tree.
+ */
+static struct s3c2410_uartcfg uartcfgs[CONFIG_SERIAL_SAMSUNG_UARTS] __initdata;
+
+static void __init s5pv310_dt_map_io(void)
+{
+	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+}
+
+static void s5pv310_dt_init_early(void)
+{
+	int i;
+	unsigned int *xtal_freq;
+
+	xtal_freq = (u32 *)of_get_property(of_chosen, "xtal-frequency", NULL);
+	if (!xtal_freq) {
+		printk(KERN_ERR "Ext crystal clock frequency not specified\n");
+		panic("Unknown external crystal clock frequency");
+	}
+
+	s3c24xx_init_clocks(be32_to_cpu(*xtal_freq));
+
+	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++) {
+		uartcfgs[i].hwport = i;
+		uartcfgs[i].flags = 0;
+	}
+	s3c24xx_init_uarts(uartcfgs, ARRAY_SIZE(uartcfgs));
+}
+
+static char const *s5pv310_dt_compat[] = {
+	"samsung,s5pv310",
+	NULL
+};
+
+MACHINE_START(S5PV310_DT, "Samsung's S5PV310 with flattened device tree")
+	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
+	/* Maintainer: Changhwan Youn <chaos.youn-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
+	.init_irq	= s5pv310_init_irq,
+	.map_io		= s5pv310_dt_map_io,
+	.timer		= &s5pv310_timer,
+	.dt_compat	= s5pv310_dt_compat,
+	.init_early	= s5pv310_dt_init_early,
+MACHINE_END
-- 
1.6.6.rc2
