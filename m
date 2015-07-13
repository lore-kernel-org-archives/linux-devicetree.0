From: Tim Bird <tim.bird@sonymobile.com>
Subject: [PATCH 3/3] ARM: dts: qcom: Add dts changes for qcom coincell charger
Date: Mon, 13 Jul 2015 16:39:32 -0700
Message-ID: <1436830772-32632-3-git-send-email-tim.bird@sonymobile.com>
References: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, bjorn.andersson@sonymobile.com, Tim Bird <tim.bird@sonymobile.com>
List-Id: devicetree@vger.kernel.org

Add framework for the coincell charger DT block in pm8941 file, and
actual values for honami battery in the honami dts file.

Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
---
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts | 11 +++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                    |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index bd35b06..a7440fd 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -17,3 +17,14 @@
 		status = "ok";
 	};
 };
+
+&spmi_bus {
+	pm8941@0 {
+		qcom,coincell@2800 {
+			status = "ok";
+			qcom,rset-ohms = <2100>;
+			qcom,vset-millivolts = <3000>;
+			qcom,charge-enable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index aa774e6..a7d9c4b 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -125,6 +125,12 @@
 			interrupts = <0x0 0x36 0x0 IRQ_TYPE_EDGE_RISING>;
 			qcom,external-resistor-micro-ohms = <10000>;
 		};
+
+		qcom,coincell@2800 {
+			compatible = "qcom,pm8941-coincell";
+			reg = <0x2800>;
+			status = "disabled";
+		};
 	};
 
 	usid1: pm8941@1 {
-- 
1.8.2.2
