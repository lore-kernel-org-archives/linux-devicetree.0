From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 2/2] ARM: dts: bcm283x: Enable AUX interrupt controller
Date: Wed, 7 Jun 2017 12:11:53 +0100
Message-ID: <59e986d6-8529-4f62-6782-230ced6dc71b@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the AUX block has a dedicated interrupt controller, declare it
in the Device Tree and update the bcm283x uart1 and spi1/spi2 nodes to
use it.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index cc721a4..88df7aa 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -464,12 +464,16 @@
 			#clock-cells = <1>;
 			reg = <0x7e215000 0x8>;
 			clocks = <&clocks BCM2835_CLOCK_VPU>;
+			interrupts = <1 29>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
 		};
 
 		uart1: serial@7e215040 {
 			compatible = "brcm,bcm2835-aux-uart";
 			reg = <0x7e215040 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&aux>;
+			interrupts = <0>;
 			clocks = <&aux BCM2835_AUX_CLOCK_UART>;
 			status = "disabled";
 		};
@@ -477,7 +481,8 @@
 		spi1: spi@7e215080 {
 			compatible = "brcm,bcm2835-aux-spi";
 			reg = <0x7e215080 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&aux>;
+			interrupts = <1>;
 			clocks = <&aux BCM2835_AUX_CLOCK_SPI1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -487,7 +492,8 @@
 		spi2: spi@7e2150c0 {
 			compatible = "brcm,bcm2835-aux-spi";
 			reg = <0x7e2150c0 0x40>;
-			interrupts = <1 29>;
+			interrupt-parent = <&aux>;
+			interrupts = <2>;
 			clocks = <&aux BCM2835_AUX_CLOCK_SPI2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.9.1
