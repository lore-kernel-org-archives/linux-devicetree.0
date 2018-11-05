From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 1/3] dt: bindings: add missing dt properties for WCN3990 wifi node
Date: Mon,  5 Nov 2018 18:38:36 +0530
Message-ID: <1541423318-19312-2-git-send-email-govinds@codeaurora.org>
References: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1541423318-19312-1-git-send-email-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add missing optional properties in WCN3990 wifi node.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/net/wireless/qcom,ath10k.txt          | 57 +++++++++++++---------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 7fd4e8c..55d255c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -21,10 +21,22 @@ can be provided per device.
 
 SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-wifi".
 
-Optional properties:
 - reg: Address and length of the register set for the device.
 - reg-names: Must include the list of following reg names,
 	     "membase"
+- interrupts: reference to the list of 17 interrupt numbers for "qcom,ipq4019-wifi"
+	      compatible target.
+	      reference to the list of 12 interrupt numbers for "qcom,wcn3990-wifi"
+	      compatible target.
+	      Must contain interrupt-names property per entry for
+	      "qcom,ath10k", "qcom,ipq4019-wifi" compatible targets.
+
+- interrupt-names: Must include the entries for MSI interrupt
+		   names ("msi0" to "msi15") and legacy interrupt
+		   name ("legacy") for "qcom,ath10k", "qcom,ipq4019-wifi"
+		   compatible targets.
+
+Optional properties:
 - resets: Must contain an entry for each entry in reset-names.
           See ../reset/reseti.txt for details.
 - reset-names: Must include the list of following reset names,
@@ -37,12 +49,9 @@ Optional properties:
 - clocks: List of clock specifiers, must contain an entry for each required
           entry in clock-names.
 - clock-names: Should contain the clock names "wifi_wcss_cmd", "wifi_wcss_ref",
-               "wifi_wcss_rtc".
-- interrupts: List of interrupt lines. Must contain an entry
-	      for each entry in the interrupt-names property.
-- interrupt-names: Must include the entries for MSI interrupt
-		   names ("msi0" to "msi15") and legacy interrupt
-		   name ("legacy"),
+	       "wifi_wcss_rtc" for "qcom,ipq4019-wifi" compatible target and
+	       "cxo_ref_clk_pin" for "qcom,wcn3990-wifi"
+	       compatible target.
 - qcom,msi_addr: MSI interrupt address.
 - qcom,msi_base: Base value to add before writing MSI data into
 		MSI address register.
@@ -55,7 +64,8 @@ Optional properties:
 - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
 				     the length can vary between hw versions.
 - <supply-name>-supply: handle to the regulator device tree node
-			   optional "supply-name" is "vdd-0.8-cx-mx".
+			   optional "supply-name" are "vdd-0.8-cx-mx",
+			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
 
 Example (to supply the calibration data alone):
 
@@ -133,20 +143,23 @@ wifi@18000000 {
 		compatible = "qcom,wcn3990-wifi";
 		reg = <0x18800000 0x800000>;
 		reg-names = "membase";
-		clocks = <&clock_gcc clk_aggre2_noc_clk>;
-		clock-names = "smmu_aggre2_noc_clk"
+		clocks = <&clock_gcc clk_rf_clk2_pin>;
+		clock-names = "cxo_ref_clk_pin";
 		interrupts =
-			   <0 130 0 /* CE0 */ >,
-			   <0 131 0 /* CE1 */ >,
-			   <0 132 0 /* CE2 */ >,
-			   <0 133 0 /* CE3 */ >,
-			   <0 134 0 /* CE4 */ >,
-			   <0 135 0 /* CE5 */ >,
-			   <0 136 0 /* CE6 */ >,
-			   <0 137 0 /* CE7 */ >,
-			   <0 138 0 /* CE8 */ >,
-			   <0 139 0 /* CE9 */ >,
-			   <0 140 0 /* CE10 */ >,
-			   <0 141 0 /* CE11 */ >;
+			<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 		vdd-0.8-cx-mx-supply = <&pm8998_l5>;
+		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
