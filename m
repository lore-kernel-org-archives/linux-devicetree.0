From: Evgeny Kolesnikov <evgenyz@gmail.com>
Subject: [PATCH 1/5] power: reset: Add UART-based MCU poweroff DT bindings
Date: Mon, 22 Jul 2019 21:53:01 +0200
Message-ID: <cda16032dc5679a557230cbdb63702b105782b3b.1563822216.git.evgenyz@gmail.com>
References: <cover.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Evgeny Kolesnikov <evgenyz@gmail.com>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings of the poweroff driver
for power managing micro controller units that are connected
to a board via the UART interface.

Signed-off-by: Evgeny Kolesnikov <evgenyz@gmail.com>
---
 .../bindings/power/reset/uart-poweroff.txt    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/uart-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt b/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
new file mode 100644
index 000000000000..86d036271b51
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/uart-poweroff.txt
@@ -0,0 +1,38 @@
+* UART-based PM MCU power off driver
+
+Some devices have a microcontroller controlling the main power
+supply. This microcontroller is connected to UART of the SoC.
+Sending a sequence of characters tells the MCU to turn
+the power off.
+
+The length of the sequence, baud rate and the timeout to process
+the command may vary from device to device.
+
+This driver could be used for WD My Cloud (Marvell SoCs), QNAP
+(Kirkwood and Orion5x SoCs) and Synology NAS devices.
+
+Required properties:
+- compatible: Should be "uart-poweroff"
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
+            prioritize itself over any existing power off driver,
+            default behaviour is not to interfere
+
+Example:
+	poweroff@12100 {
+		compatible = "uart-poweroff";
+		reg = <0x12100 0x100>;
+		clocks = <&coreclk 0>;
+		baud = <19200>;
+		cmd = [fa 03 03 01 00 00 fb];
+		status = "okay";
+	};
-- 
2.21.0
