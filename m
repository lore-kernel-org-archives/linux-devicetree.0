From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 4/4] ARM: dts: apq8064: Add SATA controller support.
Date: Wed,  1 Oct 2014 10:06:56 +0100
Message-ID: <1412154416-2870-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1412154355-2639-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412154355-2639-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds AHCI based SATA controller support to APQ8064.
Tested on IFC6410 board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 15 +++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 35 ++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 3e2c777..6856c9d 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -47,6 +47,12 @@
 				qcom,switch-mode-frequency	= <4800000>;
 			};
 
+			pm8921_s4: pm8921-s4 {
+				regulator-min-microvolt		= <1800000>;
+				regulator-max-microvolt		= <1800000>;
+				qcom,switch-mode-frequency	= <3200000>;
+			};
+
 			pm8921_l3: pm8921-l3 {
 				regulator-min-microvolt = <3050000>;
 				regulator-max-microvolt = <3300000>;
@@ -63,6 +69,15 @@
 			};
 		};
 
+		sata_phy0: sata-phy@1b400000{
+			status = "okay";
+		};
+
+		sata0: sata@29000000 {
+			status		= "okay";
+			target-supply	= <&pm8921_s4>;
+		};
+
 		/* OTG */
 		usb1_phy: phy@12500000 {
 			status		= "okay";
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index c251c72..e65aff0 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -566,6 +566,41 @@
 			usb-phy		= <&usb4_phy>;
 		};
 
+		sata_phy0: sata-phy@1b400000{
+			compatible	= "qcom,apq8064-sata-phy";
+			status		= "disabled";
+			reg		= <0x1b400000 0x200>;
+			reg-names	= "phy_mem";
+			clocks		= <&gcc SATA_PHY_CFG_CLK>;
+			clock-names	= "cfg";
+			#phy-cells	= <0>;
+		};
+
+		sata0: sata@29000000 {
+			compatible		= "generic-ahci";
+			status			= "disabled";
+			reg			= <0x29000000 0x180>;
+			interrupts		= <0 209 0>;
+
+			clocks			= <&gcc SFAB_SATA_S_H_CLK>,
+						<&gcc SATA_H_CLK>,
+						<&gcc SATA_A_CLK>,
+						<&gcc SATA_RXOOB_CLK>,
+						<&gcc SATA_PMALIVE_CLK>;
+			clock-names		= "slave_iface",
+						"iface",
+						"bus",
+						"rxoob",
+						"core_pmalive";
+
+			assigned-clocks		= <&gcc SATA_RXOOB_CLK>,
+						<&gcc SATA_PMALIVE_CLK>;
+			assigned-clock-rates	= <100000000>, <100000000>;
+
+			phys			= <&sata_phy0>;
+			phy-names		= "sata-phy";
+		};
+
 		/* Temporary fixed regulator */
 		vsdcc_fixed: vsdcc-regulator {
 			compatible = "regulator-fixed";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
