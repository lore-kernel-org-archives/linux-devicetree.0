From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/3] ARM: dts: qcom: Add SPMI PMIC Arbiter nodes for APQ8084 and MSM8974
Date: Tue, 17 Mar 2015 12:48:33 +0200
Message-ID: <1426589315-16847-2-git-send-email-iivanov@mm-sol.com>
References: <1426589315-16847-1-git-send-email-iivanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426589315-16847-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add SPMI PMIC Arbiter configuration nodes for APQ8084 and MSM8974.

Reviewed-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Reviewed-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 1f130bc..dbedf64 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -226,5 +226,21 @@
 			clock-names = "core", "iface";
 			status = "disabled";
 		};
+
+		spmi_bus: spmi@fc4cf000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg-names = "core", "intr", "cnfg";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			interrupt-names = "periph_irq";
+			interrupts = <0 190 0>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index e265ec1..2d11641 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -247,5 +247,21 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		spmi_bus: spmi@fc4cf000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg-names = "core", "intr", "cnfg";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			interrupt-names = "periph_irq";
+			interrupts = <0 190 0>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
 	};
 };
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
