From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v5 09/14] dt/bindings: Add bindings for PIC32 UART driver
Date: Wed, 13 Jan 2016 18:15:42 -0700
Message-ID: <1452734299-460-10-git-send-email-joshua.henderson@microchip.com>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrei Pistirica <andrei.pistirica@microchip.com>

Document the devicetree bindings for the UART peripheral found on
Microchip PIC32 class devices.

Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v4: None
Changes since v3: None
Changes since v2: None
Changes since v1:
	- Fix example
	- Use UART instead of incorrect USART
	- Document otherwise unundocumented properties
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
