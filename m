From: <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 1/7] ARM: imx: add i.mx6ul msl support
Date: Fri, 10 Jul 2015 01:16:38 +0800
Message-ID: <1436462204-32654-2-git-send-email-Frank.Li@freescale.com>
References: <1436462204-32654-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436462204-32654-1-git-send-email-Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

i.MX6UL is a new SOC, add MSL support

Signed-off-by: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/Kconfig       |  8 ++++++++
 arch/arm/mach-imx/Makefile      |  1 +
 arch/arm/mach-imx/cpu.c         |  3 +++
 arch/arm/mach-imx/mach-imx6ul.c | 43 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-imx/mxc.h         |  6 ++++++
 5 files changed, 61 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imx6ul.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 573536f..8ceda28 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -548,6 +548,14 @@ config SOC_IMX6SX
 	help
 	  This enables support for Freescale i.MX6 SoloX processor.
 
+config SOC_IMX6UL
+	bool "i.MX6 UltraLite support"
+	select PINCTRL_IMX6UL
+	select SOC_IMX6
+
+	help
+	  This enables support for Freescale i.MX6 UltraLite processor.
+
 config SOC_IMX7D
 	bool "i.MX7 Dual support"
 	select PINCTRL_IMX7D
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index 37c502a..fb689d8 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -83,6 +83,7 @@ endif
 obj-$(CONFIG_SOC_IMX6Q) += mach-imx6q.o
 obj-$(CONFIG_SOC_IMX6SL) += mach-imx6sl.o
 obj-$(CONFIG_SOC_IMX6SX) += mach-imx6sx.o
+obj-$(CONFIG_SOC_IMX6UL) += mach-imx6ul.o
 obj-$(CONFIG_SOC_IMX7D) += mach-imx7d.o
 
 ifeq ($(CONFIG_SUSPEND),y)
diff --git a/arch/arm/mach-imx/cpu.c b/arch/arm/mach-imx/cpu.c
index a7fa92a..5b0f752 100644
--- a/arch/arm/mach-imx/cpu.c
+++ b/arch/arm/mach-imx/cpu.c
@@ -130,6 +130,9 @@ struct device * __init imx_soc_device_init(void)
 	case MXC_CPU_IMX6Q:
 		soc_id = "i.MX6Q";
 		break;
+	case MXC_CPU_IMX6UL:
+		soc_id = "i.MX6UL";
+		break;
 	case MXC_CPU_IMX7D:
 		soc_id = "i.MX7D";
 		break;
diff --git a/arch/arm/mach-imx/mach-imx6ul.c b/arch/arm/mach-imx/mach-imx6ul.c
new file mode 100644
index 0000000..706d5f6
--- /dev/null
+++ b/arch/arm/mach-imx/mach-imx6ul.c
@@ -0,0 +1,43 @@
+/*
+ * Copyright (C) 2015 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/irqchip.h>
+#include <linux/of_platform.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include "common.h"
+
+static void __init imx6ul_init_machine(void)
+{
+	struct device *parent;
+
+	parent = imx_soc_device_init();
+	if (parent == NULL)
+		pr_warn("failed to initialize soc device\n");
+
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	imx_anatop_init();
+}
+
+static void __init imx6ul_init_irq(void)
+{
+	imx_init_revision_from_anatop();
+	imx_src_init();
+	irqchip_init();
+}
+
+static const char *imx6ul_dt_compat[] __initconst = {
+	"fsl,imx6ul",
+	NULL,
+};
+
+DT_MACHINE_START(IMX7D, "Freescale i.MX6 Ultralite (Device Tree)")
+	.init_irq	= imx6ul_init_irq,
+	.init_machine	= imx6ul_init_machine,
+	.dt_compat	= imx6ul_dt_compat,
+MACHINE_END
diff --git a/arch/arm/mach-imx/mxc.h b/arch/arm/mach-imx/mxc.h
index c4436d4..a5b1af6 100644
--- a/arch/arm/mach-imx/mxc.h
+++ b/arch/arm/mach-imx/mxc.h
@@ -38,6 +38,7 @@
 #define MXC_CPU_IMX6DL		0x61
 #define MXC_CPU_IMX6SX		0x62
 #define MXC_CPU_IMX6Q		0x63
+#define MXC_CPU_IMX6UL		0x64
 #define MXC_CPU_IMX7D		0x72
 
 #define IMX_DDR_TYPE_LPDDR2		1
@@ -165,6 +166,11 @@ static inline bool cpu_is_imx6sx(void)
 	return __mxc_cpu_type == MXC_CPU_IMX6SX;
 }
 
+static inline bool cpu_is_imx6ul(void)
+{
+	return __mxc_cpu_type == MXC_CPU_IMX6UL;
+}
+
 static inline bool cpu_is_imx6q(void)
 {
 	return __mxc_cpu_type == MXC_CPU_IMX6Q;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
