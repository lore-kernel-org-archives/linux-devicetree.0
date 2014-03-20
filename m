From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 1/3] ARM: dts: vf610: Add Freescale FTM PWM node.
Date: Thu, 20 Mar 2014 13:12:03 +0800
Message-ID: <1395292325-8497-2-git-send-email-Li.Xiubo@freescale.com>
References: <1395292325-8497-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395292325-8497-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

This adds devicetree node for VF610, and there are 8 channels
supported.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Yuan Yao <yao.yuan@freescale.com>
---
 arch/arm/boot/dts/vf610.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index acf544e..ccc6d35 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -192,6 +192,19 @@
 				status = "disabled";
 			};
 
+			pwm0: pwm@40038000 {
+				compatible = "fsl,vf610-ftm-pwm";
+				#pwm-cells = <3>;
+				reg = <0x40038000 0x1000>;
+				clock-names = "ftm_sys", "ftm_ext",
+					      "ftm_fix", "ftm_cnt_clk_en";
+				clocks = <&clks VF610_CLK_FTM0>,
+					<&clks VF610_CLK_FTM0_EXT_SEL>,
+					<&clks VF610_CLK_FTM0_FIX_SEL>,
+					<&clks VF610_CLK_FTM0_EXT_FIX_EN>;
+				status = "disabled";
+			};
+
 			wdog@4003e000 {
 				compatible = "fsl,vf610-wdt", "fsl,imx21-wdt";
 				reg = <0x4003e000 0x1000>;
-- 
1.8.4
