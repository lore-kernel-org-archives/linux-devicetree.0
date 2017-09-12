From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
Date: Tue, 12 Sep 2017 23:37:19 +0300
Message-ID: <20170912210514.517628239@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=dt-bindings-power-add-R8A77970-SYSC-power-domain-definitions.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A77970 SYSC
power domains by index.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>.

Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 include/dt-bindings/power/r8a77970-sysc.h |   32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

Index: renesas/include/dt-bindings/power/r8a77970-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a77970-sysc.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright (C) 2017 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77970_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77970_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77970_PD_CA53_CPU0		 5
+#define R8A77970_PD_CA53_CPU1		 6
+#define R8A77970_PD_CR7			13
+#define R8A77970_PD_CA53_SCU		21
+#define R8A77970_PD_A2IR0		23
+#define R8A77970_PD_A3IR			24
+#define R8A77970_PD_A2IR1		27
+#define R8A77970_PD_A2IR2		28
+#define R8A77970_PD_A2IR3		29
+#define R8A77970_PD_A2SC0		30
+#define R8A77970_PD_A2SC1		31
+
+/* Always-on power area */
+#define R8A77970_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77970_SYSC_H__ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
