Return-Path: <SRS0=cesA=OC=linaro.org=loic.poulain@kernel.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: watchdog: Add Qualcomm PM8916 watchdog
Date: Fri, 23 Nov 2018 09:44:37 +0100
Message-Id: <1542962678-13697-2-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1542962678-13697-1-git-send-email-loic.poulain@linaro.org>
References: <1542962678-13697-1-git-send-email-loic.poulain@linaro.org>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, andy.gross@linaro.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Document support for the Watchdog Timer (WDT) Controller in the
Qualcomm PM8916 PMIC module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: Add interrupts and timeout-sec props
 v3: Reword props summary

 .../bindings/watchdog/qcom,pm8916-wdt.txt          | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.txt
new file mode 100644
index 0000000..6fb984f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.txt
@@ -0,0 +1,28 @@
+QCOM PM8916 watchdog timer controller
+
+This pm8916 watchdog timer controller must be under pm8916-pon node.
+
+Required properties:
+- compatible: should be "qcom,pm8916-wdt"
+
+Optional properties :
+- interrupts : Watchdog pre-timeout (bark) interrupt.
+- timeout-sec : Watchdog timeout value in seconds.
+
+Example:
+
+	pm8916_0: pm8916@0 {
+		compatible = "qcom,pm8916", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
+			reg = <0x800>;
+
+			watchdog {
+				compatible = "qcom,pm8916-wdt";
+				interrupts = <0x0 0x8 6 IRQ_TYPE_EDGE_RISING>;
+				timeout-sec = <10>;
+			};
+		};
+	};
-- 
2.7.4
