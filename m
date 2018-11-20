From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] gpio: dwapb: Correct the DT node name in the example
Date: Tue, 20 Nov 2018 11:17:09 +0000
Message-ID: <20181120111709.22128-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: devicetree@vger.kernel.org

The sub-nodes should not be called gpio-controller, but simply gpio.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
index 7276b50c3506..839dd32ffe11 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
@@ -43,7 +43,7 @@ gpio: gpio@20000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	porta: gpio-controller@0 {
+	porta: gpio@0 {
 		compatible = "snps,dw-apb-gpio-port";
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -55,7 +55,7 @@ gpio: gpio@20000 {
 		interrupts = <0>;
 	};
 
-	portb: gpio-controller@1 {
+	portb: gpio@1 {
 		compatible = "snps,dw-apb-gpio-port";
 		gpio-controller;
 		#gpio-cells = <2>;
-- 
2.17.1
