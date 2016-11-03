From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: shmobile: r8a7745: add CPG clock index macros
Date: Fri, 04 Nov 2016 00:09:28 +0300
Message-ID: <1764252.Q3lPMOJFSH@wasted.cogentembedded.com>
References: <9992368.desJvZIsUT@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9992368.desJvZIsUT-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by  the device tree sources to reference the R8A7745 CPG
clocks  by index. The data comes from the  table 7.2c in the revision 0.50
of the RZ/G Series User's Manual.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
