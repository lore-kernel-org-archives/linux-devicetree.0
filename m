From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 1/6] Documentation: dt-bindings: Document STM32 ADC DT bindings
Date: Tue, 15 Nov 2016 16:30:56 +0100
Message-ID: <1479223861-21747-2-git-send-email-fabrice.gasnier@st.com>
References: <1479223861-21747-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479223861-21747-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32 ADC.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/st,stm32-adc.txt   | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
new file mode 100644
index 0000000..49ed82e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
@@ -0,0 +1,83 @@
+STMicroelectronics STM32 ADC device driver
+
+STM32 ADC is a successive approximation analog-to-digital converter.
+It has several multiplexed input channels. Conversions can be performed
+in single, continuous, scan or discontinuous mode. Result of the ADC is
+stored in a left-aligned or right-aligned 32-bit data register.
+Conversions can be launched in software or using hardware triggers.
+
+The analog watchdog feature allows the application to detect if the input
+voltage goes beyond the user-defined, higher or lower thresholds.
+
+Each STM32 ADC block can have up to 3 ADC instances.
+
+Each instance supports two contexts to manage conversions, each one has its
+own configurable sequence and trigger:
+- regular conversion can be done in sequence, running in background
+- injected conversions have higher priority, and so have the ability to
+  interrupt regular conversion sequence (either triggered in SW or HW).
+  Regular sequence is resumed, in case it has been interrupted.
+
+Contents of a stm32 adc root node:
+-----------------------------------
+Required properties:
+- compatible: Should be "st,stm32f4-adc-core".
+- reg: Offset and length of the ADC block register set.
+- interrupts: Must contain the interrupt for ADC block.
+- clocks: Clock for the analog circuitry (common to all ADCs).
+- clock-names: Must be "adc".
+- interrupt-controller: Identifies the controller node as interrupt-parent
+- vref-supply: Phandle to the vref input analog reference voltage.
+- #interrupt-cells = <1>;
+- #address-cells = <1>;
+- #size-cells = <0>;
+
+Optional properties:
+- A pinctrl state named "default" for each ADC channel may be defined to set
+  inX ADC pins in mode of operation for analog input on external pin.
+
+Contents of a stm32 adc child node:
+-----------------------------------
+An ADC block node should contain at least one subnode, representing an
+ADC instance available on the machine.
+
+Required properties:
+- compatible: Should be "st,stm32f4-adc".
+- reg: Offset of ADC instance in ADC block (e.g. may be 0x0, 0x100, 0x200).
+- clocks: Input clock private to this ADC instance.
+- interrupt-parent: Phandle to the parent interrupt controller.
+- interrupts: IRQ Line for the ADC (e.g. may be 0 for adc@0, 1 for adc@100 or
+  2 for adc@200).
+- st,adc-channels: List of single-ended channels muxed for this ADC.
+  It can have up to 16 channels, numbered from 0 to 15 (resp. for in0..in15).
+- #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
+  Documentation/devicetree/bindings/iio/iio-bindings.txt
+
+Example:
+	adc: adc@40012000 {
+		compatible = "st,stm32f4-adc-core";
+		reg = <0x40012000 0x400>;
+		interrupts = <18>;
+		clocks = <&rcc 0 168>;
+		clock-names = "adc";
+		vref-supply = <&reg_vref>;
+		interrupt-controller;
+		pinctrl-names = "default";
+		pinctrl-0 = <&adc3_in8_pin>;
+
+		#interrupt-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		adc@0 {
+			compatible = "st,stm32f4-adc";
+			#io-channel-cells = <1>;
+			reg = <0x0>;
+			clocks = <&rcc 0 168>;
+			interrupt-parent = <&adc>;
+			interrupts = <0>;
+			st,adc-channels = <8>;
+		};
+		...
+		other adc child nodes follow...
+	};
-- 
1.9.1
