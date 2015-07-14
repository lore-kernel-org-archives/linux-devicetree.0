From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH v2 3/3] ARM: dts: qcom: Add dts changes for qcom coincell charger
Date: Tue, 14 Jul 2015 16:26:20 -0700
Message-ID: <1436916380-3599-3-git-send-email-tim.bird@sonymobile.com>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, bjorn.andersson@sonymobile.com
List-Id: devicetree@vger.kernel.org

Add framework for the coincell charger DT block in pm8941 file, and
actual values for honami battery in the honami dts file.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---

Changes in v2:
 - change coincell node name to remove 'qcom,' prefix

 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts | 11 +++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                    |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index bd35b06..3705f34 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -17,3 +17,14 @@
 		status = "ok";
 	};
 };
+
+&spmi_bus {
+	pm8941@0 {
+		coincell@2800 {
+			status = "ok";
+			qcom,rset-ohms = <2100>;
+			qcom,vset-millivolts = <3000>;
+			qcom,charge-enable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index aa774e6..968f104 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -125,6 +125,12 @@
 			interrupts = <0x0 0x36 0x0 IRQ_TYPE_EDGE_RISING>;
 			qcom,external-resistor-micro-ohms = <10000>;
 		};
+
+		coincell@2800 {
+			compatible = "qcom,pm8941-coincell";
+			reg = <0x2800>;
+			status = "disabled";
+		};
 	};
 
 	usid1: pm8941@1 {
-- 
1.8.2.2
