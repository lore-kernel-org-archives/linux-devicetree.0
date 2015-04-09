From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 05/10] ARM: dts: apq8064: Add MDP support
Date: Thu,  9 Apr 2015 09:23:17 +0100
Message-ID: <1428567797-10935-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428567674-10672-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, inux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds MDP node to APQ8064 dt.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 105 ++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index ea0145f..70e417f 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include "skeleton.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
@@ -108,6 +109,20 @@
 				};
 			};
 
+			hdmi_pinctrl: hdmi-pinctrl {
+				mux1 {
+					pins = "gpio69", "gpio70", "gpio71";
+					function = "hdmi";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+				mux2 {
+					pins = "gpio72";
+					function = "hdmi";
+					bias-pull-down;
+					drive-strength = <16>;
+				};
+			};
 			ps_hold: ps_hold {
 				mux {
 					pins = "gpio78";
@@ -251,6 +266,18 @@
 			};
 		};
 
+		ext_3p3v: regulator-fixed@1 {
+			compatible = "regulator-fixed";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-name = "ext_3p3v";
+			regulator-type = "voltage";
+			startup-delay-us = <0>;
+			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
 		qcom,ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
@@ -770,5 +797,83 @@
 			compatible = "qcom,tcsr-apq8064", "syscon";
 			reg = <0x1a400000 0x100>;
 		};
+
+		hdmi: qcom,hdmi-tx@4a00000 {
+			compatible = "qcom,hdmi-tx-8960";
+			reg-names = "core_physical";
+			reg = <0x04a00000 0x1000>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_NONE>;
+			clock-names =
+			    "core_clk",
+			    "master_iface_clk",
+			    "slave_iface_clk";
+			clocks =
+			    <&mmcc HDMI_APP_CLK>,
+			    <&mmcc HDMI_M_AHB_CLK>,
+			    <&mmcc HDMI_S_AHB_CLK>;
+			qcom,hdmi-tx-ddc-clk = <&tlmm_pinmux 70
+						GPIO_ACTIVE_HIGH>;
+			qcom,hdmi-tx-ddc-data = <&tlmm_pinmux 71
+						GPIO_ACTIVE_HIGH>;
+			qcom,hdmi-tx-hpd = <&tlmm_pinmux 72
+						GPIO_ACTIVE_HIGH>;
+			core-vdda-supply = <&pm8921_hdmi_switch>;
+			hdmi-mux-supply = <&ext_3p3v>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pinctrl>;
+		};
+
+		gpu: qcom,adreno-3xx@4300000 {
+			compatible = "qcom,adreno-3xx";
+			reg = <0x04300000 0x20000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 80 IRQ_TYPE_NONE>;
+			interrupt-names = "kgsl_3d0_irq";
+			clock-names =
+			    "core_clk",
+			    "iface_clk",
+			    "mem_clk",
+			    "mem_iface_clk";
+			clocks =
+			    <&mmcc GFX3D_CLK>,
+			    <&mmcc GFX3D_AHB_CLK>,
+			    <&mmcc GFX3D_AXI_CLK>,
+			    <&mmcc MMSS_IMEM_AHB_CLK>;
+			qcom,chipid = <0x03020002>;
+			qcom,gpu-pwrlevels {
+				compatible = "qcom,gpu-pwrlevels";
+				qcom,gpu-pwrlevel@0 {
+					qcom,gpu-freq = <450000000>;
+				};
+				qcom,gpu-pwrlevel@1 {
+					qcom,gpu-freq = <27000000>;
+				};
+			};
+		};
+
+		mdp: qcom,mdp@5100000 {
+			compatible = "qcom,mdp";
+			reg = <0x05100000 0xf0000>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_NONE>;
+			connectors = <&hdmi>;
+			gpus = <&gpu>;
+			clock-names =
+			    "core_clk",
+			    "iface_clk",
+			    "lut_clk",
+			    "src_clk",
+			    "hdmi_clk",
+			    "mdp_clk",
+			    "mdp_axi_clk";
+			clocks =
+			    <&mmcc MDP_CLK>,
+			    <&mmcc MDP_AHB_CLK>,
+			    <&mmcc MDP_LUT_CLK>,
+			    <&mmcc TV_SRC>,
+			    <&mmcc HDMI_TV_CLK>,
+			    <&mmcc MDP_TV_CLK>,
+			    <&mmcc MDP_AXI_CLK>;
+//			vdd-supply = <&footswitch_mdp>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
