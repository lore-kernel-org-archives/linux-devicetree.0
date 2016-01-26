From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCH v5 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Tue, 26 Jan 2016 08:32:46 +0100
Message-ID: <1453793566-31363-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1453793566-31363-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1453793566-31363-1-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
Changes since v4:
- Added description, required properties
- Tested and added support for gpio polarity
- Added vendor prefix to compatible flags

Changes since v3:
- Added gpio-controller and gpio cells flags

 .../devicetree/bindings/gpio/gpio-sn65hvs885.txt     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
new file mode 100644
index 0000000..c9b3592
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
@@ -0,0 +1,20 @@
+* TI SN65HVS885 digital-input serializer
+
+Required properties:
+- compatible : Should be "ti,sn65hvs885"
+- reg : chip select number
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells : Should be two.  The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+      0 = active high
+      1 = active low
+
+Example:
+sn65hvs885@3 {
+	compatible = "ti,sn65hvs885";
+	spi-max-frequency = <10000000>;
+	latch-gpio = <&gpio4 1 GPIO_ACTIVE_HIGH>;
+	reg = <0>;
+	gpio-controller;
+	#gpio-cells = <2>;
+};
-- 
2.7.0

