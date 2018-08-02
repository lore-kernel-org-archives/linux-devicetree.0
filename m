Return-Path: <SRS0=H47x=KR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/5] dt-bindings: power: Add r8a774a1 SYSC power domain definitions
Date: Thu,  2 Aug 2018 15:48:18 +0100
Message-Id: <1533221302-44598-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533221302-44598-1-git-send-email-biju.das@bp.renesas.com>
References: <1533221302-44598-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds power domain indices for RZ/G2M.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
     * No change
---
 include/dt-bindings/power/r8a774a1-sysc.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a774a1-sysc.h

diff --git a/include/dt-bindings/power/r8a774a1-sysc.h b/include/dt-bindings/power/r8a774a1-sysc.h
new file mode 100644
index 0000000..580f431
--- /dev/null
+++ b/include/dt-bindings/power/r8a774a1-sysc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A774A1_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A774A1_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A774A1_PD_CA57_CPU0		 0
+#define R8A774A1_PD_CA57_CPU1		 1
+#define R8A774A1_PD_CA53_CPU0		 5
+#define R8A774A1_PD_CA53_CPU1		 6
+#define R8A774A1_PD_CA53_CPU2		 7
+#define R8A774A1_PD_CA53_CPU3		 8
+#define R8A774A1_PD_CA57_SCU		12
+#define R8A774A1_PD_A3VC		14
+#define R8A774A1_PD_3DG_A		17
+#define R8A774A1_PD_3DG_B		18
+#define R8A774A1_PD_CA53_SCU		21
+#define R8A774A1_PD_A2VC0		25
+#define R8A774A1_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A774A1_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A774A1_SYSC_H__ */
-- 
2.7.4
