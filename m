From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 1/2] ARM: shmobile: r8a7743: add CPG clock index macros
Date: Thu, 03 Nov 2016 00:57:11 +0300
Message-ID: <2213928.GM4AGq02MQ@wasted.cogentembedded.com>
References: <1737840.BeMyoUTlpl@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1737840.BeMyoUTlpl@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Add macros usable by  the device tree sources to reference the R8A7743 CPG
clocks  by index. The data comes from the  table 7.2b in the revision 0.50
of the RZ/G Series User's Manual.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 4:
- added Geert's tag.

Changes in version 3:
- renumbered the #define's in order to match the R8A7791 CPG clocks;
- added the reference to the manual in the patch description.

Changes in version 2:
- reduced the macro value indentation.

 include/dt-bindings/clock/r8a7743-cpg-mssr.h |   43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

Index: linux/include/dt-bindings/clock/r8a7743-cpg-mssr.h
===================================================================
--- /dev/null
+++ linux/include/dt-bindings/clock/r8a7743-cpg-mssr.h
@@ -0,0 +1,43 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7743 CPG Core Clocks */
+#define R8A7743_CLK_Z		0
+#define R8A7743_CLK_ZG		1
+#define R8A7743_CLK_ZTR		2
+#define R8A7743_CLK_ZTRD2	3
+#define R8A7743_CLK_ZT		4
+#define R8A7743_CLK_ZX		5
+#define R8A7743_CLK_ZS		6
+#define R8A7743_CLK_HP		7
+#define R8A7743_CLK_B		9
+#define R8A7743_CLK_LB		10
+#define R8A7743_CLK_P		11
+#define R8A7743_CLK_CL		12
+#define R8A7743_CLK_M2		13
+#define R8A7743_CLK_ZB3		15
+#define R8A7743_CLK_ZB3D2	16
+#define R8A7743_CLK_DDR		17
+#define R8A7743_CLK_SDH		18
+#define R8A7743_CLK_SD0		19
+#define R8A7743_CLK_SD2		20
+#define R8A7743_CLK_SD3		21
+#define R8A7743_CLK_MMC0	22
+#define R8A7743_CLK_MP		23
+#define R8A7743_CLK_QSPI	26
+#define R8A7743_CLK_CP		27
+#define R8A7743_CLK_RCAN	28
+#define R8A7743_CLK_R		29
+#define R8A7743_CLK_OSC		30
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__ */
