From: Anurup M <anurupvasu@gmail.com>
Subject: [PATCH v2 10/10] dts: arm64: hip06: Add Hisilicon SoC PMU support
Date: Wed,  7 Dec 2016 11:58:33 -0500
Message-ID: <1481129913-159858-1-git-send-email-anurup.m@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, will.deacon@arm.com, robh+dt@kernel.org, xuwei5@hisilicon.com, catalin.marinas@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, anurup.m@huawei.com, zhangshaokun@hisilicon.com, tanxiaojun@huawei.com, sanil.kumar@hisilicon.com, john.garry@huawei.com, gabriele.paoloni@huawei.com, shiju.jose@huawei.com, linuxarm@huawei.com, shyju.pv@huawei.com, anurupvasu@gmail.com
List-Id: devicetree@vger.kernel.org

1. Add nodes for hip06 L3 cache to support uncore events.
2. Add nodes for hip06 MN to support uncore events.

Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
Signed-off-by: John Garry <john.garry@huawei.com>
Signed-off-by: Anurup M <anurup.m@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hip06.dtsi | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index e861698..309b974 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -963,6 +963,84 @@
 			status = "disabled";
 		};
 
+		djtag0: djtag@60010000 {
+			compatible = "hisilicon,hisi-djtag-v1";
+			reg = <0x0 0x60010000 0x0 0x10000>;
+			scl-id = <0x02>;
+
+			/* L3 cache bank 0 for socket0 CPU die scl#2 */
+			pmul3c0 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x02>;
+			};
+
+			/* L3 cache bank 1 for socket0 CPU die scl#2 */
+			pmul3c1 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x04>;
+			};
+
+			/* L3 cache bank 2 for socket0 CPU die scl#2 */
+			pmul3c2 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x01>;
+			};
+
+			/* L3 cache bank 3 for socket0 CPU die scl#2 */
+			pmul3c3 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x08>;
+			};
+
+			/*
+			 * Miscellaneous node for socket0
+			 * CPU die scl#2
+			 */
+			pmumn0 {
+				compatible = "hisilicon,hisi-pmu-mn-v1";
+				module-id = <0x0b>;
+			};
+		};
+
+		djtag1: djtag@40010000 {
+			compatible = "hisilicon,hisi-djtag-v1";
+			reg = <0x0 0x40010000 0x0 0x10000>;
+			scl-id = <0x01>;
+
+			/* L3 cache bank 0 for socket0 CPU die scl#1 */
+			pmul3c0 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x02>;
+			};
+
+			/* L3 cache bank 1 for socket0 CPU die scl#1 */
+			pmul3c1 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x04>;
+			};
+
+			/* L3 cache bank 2 for socket0 CPU die scl#1 */
+			pmul3c2 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x01>;
+			};
+
+			/* L3 cache bank 3 for socket0 CPU die scl#1 */
+			pmul3c3 {
+				compatible = "hisilicon,hisi-pmu-l3c-v1";
+				module-id = <0x04 0x08>;
+			};
+
+			/*
+			 * Miscellaneous node for socket0
+			 * CPU die scl#1
+			 */
+			pmumn1 {
+				compatible = "hisilicon,hisi-pmu-mn-v1";
+				module-id = <0x0b>;
+			};
+		};
+
 		sas1: sas@a2000000 {
 			compatible = "hisilicon,hip06-sas-v2";
 			reg = <0 0xa2000000 0 0x10000>;
-- 
2.1.4
