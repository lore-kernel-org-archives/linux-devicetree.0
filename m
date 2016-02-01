From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 SPI peripheral
Date: Mon, 1 Feb 2016 15:44:56 -0700
Message-ID: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Document the devicetree bindings for the SPI peripheral found
on Microchip PIC32 class devices.

Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 .../bindings/spi/microchip,spi-pic32.txt           |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt

diff --git a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
new file mode 100644
index 0000000..a555618
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
@@ -0,0 +1,44 @@
+* Microchip PIC32 SPI device
+
+Required properties:
+- compatible: Should be "microchip,pic32mzda-spi".
+- reg: Address and length of the register set for the device
+- interrupts: Should contain all three spi interrupts in sequence
+              of <fault-irq>, <receive-irq>, <transmit-irq>.
+- interrupt-names: Should be "fault","rx","tx" in order.
+- clocks: phandles of baud generation clocks. Maximum two possible clocks
+	  can be provided (&PBCLK2, &REFCLKO1).
+          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- clock-names: Should be "mck0","mck1".
+               See: Documentation/devicetree/bindings/resource-names.txt
+- pinctrl-names: A pinctrl state names "default" must be defined.
+- pinctrl-0: Phandle referencing pin configuration of the SPI peripheral.
+             See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+
+Optional properties:
+- cs-gpios: List of GPIO chip selects. See ../spi/spi-bus.txt
+            See: Documentation/devicetree/bindings/spi/spi-bus.txt
+- dmas: Two or more DMA channel specifiers following the convention outlined
+        in Documentation/devicetree/bindings/dma/dma.txt
+- dma-names: Names for the dma channels. There must be at least one channel
+             named "spi-tx" for transmit and named "spi-rx" for receive.
+
+Example:
+
+	spi1:spi@0x1f821000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "microchip,pic32mzda-spi";
+		reg = <0x1f821000 0x200>;
+		interrupts = <109 IRQ_TYPE_LEVEL_HIGH>,
+			<110 IRQ_TYPE_LEVEL_HIGH>,
+			<111 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fault", "rx", "tx";
+		clocks = <&PBCLK2>, <&REFCLKO1>;
+		clock-names = "mck0", "mck1";
+		dmas = <&dma 134>,
+			<&dma 135>;
+		dma-names = "spi-rx", "spi-tx";
+		cs-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>,
+			<&gpio3 14 GPIO_ACTIVE_LOW>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
