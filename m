From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car D3 power areas
Date: Thu, 20 Jul 2017 14:34:53 +0200
Message-ID: <1500554094-22198-4-git-send-email-geert+renesas@glider.be>
References: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
---
 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 ++++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a77995-sysc.c                | 31 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 +++
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 6 files changed, 42 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a77995-sysc.c

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index d91715bc8d52c22e..98cc8c09d02d5d85 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -17,6 +17,7 @@ Required properties:
       - "renesas,r8a7794-sysc" (R-Car E2)
       - "renesas,r8a7795-sysc" (R-Car H3)
       - "renesas,r8a7796-sysc" (R-Car M3-W)
+      - "renesas,r8a77995-sysc" (R-Car D3)
   - reg: Address start and address range for the device.
   - #power-domain-cells: Must be 1.
 
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 87a4be46bd9834c1..680a5a29837b42d4 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -13,6 +13,7 @@ config SOC_RENESAS
 	select SYSC_R8A7794 if ARCH_R8A7794
 	select SYSC_R8A7795 if ARCH_R8A7795
 	select SYSC_R8A7796 if ARCH_R8A7796
+	select SYSC_R8A77995 if ARCH_R8A77995
 
 if SOC_RENESAS
 
@@ -53,6 +54,10 @@ config SYSC_R8A7796
 	bool "R-Car M3-W System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
+config SYSC_R8A77995
+	bool "R-Car D3 System Controller support" if COMPILE_TEST
+	select SYSC_RCAR
+
 # Family
 config RST_RCAR
 	bool "R-Car Reset Controller support" if COMPILE_TEST
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 1a1a297b26a79613..6b6e7f16104c8dbb 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SYSC_R8A7792)	+= r8a7792-sysc.o
 obj-$(CONFIG_SYSC_R8A7794)	+= r8a7794-sysc.o
 obj-$(CONFIG_SYSC_R8A7795)	+= r8a7795-sysc.o
 obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
+obj-$(CONFIG_SYSC_R8A77995)	+= r8a77995-sysc.o
 
 # Family
 obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
diff --git a/drivers/soc/renesas/r8a77995-sysc.c b/drivers/soc/renesas/r8a77995-sysc.c
new file mode 100644
index 0000000000000000..f718429cab02393d
--- /dev/null
+++ b/drivers/soc/renesas/r8a77995-sysc.c
@@ -0,0 +1,31 @@
+/*
+ * Renesas R-Car D3 System Controller
+ *
+ * Copyright (C) 2017 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/bug.h>
+#include <linux/kernel.h>
+#include <linux/sys_soc.h>
+
+#include <dt-bindings/power/r8a77995-sysc.h>
+
+#include "rcar-sysc.h"
+
+static struct rcar_sysc_area r8a77995_areas[] __initdata = {
+	{ "always-on",     0, 0, R8A77995_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
+	{ "ca53-scu",  0x140, 0, R8A77995_PD_CA53_SCU,  R8A77995_PD_ALWAYS_ON,
+	  PD_SCU },
+	{ "ca53-cpu0", 0x200, 0, R8A77995_PD_CA53_CPU0, R8A77995_PD_CA53_SCU,
+	  PD_CPU_NOCR },
+};
+
+
+const struct rcar_sysc_info r8a77995_sysc_info __initconst = {
+	.areas = r8a77995_areas,
+	.num_areas = ARRAY_SIZE(r8a77995_areas),
+};
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 7c8da3c90011422f..e4d3b0101dfb8838 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -284,6 +284,9 @@ static const struct of_device_id rcar_sysc_matches[] = {
 #ifdef CONFIG_SYSC_R8A7796
 	{ .compatible = "renesas,r8a7796-sysc", .data = &r8a7796_sysc_info },
 #endif
+#ifdef CONFIG_SYSC_R8A77995
+	{ .compatible = "renesas,r8a77995-sysc", .data = &r8a77995_sysc_info },
+#endif
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 1a5bebaf54ba191c..2f524922c4d261bf 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -58,6 +58,7 @@ extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern const struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
+extern const struct rcar_sysc_info r8a77995_sysc_info;
 
 
     /*
-- 
2.7.4
