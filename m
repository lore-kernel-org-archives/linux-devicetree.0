From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 01/11] ARM: shmobile: r8a7743: add power domain index macros
Date: Thu, 06 Oct 2016 00:31:30 +0300
Message-ID: <5183851.NpIWVzMZV9@wasted.cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A7743 SYSC power
domains by index.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
