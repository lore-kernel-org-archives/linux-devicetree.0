Return-Path: <SRS0=L7Ep=GS=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/8] soc: renesas: rcar-sysc: Add r8a77470 support
Date: Wed, 28 Mar 2018 20:26:09 +0100
Message-Id: <1522265176-33226-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for RZ/G1C (R8A77470) SoC power areas to the R-Car SYSC
driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1->V2:
* incorporated geert's review comment

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 ++++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77470-sysc.c                | 29 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 +++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 include/dt-bindings/power/r8a77470-sysc.h          | 22 ++++++++++++++++
 7 files changed, 62 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a77470-sysc.c
 create mode 100644 include/dt-bindings/power/r8a77470-sysc.h

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index ab399e5..3e91d20 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -9,6 +9,7 @@ Required properties:
   - compatible: Must contain exactly one of the following:
       - "renesas,r8a7743-sysc" (RZ/G1M)
       - "renesas,r8a7745-sysc" (RZ/G1E)
+      - "renesas,r8a77470-sysc" (RZ/G1C)
       - "renesas,r8a7779-sysc" (R-Car H1)
       - "renesas,r8a7790-sysc" (R-Car H2)
       - "renesas,r8a7791-sysc" (R-Car M2-W)
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3bbe611..96dd936 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -7,6 +7,7 @@ config SOC_RENESAS
 			   ARCH_R8A77970 || ARCH_R8A77980 || ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
+	select SYSC_R8A77470 if ARCH_R8A77470
 	select SYSC_R8A7779 if ARCH_R8A7779
 	select SYSC_R8A7790 if ARCH_R8A7790
 	select SYSC_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
@@ -30,6 +31,10 @@ config SYSC_R8A7745
 	bool "RZ/G1E System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77470
+	bool "RZ/G1C System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A7779
 	bool "R-Car H1 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index ccb5ec5..a86ece7 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
 # SoC
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
+obj-$(CONFIG_SYSC_R8A77470)	+= r8a77470-sysc.o
 obj-$(CONFIG_SYSC_R8A7779)	+= r8a7779-sysc.o
 obj-$(CONFIG_SYSC_R8A7790)	+= r8a7790-sysc.o
 obj-$(CONFIG_SYSC_R8A7791)	+= r8a7791-sysc.o
diff --git a/drivers/soc/renesas/r8a77470-sysc.c b/drivers/soc/renesas/r8a77470-sysc.c
new file mode 100644
index 0000000..cfa015e
--- /dev/null
+++ b/drivers/soc/renesas/r8a77470-sysc.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G1C System Controller
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a77470-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a77470_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A77470_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca7-scu",	0x100, 0, R8A77470_PD_CA7_SCU,	R8A77470_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca7-cpu0",	0x1c0, 0, R8A77470_PD_CA7_CPU0,	R8A77470_PD_CA7_SCU,
+	  PD_CPU_NOCR },
+	{ "ca7-cpu1",	0x1c0, 1, R8A77470_PD_CA7_CPU1,	R8A77470_PD_CA7_SCU,
+	  PD_CPU_NOCR },
+	{ "sgx",	 0xc0, 0, R8A77470_PD_SGX, R8A77470_PD_ALWAYS_ON },
+};
+
+const struct rcar_sysc_info r8a77470_sysc_info __initconst = {
+	.areas = r8a77470_areas,
+	.num_areas = ARRAY_SIZE(r8a77470_areas),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index faf20e7..99203bd 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -261,6 +261,9 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A7745
 	{ .compatible = "renesas,r8a7745-sysc", .data = &r8a7745_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A77470
+	{ .compatible = "renesas,r8a77470-sysc", .data = &r8a77470_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index dcdc9ec..9b24e3a 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -51,6 +51,7 @@ struct rcar_sysc_info {
 
 extern const struct rcar_sysc_info r8a7743_sysc_info;
 extern const struct rcar_sysc_info r8a7745_sysc_info;
+extern const struct rcar_sysc_info r8a77470_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
diff --git a/include/dt-bindings/power/r8a77470-sysc.h b/include/dt-bindings/power/r8a77470-sysc.h
new file mode 100644
index 0000000..8bf4db1
--- /dev/null
+++ b/include/dt-bindings/power/r8a77470-sysc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77470_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77470_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77470_PD_CA7_CPU0		 5
+#define R8A77470_PD_CA7_CPU1		 6
+#define R8A77470_PD_SGX			20
+#define R8A77470_PD_CA7_SCU		21
+
+/* Always-on power area */
+#define R8A77470_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77470_SYSC_H__ */
-- 
2.7.4
