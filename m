From: Peter Rosin <peda@axentia.se>
Subject: [PATCH] dt-bindings: usb: atmel: fix a couple of copy-paste style typos
Date: Tue, 18 Oct 2016 13:05:18 +0200
Message-ID: <1476788718-21143-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/usb/atmel-usb.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index f4262ed60582..ad8ea56a9ed3 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -6,9 +6,9 @@ Required properties:
  - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
    used in host mode.
  - reg: Address and length of the register set for the device
- - interrupts: Should contain ehci interrupt
+ - interrupts: Should contain ohci interrupt
  - clocks: Should reference the peripheral, host and system clocks
- - clock-names: Should contains two strings
+ - clock-names: Should contain three strings
 		"ohci_clk" for the peripheral clock
 		"hclk" for the host clock
 		"uhpck" for the system clock
@@ -35,7 +35,7 @@ Required properties:
  - reg: Address and length of the register set for the device
  - interrupts: Should contain ehci interrupt
  - clocks: Should reference the peripheral and the UTMI clocks
- - clock-names: Should contains two strings
+ - clock-names: Should contain two strings
 		"ehci_clk" for the peripheral clock
 		"usb_clk" for the UTMI clock
 
@@ -58,7 +58,7 @@ Required properties:
  - reg: Address and length of the register set for the device
  - interrupts: Should contain macb interrupt
  - clocks: Should reference the peripheral and the AHB clocks
- - clock-names: Should contains two strings
+ - clock-names: Should contain two strings
 		"pclk" for the peripheral clock
 		"hclk" for the AHB clock
 
@@ -85,7 +85,7 @@ Required properties:
  - reg: Address and length of the register set for the device
  - interrupts: Should contain usba interrupt
  - clocks: Should reference the peripheral and host clocks
- - clock-names: Should contains two strings
+ - clock-names: Should contain two strings
 		"pclk" for the peripheral clock
 		"hclk" for the host clock
  - ep childnode: To specify the number of endpoints and their properties.
-- 
2.1.4
