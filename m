From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] arm64: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 17:53:52 +0100
Message-ID: <20171214165352.27902-1-malat@debian.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mathieu Malaterre <malat@debian.org>, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" {} +

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi          | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3aee6123d161..3f5ff76109be 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -51,7 +51,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		ramoops@0x21f00000 {
+		ramoops@21f00000 {
 			compatible = "ramoops";
 			reg = <0x0 0x21f00000 0x0 0x00100000>;
 			record-size	= <0x00020000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 26396ef53bde..0446b122a6e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -249,7 +249,7 @@
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
-		pio: pinctrl@0x10005000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8173-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 492a011f14f6..1c8f1b86472d 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -140,16 +140,16 @@
 		};
 
 		agnoc@0 {
-			qcom,pcie@00600000 {
+			qcom,pcie@600000 {
 				perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
 			};
 
-			qcom,pcie@00608000 {
+			qcom,pcie@608000 {
 				status = "okay";
 				perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
 			};
 
-			qcom,pcie@00610000 {
+			qcom,pcie@610000 {
 				status = "okay";
 				perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4b2afcc4fdf4..0a6f7952bbb1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -840,7 +840,7 @@
 			#size-cells = <1>;
 			ranges;
 
-			pcie0: qcom,pcie@00600000 {
+			pcie0: qcom,pcie@600000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				status = "disabled";
 				power-domains = <&gcc PCIE0_GDSC>;
@@ -893,7 +893,7 @@
 
 			};
 
-			pcie1: qcom,pcie@00608000 {
+			pcie1: qcom,pcie@608000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				power-domains = <&gcc PCIE1_GDSC>;
 				bus-range = <0x00 0xff>;
@@ -946,7 +946,7 @@
 						"bus_slave";
 			};
 
-			pcie2: qcom,pcie@00610000 {
+			pcie2: qcom,pcie@610000 {
 				compatible = "qcom,pcie-msm8996", "snps,dw-pcie";
 				power-domains = <&gcc PCIE2_GDSC>;
 				bus-range = <0x00 0xff>;
-- 
2.11.0
