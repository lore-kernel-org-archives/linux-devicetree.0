Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car E3 power areas
Date: Wed, 11 Apr 2018 18:36:25 +0900
Message-Id: <1523439386-1032-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.

NOTE:
- The 3DG power domain resume order of R-Car E3 is [3DG-B] -> [3DG-A],
  which is different from R-Car H3, M3 and M3N SoCs.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[shimoda: add SPDX-License-Identifier]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 ++++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77990-sysc.c                | 33 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 ++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 6 files changed, 44 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a77990-sysc.c

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index 3e91d20..180ae65 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -21,6 +21,7 @@ Required properties:
       - "renesas,r8a77965-sysc" (R-Car M3-N)
       - "renesas,r8a77970-sysc" (R-Car V3M)
       - "renesas,r8a77980-sysc" (R-Car V3H)
+      - "renesas,r8a77990-sysc" (R-Car E3)
       - "renesas,r8a77995-sysc" (R-Car D3)
   - reg: Address start and address range for the device.
   - #power-domain-cells: Must be 1.
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 96dd936..36bec60 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -18,6 +18,7 @@ config SOC_RENESAS
 	select SYSC_R8A77965 if ARCH_R8A77965
 	select SYSC_R8A77970 if ARCH_R8A77970
 	select SYSC_R8A77980 if ARCH_R8A77980
+	select SYSC_R8A77990 if ARCH_R8A77990
 	select SYSC_R8A77995 if ARCH_R8A77995
 
 if SOC_RENESAS
@@ -75,6 +76,10 @@ config SYSC_R8A77980
 	bool "R-Car V3H System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77990
+	bool "R-Car E3 System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A77995
 	bool "R-Car D3 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index a86ece7..7dc0f20 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
 obj-$(CONFIG_SYSC_R8A77965)	+= r8a77965-sysc.o
 obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
+obj-$(CONFIG_SYSC_R8A77990)	+= r8a77990-sysc.o
 obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 
 # Family
diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
new file mode 100644
index 0000000..bd4114b
--- /dev/null
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas R-Car E3 System Controller
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a77990-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a77990_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A77990_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca53-scu",	0x140, 0, R8A77990_PD_CA53_SCU,  R8A77990_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca53-cpu0",	0x200, 0, R8A77990_PD_CA53_CPU0, R8A77990_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu1",	0x200, 1, R8A77990_PD_CA53_CPU1, R8A77990_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "cr7",	0x240, 0, R8A77990_PD_CR7,	R8A77990_PD_ALWAYS_ON },
+	{ "a3vc",	0x380, 0, R8A77990_PD_A3VC,	R8A77990_PD_ALWAYS_ON },
+	{ "a2vc1",	0x3c0, 1, R8A77990_PD_A2VC1,	R8A77990_PD_A3VC },
+	{ "3dg-b",	0x100, 1, R8A77990_PD_3DG_B,	R8A77990_PD_ALWAYS_ON },
+	{ "3dg-a",	0x100, 0, R8A77990_PD_3DG_A,	R8A77990_PD_3DG_B },
+};
+
+const struct rcar_sysc_info r8a77990_sysc_info __initconst = {
+	.areas = r8a77990_areas,
+	.num_areas = ARRAY_SIZE(r8a77990_areas),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 99203bd..95120ac 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -296,6 +296,9 @@ static void __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 #ifdef CONFIG_SYSC_R8A77980
 	{ .compatible = "renesas,r8a77980-sysc", .data = &r8a77980_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A77990
+	{ .compatible = "renesas,r8a77990-sysc", .data = &r8a77990_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A77995
 	{ .compatible = "renesas,r8a77995-sysc", .data = &r8a77995_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 9b24e3a..a22e7cf 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -62,6 +62,7 @@ struct rcar_sysc_info {
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77980_sysc_info;
+extern const struct rcar_sysc_info r8a77990_sysc_info;
 extern const struct rcar_sysc_info r8a77995_sysc_info;
 
 
-- 
1.9.1
