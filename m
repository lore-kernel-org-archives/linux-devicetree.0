From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/3] dt-bindings: clock: Add loongson-1 clock bindings
Date: Mon, 28 Jan 2019 23:20:52 +0800
Message-ID: <20190128152052.3047-4-jiaxun.yang@flygoat.com>
References: <20190125133413.4130-1-jiaxun.yang@flygoat.com>
 <20190128152052.3047-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128152052.3047-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Loongson-1 is a series of MIPS MCUs.
This patch add the clock bindings for loongson-1b and
loongson-1c clock subsystem.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../bindings/clock/loongson1-clock.txt        | 11 ++++++++++
 include/dt-bindings/clock/ls1b-clock.h        | 20 +++++++++++++++++++
 include/dt-bindings/clock/ls1c-clock.h        | 17 ++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/loongson1-clock.txt
 create mode 100644 include/dt-bindings/clock/ls1b-clock.h
 create mode 100644 include/dt-bindings/clock/ls1c-clock.h

diff --git a/Documentation/devicetree/bindings/clock/loongson1-clock.txt b/Documentation/devicetree/bindings/clock/loongson1-clock.txt
new file mode 100644
index 000000000000..f0119fbd0851
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/loongson1-clock.txt
@@ -0,0 +1,11 @@
+* Clock bindings for Loongson-1 MCUs
+
+Required properties:
+- compatible: Should be "loongson,ls1c-clock" or "loongson,ls1b-clock"
+- reg: Address and length of the register set
+- #clock-cells: Should be <1>
+- clocks: list of input clocks
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell. See include/dt-bindings/clock/ls1c-clock.h
+or include/dt-bindings/clock/ls1b-clock.h for the full list of clocks.
diff --git a/include/dt-bindings/clock/ls1b-clock.h b/include/dt-bindings/clock/ls1b-clock.h
new file mode 100644
index 000000000000..814227842ae0
--- /dev/null
+++ b/include/dt-bindings/clock/ls1b-clock.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier:	GPL-2.0
+/*
+ * Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_LS1B_CLOCK_H__
+#define __DT_BINDINGS_CLOCK_LS1B_CLOCK_H__
+
+#define LS1B_CLK_PLL 0
+#define LS1B_CLK_CPU_DIV 1
+#define LS1B_CLK_CPU 2
+#define LS1B_CLK_DC_DIV 3
+#define LS1B_CLK_DC 4
+#define LS1B_CLK_DDR_DIV 5
+#define LS1B_CLK_DDR 6
+#define LS1B_CLK_AHB 7
+#define LS1B_CLK_APB 8
+
+#endif /* __DT_BINDINGS_CLOCK_LS1B_CLOCK_H__ */
diff --git a/include/dt-bindings/clock/ls1c-clock.h b/include/dt-bindings/clock/ls1c-clock.h
new file mode 100644
index 000000000000..40f386cb92ce
--- /dev/null
+++ b/include/dt-bindings/clock/ls1c-clock.h
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier:	GPL-2.0
+/*
+ * Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_LS1C_CLOCK_H__
+#define __DT_BINDINGS_CLOCK_LS1C_CLOCK_H__
+
+#define LS1C_CLK_PLL 0
+#define LS1C_CLK_CPU 1
+#define LS1C_CLK_DC 2
+#define LS1C_CLK_DDR 3
+#define LS1C_CLK_AHB 4
+#define LS1C_CLK_APB 5
+
+#endif /* __DT_BINDINGS_CLOCK_LS1C_CLOCK_H__ */
-- 
2.20.1
