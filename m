From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] ARM: shmobile: r8a7743: add CPG clock index macros
Date: Fri, 07 Oct 2016 23:46:47 +0300
Message-ID: <5042465.lGNbhCeBLl@wasted.cogentembedded.com>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A7743 CPG
clocks  by index.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- reduced the macro value indentation.

 include/dt-bindings/clock/r8a7743-cpg-mssr.h |   43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

Index: renesas/include/dt-bindings/clock/r8a7743-cpg-mssr.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/clock/r8a7743-cpg-mssr.h
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
+#define R8A7743_CLK_B		8
+#define R8A7743_CLK_LB		9
+#define R8A7743_CLK_P		10
+#define R8A7743_CLK_CL		11
+#define R8A7743_CLK_M2		12
+#define R8A7743_CLK_ZB3		13
+#define R8A7743_CLK_ZB3D2	14
+#define R8A7743_CLK_DDR		15
+#define R8A7743_CLK_SDH		16
+#define R8A7743_CLK_SD0		17
+#define R8A7743_CLK_SD2		18
+#define R8A7743_CLK_SD3		19
+#define R8A7743_CLK_MMC0	20
+#define R8A7743_CLK_MP		21
+#define R8A7743_CLK_QSPI	22
+#define R8A7743_CLK_CP		23
+#define R8A7743_CLK_RCAN	24
+#define R8A7743_CLK_R		25
+#define R8A7743_CLK_OSC		26
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__ */

