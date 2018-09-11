Return-Path: <SRS0=HlV8=LZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 02/10] dt-bindings: power: rcar-sysc: Add r8a7744 power domain index macros
Date: Tue, 11 Sep 2018 11:12:43 +0100
Message-Id: <1536660771-32278-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add power domain indices for RZ/G1N (R8A7744) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 include/dt-bindings/power/r8a7744-sysc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7744-sysc.h

diff --git a/include/dt-bindings/power/r8a7744-sysc.h b/include/dt-bindings/power/r8a7744-sysc.h
new file mode 100644
index 0000000..8b65297
--- /dev/null
+++ b/include/dt-bindings/power/r8a7744-sysc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7744_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7744_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ *
+ * Note that RZ/G1N is identical to RZ/G2M w.r.t. power domains.
+ */
+
+#define R8A7744_PD_CA15_CPU0		 0
+#define R8A7744_PD_CA15_CPU1		 1
+#define R8A7744_PD_CA15_SCU		12
+#define R8A7744_PD_SGX			20
+
+/* Always-on power area */
+#define R8A7744_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7744_SYSC_H__ */
-- 
2.7.4
