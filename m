From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 3/4] ARM: DT: STiH407: Add node for i2c12 controller
Date: Fri, 25 Mar 2016 15:36:27 +0000
Message-ID: <1458920188-29612-4-git-send-email-peter.griffin@linaro.org>
References: <1458920188-29612-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458920188-29612-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT support for SSC12.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 81f8121..7785f31 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -327,6 +327,19 @@
 			status = "disabled";
 		};
 
+		i2c@9542000 {
+			compatible = "st,comms-ssc4-i2c";
+			reg = <0x9542000 0x110>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_sysin>;
+			clock-names = "ssc";
+			clock-frequency = <400000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_i2c12_default>;
+
+			status = "disabled";
+		};
+
 		usb2_picophy0: phy1 {
 			compatible = "st,stih407-usb2-phy";
 			#phy-cells = <0>;
-- 
1.9.1
