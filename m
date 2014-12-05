From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v4 4/4] Documentation: dt: gpio: Add gpio-number-forward property in snps gpio binding doc
Date: Fri,  5 Dec 2014 11:38:42 +0800
Message-ID: <1417750722-14027-5-git-send-email-wangzhou.bry@gmail.com>
References: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417750722-14027-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, liguozhu@hisilicon.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, atull@altera.com, sebastian.hesselbarth@gmail.com, bigeasy@linutronix.de, jamie@jamieiles.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>
List-Id: devicetree@vger.kernel.org

This property is used to indicate gpiochip_find_base() to find GPIO
base number in increasing order.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
index dd5d2c0..b7f01c8 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
@@ -29,6 +29,7 @@ controller.
 - interrupts : The interrupt to the parent controller raised when GPIOs
   generate the interrupts.
 - snps,nr-gpios : The number of pins in the port, a single cell.
+- gpio-number-forward : Will find GPIO base number in increasing order.
 
 Example:
 
@@ -37,6 +38,7 @@ gpio: gpio@20000 {
 	reg = <0x20000 0x1000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	gpio-number-forward;
 
 	porta: gpio-controller@0 {
 		compatible = "snps,dw-apb-gpio-port";
-- 
1.7.9.5

