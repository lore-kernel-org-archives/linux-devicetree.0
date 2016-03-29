From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 7/8] ARM: dts: vf610: add display nodes
Date: Mon, 28 Mar 2016 19:00:01 -0700
Message-ID: <1459216802-32094-8-git-send-email-stefan@agner.ch>
References: <1459216802-32094-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459216802-32094-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, shawnguo@kernel.org, stefan@agner.ch
Cc: kernel@pengutronix.de, airlied@linux.ie, daniel.vetter@ffwll.ch, jianwei.wang.chn@gmail.com, alison.wang@freescale.com, meng.yi@nxp.com, alexander.stein@systec-electronic.com, mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the dcu and tcon nodes to enable the Display Controller Unit
and Timing Controller in Vybrid's SoC level device-tree file.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index a9ceb5b..78e24c6 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -234,6 +234,14 @@
 							<20000000>;
 			};
 
+			tcon0: timing-controller@4003d000 {
+				compatible = "fsl,vf610-tcon";
+				reg = <0x4003d000 0x1000>;
+				clocks = <&clks VF610_CLK_TCON0>;
+				clock-names = "ipg";
+				status = "disabled";
+			};
+
 			wdoga5: wdog@4003e000 {
 				compatible = "fsl,vf610-wdt", "fsl,imx21-wdt";
 				reg = <0x4003e000 0x1000>;
@@ -339,6 +347,17 @@
 				status = "disabled";
 			};
 
+			dcu0: dcu@40058000 {
+				compatible = "fsl,vf610-dcu";
+				reg = <0x40058000 0x1200>;
+				interrupts = <30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_DCU0>,
+					<&clks VF610_CLK_DCU0_DIV>;
+				clock-names = "dcu", "pix";
+				fsl,tcon = <&tcon0>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@40066000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4
