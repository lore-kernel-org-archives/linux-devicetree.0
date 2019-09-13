From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: enable ADC support on stm32mp157a-dk1
Date: Fri, 13 Sep 2019 16:34:40 +0200
Message-ID: <1568385280-2633-4-git-send-email-fabrice.gasnier@st.com>
References: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Configure ADC support on stm32mp157a-dk1. It can be used for various
purpose:
- AIN connector has several analog inputs: ANA0, ANA1, ADC2 in6 & in2,
  ADC1 in13 & in6
- USB Type-C CC1 & CC2 pins wired to in18 & in19
It's easier then to Configure them all. But keep them disabled by default,
so the pins are kept in their initial state to lower power consumption.
This way they can also be used as GPIO.
Add VDD and VDDA supplies to ADC on stm32mp157c-dk1 board. This allows to
get full ADC analog performances in case VDDA is below 2.7V (not the case
by default).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index ebd9f33..2f42fcd 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -97,6 +97,33 @@
 	};
 };
 
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdd>;
+	vref-supply = <&vrefbuf>;
+	status = "disabled";
+	adc1: adc@0 {
+		/*
+		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
+		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
+		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
+		 * Use arbitrary margin here (e.g. 5us).
+		 */
+		st,min-sample-time-nsecs = <5000>;
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 6 13 18 19>;
+		status = "okay";
+	};
+	adc2: adc@100 {
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 2 6 18 19>;
+		st,min-sample-time-nsecs = <5000>;
+		status = "okay";
+	};
+};
+
 &cec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cec_pins_b>;
-- 
2.7.4
