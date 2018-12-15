From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 7/7] riscv: dts: add initial board data for the SiFive HiFive Unleashed
Date: Fri, 14 Dec 2018 21:21:54 -0800
Message-ID: <20181215052154.24347-8-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

Add initial board data for the SiFive HiFive Unleashed A00.

Currently the data populated in this DT file describes the board
DRAM configuration and the external clock sources that supply the
PRCI.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 arch/riscv/boot/dts/Makefile                  |  2 +
 arch/riscv/boot/dts/sifive/Makefile           |  4 ++
 .../dts/sifive/hifive-unleashed-a00-fu540.dts | 39 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 arch/riscv/boot/dts/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
new file mode 100644
index 000000000000..dcc3ada78455
--- /dev/null
+++ b/arch/riscv/boot/dts/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-y += sifive
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
new file mode 100644
index 000000000000..e120ccf5649c
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00-fu540.dtb
+
+
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
new file mode 100644
index 000000000000..0c6afabe69e3
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: Apache-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2018 SiFive, Inc */
+/* See the file LICENSE for further information */
+
+/dts-v1/;
+
+#include "fu540-c000.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SiFive HiFive Unleashed A00 (FU540-C000)"
+	compatible = "sifive,hifive-unleashed-a00-fu540",
+		"sifive,hifive-unleashed-fu540";
+
+	chosen {
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1f 0x80000000>;
+	};
+
+	soc {
+		hfclk: hfclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <33333333>;
+			clock-output-names = "hfclk";
+		};
+		rtcclk: rtcclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "rtcclk";
+		};
+	};
+};
-- 
2.20.0
