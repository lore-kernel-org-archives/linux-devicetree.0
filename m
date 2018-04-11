Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] soc: renesas: Add r8a77990 SYSC PM Domain Binding Definitions
Date: Wed, 11 Apr 2018 18:36:24 +0900
Message-Id: <1523439386-1032-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds power domain indices for R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[shimoda: add commit log and SPDX-License-Identifier]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/power/r8a77990-sysc.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77990-sysc.h

diff --git a/include/dt-bindings/power/r8a77990-sysc.h b/include/dt-bindings/power/r8a77990-sysc.h
new file mode 100644
index 0000000..944d85b
--- /dev/null
+++ b/include/dt-bindings/power/r8a77990-sysc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A77990_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A77990_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A77990_PD_CA53_CPU0		5
+#define R8A77990_PD_CA53_CPU1		6
+#define R8A77990_PD_CR7			13
+#define R8A77990_PD_A3VC		14
+#define R8A77990_PD_3DG_A		17
+#define R8A77990_PD_3DG_B		18
+#define R8A77990_PD_CA53_SCU		21
+#define R8A77990_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A77990_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A77990_SYSC_H__ */
-- 
1.9.1
