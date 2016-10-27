From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 1/2] ARM: shmobile: r8a7743: add CPG clock index macros
Date: Thu, 27 Oct 2016 23:23:35 +0300
Message-ID: <3099806.ZmRHFh5yFn@wasted.cogentembedded.com>
References: <1590929.i2qFnIhqnT@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1590929.i2qFnIhqnT-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by  the device tree sources to reference the R8A7743 CPG
clocks  by index. The data comes from the  table 7.2b in the revision 0.50
of the RZ/G Series User's Manual.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
