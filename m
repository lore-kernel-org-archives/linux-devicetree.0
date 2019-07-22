From: Evgeny Kolesnikov <evgenyz@gmail.com>
Subject: [PATCH 2/5] power: reset: Add UART-based MCU restart DT bindings
Date: Mon, 22 Jul 2019 21:53:02 +0200
Message-ID: <98b32aebe39a7b6b3ace1c2ef6f51428e8284946.1563822216.git.evgenyz@gmail.com>
References: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Evgeny Kolesnikov <evgenyz@gmail.com>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings of the restart driver
for power managing micro controller units that are connected
to a board via the UART interface.

Signed-off-by: Evgeny Kolesnikov <evgenyz@gmail.com>
---
 .../bindings/power/reset/uart-restart.txt     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/uart-restart.txt

diff --git a/Documentation/devicetree/bindings/power/reset/uart-restart.txt b/Documentation/devicetree/bindings/power/reset/uart-restart.txt
new file mode 100644
index 000000000000..bf831d9bdff8
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/uart-restart.txt
@@ -0,0 +1,39 @@
+* UART-based PM MCU restart driver
+
+Some devices have a microcontroller controlling the main power
+supply. This microcontroller is connected to UART of the SoC.
+Sending a sequence of characters tells the MCU to reset the SoC
+and/or MCU itself.
+
+The length of the sequence, baud rate and the timeout to process
+the command may vary from device to device.
+
+This driver could be used for WD My Cloud (Marvell SoCs), QNAP
+(Kirkwood and Orion5x SoCs) and Synology NAS devices.
+
+Required properties:
+- compatible: Should be "uart-restart"
+- reg: Address and length of the register set for UART
+- clocks: The tclk clock
+- cmd: Array of bytes, the command to send to the MCU
+- baud: Baud rate [75..460800]
+
+Optional properties:
+- byte-delay: A delay after each byte of a command, could be useful
+              for sloppy MCUs [ms], default value is 5
+- timeout: A timeout to wait for the MCU to process the command [ms],
+           default value is 1000
+- override: Boolean flag that indicates if the driver should
+            prioritize itself over any existing restart driver,
+            default behaviour is not to interfere
+
+Example:
+	restart@12100 {
+		compatible = "uart-restart";
+		reg = <0x12100 0x100>;
+		clocks = <&coreclk 0>;
+		baud = <19200>;
+		cmd = [fa 03 03 02 00 00 fb];
+		override;
+		status = "okay";
+	};
-- 
2.21.0
