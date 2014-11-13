From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 14/14] ARM: STi: DT: STiH410: Add DT nodes for the ehci and ohci usb controllers.
Date: Thu, 13 Nov 2014 11:00:17 +0000
Message-ID: <1415876417-28728-15-git-send-email-peter.griffin@linaro.org>
References: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the DT nodes for the extra ehci and ohci usb controllers
on the stih410 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih410.dtsi | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/stih410.dtsi b/arch/arm/boot/dts/stih410.dtsi
index 5ade3ed..3da08e5 100644
--- a/arch/arm/boot/dts/stih410.dtsi
+++ b/arch/arm/boot/dts/stih410.dtsi
@@ -34,5 +34,57 @@
 				 <&picophyreset STIH407_PICOPHY1_RESET>;
 			reset-names = "global", "port";
 		};
+
+		ohci0: usb@9a03c00 {
+			compatible = "st,st-ohci-300x";
+			reg = <0x9a03c00 0x100>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_NONE>;
+			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
+			resets = <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
+				 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
+			reset-names = "power", "softreset";
+			phys = <&usb2_picophy0>;
+			phy-names = "usb";
+		};
+
+		ehci0: usb@9a03e00 {
+			compatible = "st,st-ehci-300x";
+			reg = <0x9a03e00 0x100>;
+			interrupts = <GIC_SPI 151 IRQ_TYPE_NONE>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb0>;
+			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
+			resets = <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
+				 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
+			reset-names = "power", "softreset";
+			phys = <&usb2_picophy0>;
+			phy-names = "usb";
+		};
+
+		ohci1: usb@9a83c00 {
+			compatible = "st,st-ohci-300x";
+			reg = <0x9a83c00 0x100>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_NONE>;
+			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
+			resets = <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
+				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
+			reset-names = "power", "softreset";
+			phys = <&usb2_picophy1>;
+			phy-names = "usb";
+		};
+
+		ehci1: usb@9a83e00 {
+			compatible = "st,st-ehci-300x";
+			reg = <0x9a83e00 0x100>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_NONE>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb1>;
+			clocks = <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
+			resets = <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
+				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
+			reset-names = "power", "softreset";
+			phys = <&usb2_picophy1>;
+			phy-names = "usb";
+		};
 	};
 };
-- 
1.9.1
