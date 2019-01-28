From: Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH 1/3] dt-bindings: iio/adc: Add docs for Ingenic JZ47xx SoCs ADC.
Date: Mon, 28 Jan 2019 14:02:39 +0100
Message-ID: <20190128130241.5027-1-contact@artur-rojek.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

Add documentation for the ADC controller on JZ47xx SoCs,
used by the ingenic-adc driver.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
---
 .../bindings/iio/adc/ingenic,adc.txt          | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
new file mode 100644
index 000000000000..884f459bb9b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
@@ -0,0 +1,48 @@
+* Ingenic JZ47xx ADC controller IIO bindings
+
+Required properties:
+
+- compatible: Should be one of:
+  * ingenic,jz4725b-adc
+  * ingenic,jz4740-adc
+- reg: ADC controller registers location and length.
+- clocks: phandle to the SoC's ADC clock.
+- clock-names: Must be set to "adc".
+- #io-channel-cells: Must be set to <1> to indicate channels are selected
+  by index.
+
+ADC clients must use the format described in iio-bindings.txt, giving
+a phandle and IIO specifier pair ("io-channels") to the ADC controller.
+
+Example:
+
+#include <dt-bindings/iio/adc/ingenic,adc.h>
+
+adc: adc@10070000 {
+	compatible = "ingenic,jz4740-adc";
+	#io-channel-cells = <1>;
+
+	reg = <0x10070000 0x30>;
+
+	clocks = <&cgu JZ4740_CLK_ADC>;
+	clock-names = "adc";
+
+	interrupt-parent = <&intc>;
+	interrupts = <18>;
+};
+
+adc-keys {
+	...
+	compatible = "adc-keys";
+	io-channels = <&adc INGENIC_ADC_AUX>;
+	io-channel-names = "buttons";
+	...
+};
+
+battery {
+	...
+	compatible = "ingenic,jz4740-battery",
+	io-channels = <&adc INGENIC_ADC_BATTERY>;
+	io-channel-names = "battery";
+	...
+};
-- 
2.20.1
