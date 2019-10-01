From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] arm64: dts: hisilicon: Add Mali-450 MP4 GPU DT entry
Date: Tue,  1 Oct 2019 18:35:35 +0000
Message-ID: <20191001183535.70835-1-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Peter Griffin <peter.griffin@linaro.org>

hi6220 has a Mali450 MP4 so lets add it into the DT.

Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 108e2a4227f6..2072b637b5af 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -260,6 +260,7 @@
 			compatible = "hisilicon,hi6220-aoctrl", "syscon";
 			reg = <0x0 0xf7800000 0x0 0x2000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		sys_ctrl: sys_ctrl@f7030000 {
@@ -1021,6 +1022,43 @@
 			clock-names = "apb_pclk";
 			cpu = <&cpu7>;
 		};
+
+		mali: gpu@f4080000 {
+			compatible = "hisilicon,hi6220-mali", "arm,mali-450";
+			reg = <0x0 0xf4080000 0x0 0x00040000>;
+			interrupt-parent = <&gic>;
+			interrupts =	<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_PPI 126 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "gp",
+					  "gpmmu",
+					  "pp",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1",
+					  "pp2",
+					  "ppmmu2",
+					  "pp3",
+					  "ppmmu3";
+			clocks = <&media_ctrl HI6220_G3D_CLK>,
+				 <&media_ctrl HI6220_G3D_PCLK>;
+			clock-names = "core", "bus";
+			assigned-clocks = <&media_ctrl HI6220_G3D_CLK>,
+					  <&media_ctrl HI6220_G3D_PCLK>;
+			assigned-clock-rates = <500000000>, <144000000>;
+			reset-names = "ao_g3d", "media_g3d";
+			resets = <&ao_ctrl AO_G3D>, <&media_ctrl MEDIA_G3D>;
+		};
 	};
 };
 
-- 
2.17.1
