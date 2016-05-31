From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 02/13] ARM: shmobile: r8a7792: add power domain index macros
Date: Wed, 01 Jun 2016 01:11:40 +0300
Message-ID: <2701785.yYTs7puE3Y@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference R8A7792 SYSC power
domains by index.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
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
