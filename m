From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 1/2] ARM: shmobile: r8a7745: add CPG clock index macros
Date: Sun, 06 Nov 2016 01:31:31 +0300
Message-ID: <6619847.B5XdH7v7xE@wasted.cogentembedded.com>
References: <3539878.XFtRJDB9iq@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <3539878.XFtRJDB9iq@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Add macros usable by  the device tree sources to reference the R8A7745 CPG
clocks  by index. The data comes from the  table 7.2c in the revision 0.50
of the RZ/G Series User's Manual.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 include/dt-bindings/clock/r8a7745-cpg-mssr.h |   44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

Index: linux/include/dt-bindings/clock/r8a7745-cpg-mssr.h
===================================================================
--- /dev/null
+++ linux/include/dt-bindings/clock/r8a7745-cpg-mssr.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A7745_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7745_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7745 CPG Core Clocks */
+#define R8A7745_CLK_Z2		0
+#define R8A7745_CLK_ZG		1
+#define R8A7745_CLK_ZTR		2
+#define R8A7745_CLK_ZTRD2	3
+#define R8A7745_CLK_ZT		4
+#define R8A7745_CLK_ZX		5
+#define R8A7745_CLK_ZS		6
+#define R8A7745_CLK_HP		7
+#define R8A7745_CLK_B		9
+#define R8A7745_CLK_LB		10
+#define R8A7745_CLK_P		11
+#define R8A7745_CLK_CL		12
+#define R8A7745_CLK_CP		13
+#define R8A7745_CLK_M2		14
+#define R8A7745_CLK_ZB3		16
+#define R8A7745_CLK_ZB3D2	17
+#define R8A7745_CLK_DDR		18
+#define R8A7745_CLK_SDH		19
+#define R8A7745_CLK_SD0		20
+#define R8A7745_CLK_SD2		21
+#define R8A7745_CLK_SD3		22
+#define R8A7745_CLK_MMC0	23
+#define R8A7745_CLK_MP		24
+#define R8A7745_CLK_QSPI	25
+#define R8A7745_CLK_ACP		26
+#define R8A7745_CLK_RCAN	27
+#define R8A7745_CLK_R		28
+#define R8A7745_CLK_OSC		29
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7745_CPG_MSSR_H__ */

