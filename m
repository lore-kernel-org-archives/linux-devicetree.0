From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: add R8A77970 CPG core clock definitions
Date: Sat, 09 Sep 2017 00:34:19 +0300
Message-ID: <20170908213758.670316956__37018.8588196926$1504906699$gmane$org@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=dt-bindings-clock-add-R8A77970-CPG-core-clock-definitions-v2.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A77970
CPG core clocks by index. The data come from the table 8.2c of R-Car
Series, 3rd Generation User's Manual: Hardware (Rev. 0.55, Jun. 30, 2017).

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>.

Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changed in version 2:
- changed R8A7797 to R8A77970 everywhere;
- removed the CSIREF clock (renumbering the clocks that followed it);
- added the R-Car gen3 manual reference to the patch description;
- added Geert's tag;
- added Cogent Embedded's copyright;
- renamed the patch.

 include/dt-bindings/clock/r8a77970-cpg-mssr.h |   48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

Index: linux/include/dt-bindings/clock/r8a77970-cpg-mssr.h
===================================================================
--- /dev/null
+++ linux/include/dt-bindings/clock/r8a77970-cpg-mssr.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77970 CPG Core Clocks */
+#define R8A77970_CLK_Z2			0
+#define R8A77970_CLK_ZR			1
+#define R8A77970_CLK_ZTR		2
+#define R8A77970_CLK_ZTRD2		3
+#define R8A77970_CLK_ZT			4
+#define R8A77970_CLK_ZX			5
+#define R8A77970_CLK_S1D1		6
+#define R8A77970_CLK_S1D2		7
+#define R8A77970_CLK_S1D4		8
+#define R8A77970_CLK_S2D1		9
+#define R8A77970_CLK_S2D2		10
+#define R8A77970_CLK_S2D4		11
+#define R8A77970_CLK_LB			12
+#define R8A77970_CLK_CL			13
+#define R8A77970_CLK_ZB3		14
+#define R8A77970_CLK_ZB3D2		15
+#define R8A77970_CLK_DDR		16
+#define R8A77970_CLK_CR			17
+#define R8A77970_CLK_CRD2		18
+#define R8A77970_CLK_SD0H		19
+#define R8A77970_CLK_SD0		20
+#define R8A77970_CLK_RPC		21
+#define R8A77970_CLK_RPCD2		22
+#define R8A77970_CLK_MSO		23
+#define R8A77970_CLK_CANFD		24
+#define R8A77970_CLK_CSI0		25
+#define R8A77970_CLK_FRAY		26
+#define R8A77970_CLK_CP			27
+#define R8A77970_CLK_CPEX		28
+#define R8A77970_CLK_R			29
+#define R8A77970_CLK_OSC		30
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77970_CPG_MSSR_H__ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
