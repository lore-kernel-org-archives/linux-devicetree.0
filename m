From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: enable ADC on stm32f429i-eval board
Date: Fri, 2 Dec 2016 14:57:02 +0100
Message-ID: <1480687022-12851-4-git-send-email-fabrice.gasnier@st.com>
References: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable analog to digital converter on stm32f429i-eval board.
It has on-board potentimeter wired to ADC3 in8 analog pin and
uses fixed regulator to provide reference voltage.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 13c7cd2..6be0a24 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -65,6 +65,20 @@
 		serial0 = &usart1;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_vref: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vref";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		green {
@@ -123,3 +137,14 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc3_in8_pin>;
+	vref-supply = <&reg_vref>;
+	status = "okay";
+	adc3: adc@200 {
+		st,adc-channels = <8>;
+		status = "okay";
+	};
+};
-- 
1.9.1
