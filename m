From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v2 09/14] DEVICETREE: Add bindings for PIC32 UART driver
Date: Mon, 14 Dec 2015 15:42:11 -0700
Message-ID: <1450133093-7053-10-git-send-email-joshua.henderson@microchip.com>
References: <1450133093-7053-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450133093-7053-1-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Document the devicetree bindings for the UART peripheral found on
Microchip PIC32 class devices.

Signed-off-by: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
---
 .../bindings/serial/microchip,pic32-uart.txt       |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
new file mode 100644
index 0000000..65b38bf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
@@ -0,0 +1,29 @@
+* Microchip Universal Asynchronous Receiver Transmitter (UART)
+
+Required properties:
+- compatible: Should be "microchip,pic32mzda-uart"
+- reg: Should contain registers location and length
+- interrupts: Should contain interrupt
+- clocks: Phandle to the clock.
+          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- pinctrl-names: A pinctrl state names "default" must be defined.
+- pinctrl-0: Phandle referencing pin configuration of the UART peripheral.
+             See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+
+Optional properties:
+- cts-gpios: CTS pin for UART
+
+Example:
+	uart1: serial@1f822000 {
+		compatible = "microchip,pic32mzda-uart";
+		reg = <0x1f822000 0x50>;
+		interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
+			<113 IRQ_TYPE_LEVEL_HIGH>,
+			<114 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&PBCLK2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_uart1
+				&pinctrl_uart1_cts
+				&pinctrl_uart1_rts>;
+		cts-gpios = <&gpio1 15 0>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
