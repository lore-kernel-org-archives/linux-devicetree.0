From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: qcom: Add PM8941 and PM8841 pinctrl nodes
Date: Mon,  7 Jul 2014 18:11:33 +0300
Message-ID: <1404745893-6379-5-git-send-email-iivanov@mm-sol.com>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404745893-6379-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>

Add nodes for PM8941 and PM8841 GPIO and MPP subfunctions.

Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index c7ae7ba..7daca4b 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -267,6 +267,14 @@
 					reg-names = "rtc", "alarm";
 					interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 				};
+
+				pm8941_pinctrl: pins@a000 {
+					compatible = "qcom,pm8941-pinctrl";
+					reg = <0xa000>, <0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					label = "pm8941-pinctrl";
+				};
 			};
 
 			usid1: pm8941@1 {
@@ -281,6 +289,14 @@
 				reg = <0x4 SPMI_USID>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				pm8841_pinctrl: pins@a000 {
+					compatible = "qcom,pm8841-pinctrl";
+					reg = <0xa000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					label = "pm8841-pinctrl";
+				};
 			};
 
 			usid5: pm8841@5 {
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
