From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv4 5/6] ARM: imx: Add initial support for Freescale LS1021A
Date: Mon, 22 Sep 2014 15:45:51 +0800
Message-ID: <1411371952-5618-6-git-send-email-jingchang.lu@freescale.com>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411371952-5618-1-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

The LS1021A SoC is a dual-core Cortex-A7 based processor,
this add the initial support for it.

Signed-off-by: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/Kconfig        | 14 ++++++++++++++
 arch/arm/mach-imx/Makefile       |  2 ++
 arch/arm/mach-imx/mach-ls1021a.c | 21 +++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-ls1021a.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 11b2957..2cc64a3 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -639,6 +639,20 @@ config SOC_VF610
 	help
 	  This enable support for Freescale Vybrid VF610 processor.
 
+config SOC_LS1021A
+	bool "Freescale LS1021A support"
+	select CPU_V7
+	select ARM_GIC
+	select CLKSRC_OF
+	select HAVE_ARM_ARCH_TIMER
+	select HAVE_SMP
+	select MIGHT_HAVE_PCI
+	select PCI_DOMAINS if PCI
+	select ZONE_DMA if ARM_LPAE
+
+	help
+	  This enable support for Freescale LS1021A processor.
+
 endif
 
 source "arch/arm/mach-imx/devices/Kconfig"
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index 6e4fcd8..ce137bc 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -110,4 +110,6 @@ obj-$(CONFIG_SOC_IMX53) += mach-imx53.o
 
 obj-$(CONFIG_SOC_VF610) += clk-vf610.o mach-vf610.o
 
+obj-$(CONFIG_SOC_LS1021A) += mach-ls1021a.o
+
 obj-y += devices/
diff --git a/arch/arm/mach-imx/mach-ls1021a.c b/arch/arm/mach-imx/mach-ls1021a.c
new file mode 100644
index 0000000..9d2034b
--- /dev/null
+++ b/arch/arm/mach-imx/mach-ls1021a.c
@@ -0,0 +1,21 @@
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/mach/arch.h>
+
+#include "common.h"
+
+static const char * const ls1021a_dt_compat[] __initconst = {
+	"fsl,ls1021a",
+	NULL,
+};
+
+DT_MACHINE_START(LS1021A, "Freescale LS1021A")
+	.dt_compat	= ls1021a_dt_compat,
+MACHINE_END
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
