From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/7] gpio: dwapb: correct gpio-cells in binding document
Date: Sat, 22 Mar 2014 17:16:39 +0100
Message-ID: <1395505004-22650-3-git-send-email-bigeasy@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, delicious.quinoa@gmail.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The example uses gpio-cells = 1 while it should be two (it is even
mentioned in the text above).

Cc: devicetree@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
index 91cc90c..dd5d2c0 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
@@ -41,7 +41,7 @@ gpio: gpio@20000 {
 	porta: gpio-controller@0 {
 		compatible = "snps,dw-apb-gpio-port";
 		gpio-controller;
-		#gpio-cells = <1>;
+		#gpio-cells = <2>;
 		snps,nr-gpios = <8>;
 		reg = <0>;
 		interrupt-controller;
@@ -53,7 +53,7 @@ gpio: gpio@20000 {
 	portb: gpio-controller@1 {
 		compatible = "snps,dw-apb-gpio-port";
 		gpio-controller;
-		#gpio-cells = <1>;
+		#gpio-cells = <2>;
 		snps,nr-gpios = <8>;
 		reg = <1>;
 	};
-- 
1.9.1
