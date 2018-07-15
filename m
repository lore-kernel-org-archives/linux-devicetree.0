From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] ARM: dts: pxa: change serial node names
Date: Sun, 15 Jul 2018 22:21:53 +0200
Message-ID: <20180715202153.7233-1-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Change from xxuart to serial to normalize the devicetree pxa serial
support.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index f609dbb86abf..a5f9efdd2361 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -95,7 +95,7 @@
 			};
 		};
 
-		ffuart: uart@40100000 {
+		ffuart: serial@40100000 {
 			compatible = "mrvl,pxa-uart";
 			reg = <0x40100000 0x30>;
 			interrupts = <22>;
@@ -103,7 +103,7 @@
 			status = "disabled";
 		};
 
-		btuart: uart@40200000 {
+		btuart: serial@40200000 {
 			compatible = "mrvl,pxa-uart";
 			reg = <0x40200000 0x30>;
 			interrupts = <21>;
@@ -111,7 +111,7 @@
 			status = "disabled";
 		};
 
-		stuart: uart@40700000 {
+		stuart: serial@40700000 {
 			compatible = "mrvl,pxa-uart";
 			reg = <0x40700000 0x30>;
 			interrupts = <20>;
@@ -119,7 +119,7 @@
 			status = "disabled";
 		};
 
-		hwuart: uart@41100000 {
+		hwuart: serial@41100000 {
 			compatible = "mrvl,pxa-uart";
 			reg = <0x41100000 0x30>;
 			interrupts = <7>;
-- 
2.11.0
