From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 02/12] ARM: shmobile: r8a7792: add power domain index macros
Date: Fri, 10 Jun 2016 00:33:32 +0300
Message-ID: <5668456.Vz9YOUO7ef@wasted.cogentembedded.com>
References: <1879394.3zBGLpF2nv@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1879394.3zBGLpF2nv-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A7792 SYSC power
domains by index.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

---
Changes in version 2:
- added Geert's tag.

 include/dt-bindings/power/r8a7792-sysc.h |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

Index: renesas/include/dt-bindings/power/r8a7792-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a7792-sysc.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7792_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7792_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7792_PD_CA15_CPU0		0
+#define R8A7792_PD_CA15_CPU1		1
+#define R8A7792_PD_CA15_SCU		12
+#define R8A7792_PD_SGX			20
+#define R8A7792_PD_IMP			24
+
+/* Always-on power area */
+#define R8A7792_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7792_SYSC_H__ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
