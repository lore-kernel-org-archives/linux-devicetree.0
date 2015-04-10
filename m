From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 11/11] ARM: dts: apq8064: add i2c3 node for panel.
Date: Fri, 10 Apr 2015 21:44:48 +0100
Message-ID: <1428698688-12366-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428698491-11881-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428698491-11881-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds i2c3 node which is used for panel control on IFC6410.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 10 ++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 27 +++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index f97339a..a7c939b 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -87,6 +87,16 @@
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c3: i2c@16280000 {
+				status = "okay";
+				pinctrl-0 = <&i2c3_pins>;
+				pinctrl-names = "default";
+			};
+		};
+
 		gsbi@12440000 {
 			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 345ea08..df2061e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -120,6 +120,13 @@
 					function = "gsbi1";
 				};
 			};
+
+			i2c3_pins: i2c3 {
+				mux {
+					pins = "gpio8", "gpio9";
+					function = "gsbi3";
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
@@ -233,6 +240,26 @@
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			status = "disabled";
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16200000 0x100>;
+			clocks = <&gcc GSBI3_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			i2c3: i2c@16280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16280000 0x1000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_NONE>;
+				clocks = <&gcc GSBI3_QUP_CLK>,
+					 <&gcc GSBI3_H_CLK>;
+				clock-names = "core", "iface";
+			};
+		};
+
 		gsbi7: gsbi@16600000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
