From: Anurup M <anurupvasu@gmail.com>
Subject: [PATCH v5 11/11] dts: arm64: hip07: Add Hisilicon SoC PMU support
Date: Thu,  2 Mar 2017 05:50:09 -0500
Message-ID: <1488451809-89120-1-git-send-email-anurup.m@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mark.rutland@arm.com, will.deacon@arm.com, robh+dt@kernel.org, xuwei5@hisilicon.com, catalin.marinas@arm.com
Cc: dikshit.n@huawei.com, devicetree@vger.kernel.org, anurupvasu@gmail.com, gabriele.paoloni@huawei.com, huangdaode@hisilicon.com, john.garry@huawei.com, shyju.pv@huawei.com, linux-kernel@vger.kernel.org, linuxarm@huawei.com, zhangshaokun@hisilicon.com, sanil.kumar@hisilicon.com, linux-arm-kernel@lists.infradead.org, shiju.jose@huawei.com, tanxiaojun@huawei.com, anurup.m@huawei.com
List-Id: devicetree@vger.kernel.org

Add nodes for djtag, L3 cache and MN to support uncore events.

Signed-off-by: Anurup M <anurup.m@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 79 ++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index dcd1117..70d9c93 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1083,4 +1083,83 @@
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
+			hisilicon,module-id = <0x01 0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#3 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02 0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#3 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03 0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#3 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04 0x01>;
+		};
+
+		/*
+		 * Miscellaneous node for socket0
+		 * CPU die scl#2
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
+			hisilicon,module-id = <0x01 0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#1 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02 0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#1 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03 0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#1 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04 0x01>;
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
