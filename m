From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: clock: sifive: add FU540-C000 PRCI clock constants
Date: Wed,  3 Apr 2019 17:38:20 -0700
Message-ID: <20190404003820.10679-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, wesley@sifive.com, paul.walmsley@sifive.com, palmer@sifive.com
List-Id: devicetree@vger.kernel.org

Add preprocessor macros for the important PRCI output clocks
that are needed by both the FU540 PRCI driver and DT data.
Details are available in the FU540 manual in Chapter 7 of

    https://static.dev.sifive.com/FU540-C000-v1.0.pdf

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
---
Rob, Mark: this patch is a prerequisite for both the FU540 DT data
and for the FU540 PRCI clock driver patch series.  To prevent one
of those patch series from depending on the other, I'd like to ask
Palmer to merge this patch in one of his -rc pull requests.  Could
I get an ack from one or both of you for this purpose?  Thanks.

include/dt-bindings/clock/sifive-fu540-prci.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/clock/sifive-fu540-prci.h

diff --git a/include/dt-bindings/clock/sifive-fu540-prci.h b/include/dt-bindings/clock/sifive-fu540-prci.h
new file mode 100644
index 000000000000..6a0b70a37d78
--- /dev/null
+++ b/include/dt-bindings/clock/sifive-fu540-prci.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018-2019 SiFive, Inc.
+ * Wesley Terpstra
+ * Paul Walmsley
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
+#define __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
+
+/* Clock indexes for use by Device Tree data and the PRCI driver */
+
+#define PRCI_CLK_COREPLL	       0
+#define PRCI_CLK_DDRPLL		       1
+#define PRCI_CLK_GEMGXLPLL	       2
+#define PRCI_CLK_TLCLK		       3
+
+#endif
-- 
2.20.1
