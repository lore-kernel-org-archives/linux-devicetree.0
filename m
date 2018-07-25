From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 1/2] MIPS: mscc: ocelot: add interrupt controller properties to GPIO controller
Date: Wed, 25 Jul 2018 14:26:20 +0200
Message-ID: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The GPIO controller also serves as an interrupt controller for events
on the GPIO it handles.

An interrupt occurs whenever a GPIO line has changed.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index d7f0e3551500..afe8fc9011ea 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -168,6 +168,9 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&gpio 0 0 22>;
+			interrupt-controller;
+			interrupts = <13>;
+			#interrupt-cells = <2>;
 
 			uart_pins: uart-pins {
 				pins = "GPIO_6", "GPIO_7";
-- 
2.14.1
