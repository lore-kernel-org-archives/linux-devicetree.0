From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 09/12] ARM: qcom: Add DT alias for serial port
Date: Mon, 23 Feb 2015 07:55:59 +0000
Message-ID: <1424678159-13308-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pramod Gurav <pramod.gurav@smartplayin.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Gurav <pramod.gurav@smartplayin.com>

Define an alias for serial port present on ifc6410 which is used as
console.

Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 4 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 3164197..7a6a076 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -5,6 +5,10 @@
 	model = "Qualcomm APQ8064/IFC6410";
 	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
 
+	aliases {
+		serial0 = &serial0;
+	};
+
 	soc {
 		pinctrl@800000 {
 			i2c1_pins: i2c1 {
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 9c2e9b2..63edafc 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -232,7 +232,7 @@
 			#size-cells = <1>;
 			ranges;
 
-			serial@16640000 {
+			serial0: serial@16640000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x16640000 0x1000>,
 				      <0x16600000 0x1000>;
-- 
1.9.1
