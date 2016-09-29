From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH RFC v2 2/12] ARM: shmobile: r8a7743: add power domain index macros
Date: Fri, 30 Sep 2016 01:17:47 +0300
Message-ID: <10048005.ZebNI1l2xW@wasted.cogentembedded.com>
References: <1987532.PE2ex6PrJ5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1987532.PE2ex6PrJ5-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A7743 SYSC power
domains by index.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changes in version 2:
- added Geert's tag.

 include/dt-bindings/power/r8a7743-sysc.h |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/include/dt-bindings/power/r8a7743-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a7743-sysc.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7743_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7743_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7743_PD_CA15_CPU0		 0
+#define R8A7743_PD_CA15_CPU1		 1
+#define R8A7743_PD_CA15_SCU		12
+#define R8A7743_PD_SGX			20
+
+/* Always-on power area */
+#define R8A7743_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7743_SYSC_H__ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
