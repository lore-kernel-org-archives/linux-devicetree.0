From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 01/11] ARM: shmobile: r8a7745: add power domain index macros
Date: Sat, 29 Oct 2016 01:07:45 +0300
Message-ID: <1645729.DjklObBkNM@wasted.cogentembedded.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A7745 SYSC power
domains by index.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/dt-bindings/power/r8a7745-sysc.h |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/include/dt-bindings/power/r8a7745-sysc.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/power/r8a7745-sysc.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7745_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7745_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7745_PD_CA7_CPU0		 5
+#define R8A7745_PD_CA7_CPU1		 6
+#define R8A7745_PD_SGX			20
+#define R8A7745_PD_CA7_SCU		21
+
+/* Always-on power area */
+#define R8A7745_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7745_SYSC_H__ */
