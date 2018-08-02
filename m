Return-Path: <SRS0=HJQ3=KR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:7395 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387524AbeHBQup (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Aug 2018 12:50:45 -0400
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
Date: Thu,  2 Aug 2018 15:53:19 +0100
Message-Id: <1533221599-52948-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for RZ/G2M (R8A774A1) SoC power areas to the R-Car SYSC
driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
     * No change
---
 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 +++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a774a1-sysc.c                | 45 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 ++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 6 files changed, 56 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774a1-sysc.c

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index 180ae65..4e3ec6a 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -10,6 +10,7 @@ Required properties:
       - "renesas,r8a7743-sysc" (RZ/G1M)
       - "renesas,r8a7745-sysc" (RZ/G1E)
       - "renesas,r8a77470-sysc" (RZ/G1C)
+      - "renesas,r8a774a1-sysc" (RZ/G2M)
       - "renesas,r8a7779-sysc" (R-Car H1)
       - "renesas,r8a7790-sysc" (R-Car H2)
       - "renesas,r8a7791-sysc" (R-Car M2-W)
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 1d824cb..d769330 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -9,6 +9,7 @@ config SOC_RENESAS
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A77470 if ARCH_R8A77470
+	select SYSC_R8A774A1 if ARCH_R8A774A1
 	select SYSC_R8A7779 if ARCH_R8A7779
 	select SYSC_R8A7790 if ARCH_R8A7790
 	select SYSC_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
@@ -37,6 +38,10 @@ config SYSC_R8A77470
 	bool "RZ/G1C System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A774A1
+	bool "RZ/G2M System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 config SYSC_R8A7779
 	bool "R-Car H1 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index c37b080..6adb9d6 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
 obj-$(CONFIG_SYSC_R8A7743)	+= r8a7743-sysc.o
 obj-$(CONFIG_SYSC_R8A7745)	+= r8a7745-sysc.o
 obj-$(CONFIG_SYSC_R8A77470)	+= r8a77470-sysc.o
+obj-$(CONFIG_SYSC_R8A774A1)	+= r8a774a1-sysc.o
 obj-$(CONFIG_SYSC_R8A7779)	+= r8a7779-sysc.o
 obj-$(CONFIG_SYSC_R8A7790)	+= r8a7790-sysc.o
 obj-$(CONFIG_SYSC_R8A7791)	+= r8a7791-sysc.o
diff --git a/drivers/soc/renesas/r8a774a1-sysc.c b/drivers/soc/renesas/r8a774a1-sysc.c
new file mode 100644
index 0000000..9db51ff
--- /dev/null
+++ b/drivers/soc/renesas/r8a774a1-sysc.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2M System Controller
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car M3-W System Controller
+ * Copyright (C) 2016 Glider bvba
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/power/r8a774a1-sysc.h>
+
+#include "rcar-sysc.h"
+
+static const struct rcar_sysc_area r8a774a1_areas[] __initconst = {
+	{ "always-on",	    0, 0, R8A774A1_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca57-scu",	0x1c0, 0, R8A774A1_PD_CA57_SCU,	R8A774A1_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca57-cpu0",	 0x80, 0, R8A774A1_PD_CA57_CPU0, R8A774A1_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "ca57-cpu1",	 0x80, 1, R8A774A1_PD_CA57_CPU1, R8A774A1_PD_CA57_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-scu",	0x140, 0, R8A774A1_PD_CA53_SCU,	R8A774A1_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca53-cpu0",	0x200, 0, R8A774A1_PD_CA53_CPU0, R8A774A1_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu1",	0x200, 1, R8A774A1_PD_CA53_CPU1, R8A774A1_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu2",	0x200, 2, R8A774A1_PD_CA53_CPU2, R8A774A1_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "ca53-cpu3",	0x200, 3, R8A774A1_PD_CA53_CPU3, R8A774A1_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+	{ "a3vc",	0x380, 0, R8A774A1_PD_A3VC,	R8A774A1_PD_ALWAYS_ON },
+	{ "a2vc0",	0x3c0, 0, R8A774A1_PD_A2VC0,	R8A774A1_PD_A3VC },
+	{ "a2vc1",	0x3c0, 1, R8A774A1_PD_A2VC1,	R8A774A1_PD_A3VC },
+	{ "3dg-a",	0x100, 0, R8A774A1_PD_3DG_A,	R8A774A1_PD_ALWAYS_ON },
+	{ "3dg-b",	0x100, 1, R8A774A1_PD_3DG_B,	R8A774A1_PD_3DG_A },
+};
+
+const struct rcar_sysc_info r8a774a1_sysc_info __initconst = {
+	.areas = r8a774a1_areas,
+	.num_areas = ARRAY_SIZE(r8a774a1_areas),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 029188e..fe32f7a 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -275,6 +275,9 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A77470
 	{ .compatible = "renesas,r8a77470-sysc", .data = &r8a77470_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A774A1
+	{ .compatible = "renesas,r8a774a1-sysc", .data = &r8a774a1_sysc_info },
+#endif
 #ifdef CONFIG_SYSC_R8A7779
 	{ .compatible = "renesas,r8a7779-sysc", .data = &r8a7779_sysc_info },
 #endif
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index a22e7cf..33defe6 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -52,6 +52,7 @@ struct rcar_sysc_info {
 extern const struct rcar_sysc_info r8a7743_sysc_info;
 extern const struct rcar_sysc_info r8a7745_sysc_info;
 extern const struct rcar_sysc_info r8a77470_sysc_info;
+extern const struct rcar_sysc_info r8a774a1_sysc_info;
 extern const struct rcar_sysc_info r8a7779_sysc_info;
 extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
-- 
2.7.4

