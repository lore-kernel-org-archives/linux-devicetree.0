From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 1/7] ARM: dts: qcom: Add PM8841 functions device nodes
Date: Wed,  1 Apr 2015 18:05:09 +0300
Message-ID: <1427900715-26273-2-git-send-email-ivan.ivanov@linaro.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add configuration nodes for multi purpose pins and
thermal sensor devices. Thermal sensor will report
PMIC die temperature.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8841.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom-pm8841.dtsi
index 73813cc..5c109bd 100644
--- a/arch/arm/boot/dts/qcom-pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
@@ -7,6 +7,20 @@
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8841_mpps: mpps@a000 {
+			compatible = "qcom,pm8841-mpp";
+			reg = <0xa000 0x400>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
+		};
+
+		temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400 0x100>;
+			interrupts = <4 0x24 0 IRQ_TYPE_EDGE_RISING>;
+		};
 	};

 	usid5: pm8841@5 {
--
1.9.1
