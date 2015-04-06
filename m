From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v3 1/5] mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
Date: Mon, 6 Apr 2015 16:33:56 -0700
Message-ID: <1428363240-2027-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1428363240-2027-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428363240-2027-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the regulator subnodes to the Qualcomm RPM MFD device tree bindings.

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v2:
- s/notes/nodes from Stephen

 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 217 +++++++++++++++++++--
 1 file changed, 205 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
index 85e3198..f7c22c5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
@@ -31,16 +31,6 @@ frequencies.
 	Value type: <string-array>
 	Definition: must be the three strings "ack", "err" and "wakeup", in order
 
-- #address-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 1
-
-- #size-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 0
-
 - qcom,ipc:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -52,6 +42,188 @@ frequencies.
 		    - u32 representing the ipc bit within the register
 
 
+= SUBNODES
+
+The RPM exposes resources to its subnodes. The below bindings specify the set
+of valid subnodes that can operate on these resources.
+
+== Regulators
+
+Regulator nodes are identified by their compatible:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8058-regulators"
+		    "qcom,rpm-pm8901-regulators"
+		    "qcom,rpm-pm8921-regulators"
+
+- vdd_l0_l1_lvs-supply:
+- vdd_l2_l11_l12-supply:
+- vdd_l3_l4_l5-supply:
+- vdd_l6_l7-supply:
+- vdd_l8-supply:
+- vdd_l9-supply:
+- vdd_l10-supply:
+- vdd_l13_l16-supply:
+- vdd_l14_l15-supply:
+- vdd_l17_l18-supply:
+- vdd_l19_l20-supply:
+- vdd_l21-supply:
+- vdd_l22-supply:
+- vdd_l23_l24_l25-supply:
+- vdd_ncp-supply:
+- vdd_s0-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+	Usage: optional (pm8058 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+- lvs0_in-supply:
+- lvs1_in-supply:
+- lvs2_in-supply:
+- lvs3_in-supply:
+- mvs_in-supply:
+- vdd_l0-supply:
+- vdd_l1-supply:
+- vdd_l2-supply:
+- vdd_l3-supply:
+- vdd_l4-supply:
+- vdd_l5-supply:
+- vdd_l6-supply:
+- vdd_s0-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+	Usage: optional (pm8901 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+- vdd_l1_l2_l12_l18-supply:
+- vdd_l3_l15_l17-supply:
+- vdd_l4_l14-supply:
+- vdd_l5_l8_l16-supply:
+- vdd_l6_l7-supply:
+- vdd_l9_l11-supply:
+- vdd_l10_l22-supply:
+- vdd_l21_l23_l29-supply:
+- vdd_l24-supply:
+- vdd_l25-supply:
+- vdd_l26-supply:
+- vdd_l27-supply:
+- vdd_l28-supply:
+- vdd_ncp-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+- vdd_s7-supply:
+- vdd_s8-supply:
+- vin_5vs-supply:
+- vin_lvs1_3_6-supply:
+- vin_lvs2-supply:
+- vin_lvs4_5_7-supply:
+	Usage: optional (pm8921 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+The regulator node houses sub-nodes for each regulator within the device. Each
+sub-node is identified using the node's name, with valid values listed for each
+of the pmics below.
+
+pm8058:
+	l0, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15,
+	l16, l17, l18, l19, l20, l21, l22, l23, l24, l25, s0, s1, s2, s3, s4,
+	lvs0, lvs1, ncp
+
+pm8901:
+	l0, l1, l2, l3, l4, l5, l6, s0, s1, s2, s3, s4, lvs0, lvs1, lvs2, lvs3,
+	mvs
+
+pm8921:
+	s1, s2, s3, s4, s7, s8, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
+	l12, l14, l15, l16, l17, l18, l21, l22, l23, l24, l25, l26, l27, l28,
+	l29, lvs1, lvs2, lvs3, lvs4, lvs5, lvs6, lvs7, usb-switch, hdmi-switch,
+	ncp
+
+The content of each sub-node is defined by the standard binding for regulators -
+see regulator.txt - with additional custom properties described below:
+
+=== Switch-mode Power Supply regulator custom properties
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <empty>
+	Definition: enable pull down of the regulator when inactive
+
+- qcom,switch-mode-frequency:
+	Usage: required
+	Value type: <u32>
+	Definition: Frequency (Hz) of the switch-mode power supply;
+		    must be one of:
+		    19200000, 9600000, 6400000, 4800000, 3840000, 3200000,
+		    2740000, 2400000, 2130000, 1920000, 1750000, 1600000,
+		    1480000, 1370000, 1280000, 1200000
+
+- qcom,force-mode:
+	Usage: optional (default if no other qcom,force-mode is specified)
+	Value type: <u32>
+	Defintion: indicates that the regulator should be forced to a
+		   particular mode, valid values are:
+		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
+		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
+		   QCOM_RPM_FORCE_MODE_HPM - force into high power mode
+		   QCOM_RPM_FORCE_MODE_AUTO - allow regulator to automatically
+					      select its own mode based on
+					      realtime current draw, only for:
+					      pm8921 smps and ftsmps
+
+- qcom,power-mode-hysteretic:
+	Usage: optional
+	Value type: <empty>
+	Definition: select that the power supply should operate in hysteretic
+		    mode, instead of the default pwm mode
+
+=== Low-dropout regulator custom properties
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <empty>
+	Definition: enable pull down of the regulator when inactive
+
+- qcom,force-mode:
+	Usage: optional
+	Value type: <u32>
+	Defintion: indicates that the regulator should not be forced to any
+		   particular mode, valid values are:
+		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
+		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
+		   QCOM_RPM_FORCE_MODE_HPM - force into high power mode
+		   QCOM_RPM_FORCE_MODE_BYPASS - set regulator to use bypass
+						mode, i.e.  to act as a switch
+						and not regulate, only for:
+						pm8921 pldo, nldo and nldo1200
+
+=== Negative Charge Pump custom properties
+
+- qcom,switch-mode-frequency:
+	Usage: required
+	Value type: <u32>
+	Definition: Frequency (Hz) of the swith mode power supply;
+		    must be one of:
+		    19200000, 9600000, 6400000, 4800000, 3840000, 3200000,
+		    2740000, 2400000, 2130000, 1920000, 1750000, 1600000,
+		    1480000, 1370000, 1280000, 1200000
+
 = EXAMPLE
 
 	#include <dt-bindings/mfd/qcom-rpm.h>
@@ -64,7 +236,28 @@ frequencies.
 		interrupts = <0 19 0>, <0 21 0>, <0 22 0>;
 		interrupt-names = "ack", "err", "wakeup";
 
-		#address-cells = <1>;
-		#size-cells = <0>;
+		regulators {
+			compatible = "qcom,rpm-pm8921-regulators";
+			vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+
+			s1 {
+				regulator-min-microvolt = <1225000>;
+				regulator-max-microvolt = <1225000>;
+
+				bias-pull-down;
+
+				qcom,switch-mode-frequency = <3200000>;
+			};
+
+			pm8921_s4: s4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				qcom,switch-mode-frequency = <1600000>;
+				bias-pull-down;
+
+				qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+			};
+		};
 	};
 
-- 
1.8.2.2
