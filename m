From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v1 3/6] arm64: dts: hisilicon: Add Mali-450 MP4 GPU DT entry
Date: Mon, 18 Mar 2019 19:38:48 +0000
Message-ID: <1552937931-23050-4-git-send-email-peter.griffin@linaro.org>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

hi6220 has a Mali450 MP4 so lets add it into the DT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 108e2a4..2072b63 100644
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
2.7.4
