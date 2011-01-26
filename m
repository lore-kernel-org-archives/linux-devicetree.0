From: thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH] ARM: DT: Add SMDKV310 machine with device tree support.
Date: Wed, 26 Jan 2011 13:06:44 +0530
Message-ID: <1296027404-16606-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds a new SMDKV310 machine that boots with a minimal
device tree support. The bootargs and memory information is obtained
from the device tree during boot.

This patch is based on git://git.secretlab.ca/git/linux-2.6 devicetree/arm

Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-s5pv310/Kconfig            |    8 +++
 arch/arm/mach-s5pv310/Makefile           |    1 +
 arch/arm/mach-s5pv310/mach-smdkv310-dt.c |  101 ++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/mach-smdkv310-dt.c

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index 09c4c21..c0ef0f8 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -127,6 +127,14 @@ config MACH_SMDKV310
 	help
 	  Machine support for Samsung SMDKV310
 
+config MACH_SMDKV310_DT
+	bool "SMDKV310 with device tree support"
+	select CPU_S5PV310
+	select USE_OF
+	select S3C_DEV_WDT
+	help
+	  Machine support for Samsung SMDKV310 with device tree based initialization.
+
 endmenu
 
 comment "Configuration for HSMMC bus width"
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index 036fb38..59545aa 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
 
 obj-$(CONFIG_MACH_SMDKC210)	+= mach-smdkc210.o
 obj-$(CONFIG_MACH_SMDKV310)	+= mach-smdkv310.o
+obj-$(CONFIG_MACH_SMDKV310_DT)	+= mach-smdkv310-dt.o
 obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 
 # device support
diff --git a/arch/arm/mach-s5pv310/mach-smdkv310-dt.c b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
new file mode 100644
index 0000000..5c0fa83
--- /dev/null
+++ b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
@@ -0,0 +1,101 @@
+/* linux/arch/arm/mach-s5pv310/mach-smdkv310.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
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
+/* Following are default values for UCON, ULCON and UFCON UART registers */
+#define SMDKV310_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
+				 S3C2410_UCON_RXILEVEL |	\
+				 S3C2410_UCON_TXIRQMODE |	\
+				 S3C2410_UCON_RXIRQMODE |	\
+				 S3C2410_UCON_RXFIFO_TOI |	\
+				 S3C2443_UCON_RXERR_IRQEN)
+
+#define SMDKV310_ULCON_DEFAULT	S3C2410_LCON_CS8
+
+#define SMDKV310_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
+				 S5PV210_UFCON_TXTRIG4 |	\
+				 S5PV210_UFCON_RXTRIG4)
+
+static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
+	[0] = {
+		.hwport		= 0,
+		.flags		= 0,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ulcon		= SMDKV310_ULCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[1] = {
+		.hwport		= 1,
+		.flags		= 0,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ulcon		= SMDKV310_ULCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[2] = {
+		.hwport		= 2,
+		.flags		= 0,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ulcon		= SMDKV310_ULCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+	[3] = {
+		.hwport		= 3,
+		.flags		= 0,
+		.ucon		= SMDKV310_UCON_DEFAULT,
+		.ulcon		= SMDKV310_ULCON_DEFAULT,
+		.ufcon		= SMDKV310_UFCON_DEFAULT,
+	},
+};
+
+static struct platform_device *smdkv310_devices[] __initdata = {
+	&s3c_device_wdt,
+};
+
+static void __init smdkv310_map_io(void)
+{
+	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
+	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
+}
+
+static void __init smdkv310_machine_init(void)
+{
+	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
+}
+
+static const char *smdkv310_dt_compat[] = {
+	"samsung,smdkv310",
+	NULL
+};
+
+MACHINE_START(SMDKV310, "SMDKV310")
+	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
+	/* Maintainer: Changhwan Youn <chaos.youn-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
+	.boot_params	= S5P_PA_SDRAM + 0x100,
+	.init_irq	= s5pv310_init_irq,
+	.map_io		= smdkv310_map_io,
+	.init_machine	= smdkv310_machine_init,
+	.timer		= &s5pv310_timer,
+	.dt_compat	= smdkv310_dt_compat,
+MACHINE_END
-- 
1.6.6.rc2
