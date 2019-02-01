From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 3/3] dt-bindings: clock: Add loongson-1 clock bindings
Date: Fri,  1 Feb 2019 14:35:40 +0800
Message-ID: <20190201063540.19636-4-jiaxun.yang@flygoat.com>
References: <20190128152052.3047-1-jiaxun.yang@flygoat.com>
 <20190201063540.19636-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201063540.19636-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Loongson-1 is a series of MIPS MCUs.
This patch add the clock bindings for loongson-1b and
loongson-1c clock subsystem.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../bindings/clock/loongson1-clock.txt          | 14 ++++++++++++++
 include/dt-bindings/clock/ls1b-clock.h          | 17 +++++++++++++++++
 include/dt-bindings/clock/ls1c-clock.h          | 14 ++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/loongson1-clock.txt
 create mode 100644 include/dt-bindings/clock/ls1b-clock.h
 create mode 100644 include/dt-bindings/clock/ls1c-clock.h

diff --git a/Documentation/devicetree/bindings/clock/loongson1-clock.txt b/Documentation/devicetree/bindings/clock/loongson1-clock.txt
new file mode 100644
index 000000000000..5afd13a98eaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/loongson1-clock.txt
@@ -0,0 +1,14 @@
+* Clock bindings for Loongson-1 MCUs
+
+Required properties:
+- compatible: must contain one of the following compatibles:
+                - "loongson,ls1b-clock"
+                - "loongson,ls1c-clock"
+
+- reg: Address and length of the register set
+- #clock-cells: Should be <1>
+- clocks: list of input clocks
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell. See include/dt-bindings/clock/ls1c-clock.h
+or include/dt-bindings/clock/ls1b-clock.h for the full list of clocks.
diff --git a/include/dt-bindings/clock/ls1b-clock.h b/include/dt-bindings/clock/ls1b-clock.h
new file mode 100644
index 000000000000..c7ae85bb4583
--- /dev/null
+++ b/include/dt-bindings/clock/ls1b-clock.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com> */
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
index 000000000000..9d01914f374e
--- /dev/null
+++ b/include/dt-bindings/clock/ls1c-clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com> */
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
