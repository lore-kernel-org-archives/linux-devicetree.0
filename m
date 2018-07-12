Return-Path: <SRS0=LrHL=J4=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] ARM: shmobile: Add basic RZ/A2 SoC support
Date: Wed, 11 Jul 2018 22:01:48 -0500
Message-Id: <20180712030149.91385-2-chris.brandt@renesas.com>
In-Reply-To: <20180712030149.91385-1-chris.brandt@renesas.com>
References: <20180712030149.91385-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add the RZ/A2 SoC to the Renesas SoC collection.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/mach-shmobile/Kconfig         |  6 ++++++
 arch/arm/mach-shmobile/Makefile        |  1 +
 arch/arm/mach-shmobile/setup-r7s9210.c | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm/mach-shmobile/setup-r7s9210.c

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 0b67254eabb2..9338eb0d574f 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -54,6 +54,12 @@ config ARCH_R7S72100
 	select SYS_SUPPORTS_SH_MTU2
 	select RENESAS_OSTM
 
+config ARCH_R7S9210
+	bool "RZ/A2 (R7S9210)"
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_OSTM
+
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
 	select ARCH_RMOBILE
diff --git a/arch/arm/mach-shmobile/Makefile b/arch/arm/mach-shmobile/Makefile
index b33dc59d8698..5591646cb9bb 100644
--- a/arch/arm/mach-shmobile/Makefile
+++ b/arch/arm/mach-shmobile/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_R8A7778)	+= setup-r8a7778.o
 obj-$(CONFIG_ARCH_R8A7779)	+= setup-r8a7779.o
 obj-$(CONFIG_ARCH_EMEV2)	+= setup-emev2.o
 obj-$(CONFIG_ARCH_R7S72100)	+= setup-r7s72100.o
+obj-$(CONFIG_ARCH_R7S9210)	+= setup-r7s9210.o
 
 # CPU reset vector handling objects
 cpu-y				:= platsmp.o headsmp.o
diff --git a/arch/arm/mach-shmobile/setup-r7s9210.c b/arch/arm/mach-shmobile/setup-r7s9210.c
new file mode 100644
index 000000000000..573fb9955e7e
--- /dev/null
+++ b/arch/arm/mach-shmobile/setup-r7s9210.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * r7s9210 processor support
+ *
+ * Copyright (C) 2018  Renesas Electronics Corporation
+ * Copyright (C) 2018  Chris Brandt
+ *
+ */
+
+#include <linux/kernel.h>
+
+#include <asm/mach/arch.h>
+
+#include "common.h"
+
+static const char *const r7s9210_boards_compat_dt[] __initconst = {
+	"renesas,r7s9210",
+	NULL,
+};
+
+DT_MACHINE_START(R7S72100_DT, "Generic R7S9210 (Flattened Device Tree)")
+	.l2c_aux_val    = 0,
+	.l2c_aux_mask   = ~0,
+	.init_early	= shmobile_init_delay,
+	.init_late	= shmobile_init_late,
+	.dt_compat	= r7s9210_boards_compat_dt,
+MACHINE_END
-- 
2.16.1
