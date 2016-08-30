From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 24/26] dt-bindings: Document img,boston-clock binding
Date: Tue, 30 Aug 2016 18:29:27 +0100
Message-ID: <20160830172929.16948-25-paul.burton@imgtec.com>
References: <20160830172929.16948-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160830172929.16948-1-paul.burton@imgtec.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the clocks provided by the
MIPS Boston development board from Imagination Technologies, and a
header file describing the available clocks for use by device trees &
driver.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2:
- Add BOSTON_CLK_INPUT to expose the input clock.

 .../devicetree/bindings/clock/img,boston-clock.txt | 27 ++++++++++++++++++++++
 include/dt-bindings/clock/boston-clock.h           | 14 +++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/img,boston-clock.txt
 create mode 100644 include/dt-bindings/clock/boston-clock.h

diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
new file mode 100644
index 0000000..c01ea60
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
@@ -0,0 +1,27 @@
+Binding for Imagination Technologies MIPS Boston clock sources.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : Should be "img,boston-clock".
+- #clock-cells : Should be set to 1.
+  Values available for clock consumers can be found in the header file:
+    <dt-bindings/clock/boston-clock.h>
+- regmap : Phandle to the Boston platform register system controller.
+  This should contain a phandle to the system controller node covering the
+  platform registers provided by the Boston board.
+
+Example:
+
+	clk_boston: clock {
+		compatible = "img,boston-clock";
+		#clock-cells = <1>;
+		regmap = <&plat_regs>;
+	};
+
+	uart0: uart@17ffe000 {
+		/* ... */
+		clocks = <&clk_boston BOSTON_CLK_SYS>;
+	};
diff --git a/include/dt-bindings/clock/boston-clock.h b/include/dt-bindings/clock/boston-clock.h
new file mode 100644
index 0000000..a6f0098
--- /dev/null
+++ b/include/dt-bindings/clock/boston-clock.h
@@ -0,0 +1,14 @@
+/*
+ * Copyright (C) 2016 Imagination Technologies
+ *
+ * SPDX-License-Identifier:	GPL-2.0
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
+#define __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
+
+#define BOSTON_CLK_INPUT 0
+#define BOSTON_CLK_SYS 1
+#define BOSTON_CLK_CPU 2
+
+#endif /* __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__ */
-- 
2.9.3

