From: Tai Nguyen <ttnguyen@apm.com>
Subject: [PATCH v9 4/4] arm64: dts: apm: Add APM X-Gene SoC PMU DTS entries
Date: Thu, 14 Jul 2016 10:27:46 -0700
Message-ID: <1468517266-1642-5-git-send-email-ttnguyen@apm.com>
References: <1468517266-1642-1-git-send-email-ttnguyen@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468517266-1642-1-git-send-email-ttnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, joe@perches.com, paul.gortmaker@windriver.com
Cc: dhdang@apm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@apm.com, Tai Nguyen <ttnguyen@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC PMU DTS entries.

Signed-off-by: Tai Nguyen <ttnguyen@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 5147d76..1d57820 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -572,6 +572,64 @@
 			};
 		};
 
+		pmu: pmu@78810000 {
+			compatible = "apm,xgene-pmu-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			regmap-csw = <&csw>;
+			regmap-mcba = <&mcba>;
+			regmap-mcbb = <&mcbb>;
+			reg = <0x0 0x78810000 0x0 0x1000>;
+			interrupts = <0x0 0x22 0x4>;
+
+			pmul3c@7e610000 {
+				compatible = "apm,xgene-pmu-l3c";
+				reg = <0x0 0x7e610000 0x0 0x1000>;
+			};
+
+			pmuiob@7e940000 {
+				compatible = "apm,xgene-pmu-iob";
+				reg = <0x0 0x7e940000 0x0 0x1000>;
+			};
+
+			pmucmcb@7e710000 {
+				compatible = "apm,xgene-pmu-mcb";
+				reg = <0x0 0x7e710000 0x0 0x1000>;
+				enable-bit-index = <0>;
+			};
+
+			pmucmcb@7e730000 {
+				compatible = "apm,xgene-pmu-mcb";
+				reg = <0x0 0x7e730000 0x0 0x1000>;
+				enable-bit-index = <1>;
+			};
+
+			pmucmc@7e810000 {
+				compatible = "apm,xgene-pmu-mc";
+				reg = <0x0 0x7e810000 0x0 0x1000>;
+				enable-bit-index = <0>;
+			};
+
+			pmucmc@7e850000 {
+				compatible = "apm,xgene-pmu-mc";
+				reg = <0x0 0x7e850000 0x0 0x1000>;
+				enable-bit-index = <1>;
+			};
+
+			pmucmc@7e890000 {
+				compatible = "apm,xgene-pmu-mc";
+				reg = <0x0 0x7e890000 0x0 0x1000>;
+				enable-bit-index = <2>;
+			};
+
+			pmucmc@7e8d0000 {
+				compatible = "apm,xgene-pmu-mc";
+				reg = <0x0 0x7e8d0000 0x0 0x1000>;
+				enable-bit-index = <3>;
+			};
+		};
+
 		pcie0: pcie@1f2b0000 {
 			status = "disabled";
 			device_type = "pci";
-- 
1.9.1
