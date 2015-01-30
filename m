From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
Date: Thu, 29 Jan 2015 17:51:06 -0800
Message-ID: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>
Cc: srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add the regulator subnodes to the Qualcomm RPM MFD device tree bindings.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
After discussing this back and forth we've concluded that we should be
future compatible with these bindings, so let's make an attempt to make
it possible to use the Qualcomm family A regulators.

 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
index 85e3198..816acda 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
@@ -52,6 +52,177 @@ frequencies.
 		    - u32 representing the ipc bit within the register
 
 
+= SUBDEVICES
+
+The RPM exposes resources to its subnodes. The below bindings specify the set
+of valid subnodes that can operate on these resources.
+
+== Switch-mode Power Supply regulator
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8058-smps"
+		    "qcom,rpm-pm8901-ftsmps"
+		    "qcom,rpm-pm8921-smps"
+		    "qcom,rpm-pm8921-ftsmps"
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: resource as defined in <dt-bindings/mfd/qcom-rpm.h>
+		    must be one of:
+		    QCOM_RPM_PM8058_SMPS0 - QCOM_RPM_PM8058_SMPS4,
+		    QCOM_RPM_PM8821_SMPS1 - QCOM_RPM_PM8821_SMPS2,
+		    QCOM_RPM_PM8901_SMPS0 - QCOM_RPM_PM8901_SMPS4,
+		    QCOM_RPM_PM8921_SMPS1 - QCOM_RPM_PM8921_SMPS8
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
+	Definition: indicates that the regulator should be forced to a
+		    particular mode, valid values are:
+		    QCOM_RPM_FORCE_MODE_NONE - do not force any mode
+		    QCOM_RPM_FORCE_MODE_LPM - force into low power mode
+		    QCOM_RPM_FORCE_MODE_HPM - force into high power mode
+		    QCOM_RPM_FORCE_MODE_AUTO - allow regulator to automatically
+					       select its own mode based on
+					       realtime current draw, only for:
+					       qcom,rpm-pm8921-smps,
+					       qcom,rpm-pm8921-ftsmps
+
+- qcom,power-mode-hysteretic:
+	Usage: optional
+	Value type: <empty>
+	Definition: select that the power supply should operate in hysteretic
+		    mode, instead of the default pwm mode
+
+Standard regulator bindings are used inside switch mode power supply subnodes.
+Check Documentation/devicetree/bindings/regulator/regulator.txt for more
+details.
+
+== Low-dropout regulator
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8058-pldo"
+		    "qcom,rpm-pm8058-nldo"
+		    "qcom,rpm-pm8901-pldo"
+		    "qcom,rpm-pm8901-nldo"
+		    "qcom,rpm-pm8921-pldo"
+		    "qcom,rpm-pm8921-nldo"
+		    "qcom,rpm-pm8921-nldo1200"
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: resource as defined in <dt-bindings/mfd/qcom-rpm.h>
+		    must be one of:
+		    QCOM_RPM_PM8058_LDO0 - QCOM_RPM_PM8058_LDO25,
+		    QCOM_RPM_PM8821_LDO1,
+		    QCOM_RPM_PM8901_LDO0 - QCOM_RPM_PM8901_LDO6,
+		    QCOM_RPM_PM8921_LDO1 - QCOM_RPM_PM8921_LDO29
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <empty>
+	Definition: enable pull down of the regulator when inactive
+
+- qcom,force-mode:
+	Usage: optional
+	Value type: <u32>
+	Definition: indicates that the regulator should not be forced to any
+		    particular mode, valid values are:
+		    QCOM_RPM_FORCE_MODE_NONE - do not force any mode
+		    QCOM_RPM_FORCE_MODE_LPM - force into low power mode
+		    QCOM_RPM_FORCE_MODE_HPM - force into high power mode
+		    QCOM_RPM_FORCE_MODE_BYPASS - set regulator to use bypass
+						 mode, i.e.  to act as a switch
+						 and not regulate, only for:
+						 qcom,rpm-pm8921-pldo,
+						 qcom,rpm-pm8921-nldo,
+						 qcom,rpm-pm8921-nldo1200
+
+Standard regulator bindings are used inside switch low-dropout regulator
+subnodes.  Check Documentation/devicetree/bindings/regulator/regulator.txt for
+more details.
+
+== Negative Charge Pump
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8058-ncp"
+		    "qcom,rpm-pm8921-ncp"
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: resource as defined in <dt-bindings/mfd/qcom-rpm.h>
+		    must be one of:
+		    QCOM_RPM_PM8058_NCP,
+		    QCOM_RPM_PM8921_NCP
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
+Standard regulator bindings are used inside negative charge pump regulator
+subnodes.  Check Documentation/devicetree/bindings/regulator/regulator.txt for
+more details.
+
+== Switch
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,rpm-pm8058-switch"
+		    "qcom,rpm-pm8901-switch"
+		    "qcom,rpm-pm8921-switch"
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: resource as defined in <dt-bindings/mfd/qcom/qcom-rpm.h>
+		    must be one of:
+		    QCOM_RPM_PM8058_LVS0 - QCOM_RPM_PM8058_LVS1,
+		    QCOM_RPM_PM8901_LVS0 - QCOM_RPM_PM8901_LVS3,
+		    QCOM_RPM_PM8901_MVS,
+		    QCOM_RPM_PM8921_LVS1 - QCOM_RPM_PM8921_LVS7,
+		    QCOM_RPM_PM8921_MVS
+
+== Common properties for SMPS, LDO, NCP and switch regulators subnodes
+
+- vin-supply:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: phandle of a regulator supplying this regulator
+
+
 = EXAMPLE
 
 	#include <dt-bindings/mfd/qcom-rpm.h>
@@ -66,5 +237,18 @@ frequencies.
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8921_smps1: pm8921-smps1 {
+			compatible = "qcom,rpm-pm8921-smps";
+			reg = <QCOM_RPM_PM8921_SMPS1>;
+
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			regulator-always-on;
+
+			bias-pull-down;
+
+			qcom,switch-mode-frequency = <3200000>;
+		};
 	};
 
-- 
1.9.1
