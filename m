From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv4 2/3] ARM: dts: vf610: Add Freescale FlexTimer Module timer node.
Date: Mon, 19 May 2014 17:36:07 +0800
Message-ID: <1400492168-12813-3-git-send-email-Li.Xiubo@freescale.com>
References: <1400492168-12813-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400492168-12813-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, shawn.guo@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Xiubo Li <Li.Xiubo@freescale.com>, Jingchang Lu <b35083@freescale.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Jingchang Lu <b35083@freescale.com>
---
 arch/arm/boot/dts/vf610.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index 107e2c0..6ab65fa 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -281,6 +281,19 @@
 				status = "disabled";
 			};
 
+			ftm: ftm@400b8000 {
+				compatible = "fsl,ftm-timer";
+				reg = <0x400b8000 0x1000 0x400b9000 0x1000>;
+				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "ftm-evt", "ftm-src",
+					"ftm-evt-counter-en", "ftm-src-counter-en";
+				clocks = <&clks VF610_CLK_FTM2>,
+					<&clks VF610_CLK_FTM3>,
+					<&clks VF610_CLK_FTM2_EXT_FIX_EN>,
+					<&clks VF610_CLK_FTM3_EXT_FIX_EN>;
+				status = "disabled";
+			};
+
 			fec0: ethernet@400d0000 {
 				compatible = "fsl,mvf600-fec";
 				reg = <0x400d0000 0x1000>;
-- 
1.8.4
