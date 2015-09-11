From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 11/11] ARM: STi: STiH407: Add spi default pinctrl groups.
Date: Fri, 11 Sep 2015 18:06:34 +0100
Message-ID: <1441991194-11948-12-git-send-email-peter.griffin@linaro.org>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441991194-11948-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now we have default pinconfig groups for each SPI
controller ensure it is used by the SPI controller
node.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 838b812..94a2fec 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -381,6 +381,8 @@
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi1_default>;
 
 			status = "disabled";
 		};
@@ -391,6 +393,8 @@
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi2_default>;
 
 			status = "disabled";
 		};
@@ -401,6 +405,8 @@
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi3_default>;
 
 			status = "disabled";
 		};
@@ -411,6 +417,8 @@
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi4_default>;
 
 			status = "disabled";
 		};
@@ -422,6 +430,8 @@
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_sysin>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi10_default>;
 
 			status = "disabled";
 		};
@@ -432,6 +442,8 @@
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_sysin>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi11_default>;
 
 			status = "disabled";
 		};
@@ -442,6 +454,8 @@
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_sysin>;
 			clock-names = "ssc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi12_default>;
 
 			status = "disabled";
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
