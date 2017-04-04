From: Anurup M <anurupvasu@gmail.com>
Subject: [PATCH v7 9/9] dts: arm64: hip07: Add Hisilicon SoC PMU support
Date: Tue,  4 Apr 2017 06:56:42 -0400
Message-ID: <1491303402-140597-1-git-send-email-anurup.m@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, will.deacon@arm.com, robh+dt@kernel.org, xuwei5@hisilicon.com, catalin.marinas@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, anurup.m@huawei.com, zhangshaokun@hisilicon.com, tanxiaojun@huawei.com, sanil.kumar@hisilicon.com, john.garry@huawei.com, gabriele.paoloni@huawei.com, shiju.jose@huawei.com, huangdaode@hisilicon.com, linuxarm@huawei.com, dikshit.n@huawei.com, shyju.pv@huawei.com, anurupvasu@gmail.com
List-Id: devicetree@vger.kernel.org

Add nodes for djtag, L3 cache and MN to support uncore events.

Signed-off-by: Anurup M <anurup.m@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 5144eb1..1099f6e 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1056,4 +1056,91 @@
 			status = "disabled";
 		};
 	};
+
+	djtag0: djtag@60010000 {
+		compatible = "hisilicon,hip07-cpu-djtag-v2";
+		reg = <0x0 0x60010000 0x0 0x10000>;
+		hisilicon,scl-id = <0x03>;
+
+		/* L3 cache bank 0 for socket0 CPU die scl#3 */
+		pmul3c0 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x01>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#3 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#3 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#3 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/*
+		 * Miscellaneous node for socket0
+		 * CPU die scl#3
+		 */
+		pmumn0 {
+			compatible = "hisilicon,hip07-pmu-mn-v2";
+			hisilicon,module-id = <0x21>;
+		};
+	};
+
+	djtag1: djtag@40010000 {
+		compatible = "hisilicon,hip07-cpu-djtag-v2";
+		reg = <0x0 0x40010000 0x0 0x10000>;
+		hisilicon,scl-id = <0x01>;
+
+		/* L3 cache bank 0 for socket0 CPU die scl#1 */
+		pmul3c0 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x01>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#1 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#1 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#1 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/*
+		 * Miscellaneous node for socket0
+		 * CPU die scl#1
+		 */
+		pmumn1 {
+			compatible = "hisilicon,hip07-pmu-mn-v2";
+			hisilicon,module-id = <0x21>;
+		};
+	};
+
 };
-- 
2.1.4
