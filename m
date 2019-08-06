From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/20] arm64: dts: marvell: Add support for AP807/AP807-quad
Date: Tue,  6 Aug 2019 16:54:47 +0200
Message-ID: <20190806145500.24109-8-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Describe AP807 and AP807-quad support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../boot/dts/marvell/armada-ap807-quad.dtsi   | 51 +++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi | 29 +++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/armada-ap807.dtsi

diff --git a/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
new file mode 100644
index 000000000000..65364691257d
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree file for Marvell Armada AP807 Quad
+ *
+ * Copyright (C) 2019 Marvell Technology Group Ltd.
+ */
+
+#include "armada-ap807.dtsi"
+
+/ {
+	model = "Marvell Armada AP807 Quad";
+	compatible = "marvell,armada-ap807-quad", "marvell,armada-ap807";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x000>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			clocks = <&cpu_clk 0>;
+		};
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x001>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			clocks = <&cpu_clk 0>;
+		};
+		cpu2: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x100>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			clocks = <&cpu_clk 1>;
+		};
+		cpu3: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72", "arm,armv8";
+			reg = <0x101>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			clocks = <&cpu_clk 1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap807.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
new file mode 100644
index 000000000000..623010f3ca89
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree file for Marvell Armada AP807
+ *
+ * Copyright (C) 2019 Marvell Technology Group Ltd.
+ */
+
+#define AP_NAME		ap807
+#include "armada-ap80x.dtsi"
+
+/ {
+	model = "Marvell Armada AP807";
+	compatible = "marvell,armada-ap807";
+};
+
+&ap_syscon0 {
+	ap_clk: clock {
+		compatible = "marvell,ap807-clock";
+		#clock-cells = <1>;
+	};
+};
+
+&ap_syscon1 {
+	cpu_clk: clock-cpu {
+		compatible = "marvell,ap807-cpu-clock";
+		clocks = <&ap_clk 0>, <&ap_clk 1>;
+		#clock-cells = <1>;
+	};
+};
-- 
2.20.1
