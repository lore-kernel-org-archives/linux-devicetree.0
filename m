From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/2] dt-bindings: himax,hx8837: add HiMax HX8837 bindings
Date: Tue, 18 Sep 2018 22:43:58 +0200
Message-ID: <20180918204359.24894-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Jens Frederich <jfrederich@gmail.com>, Daniel Drake <dsd@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

HiMax HX8837 is a display controller used on OLPC platforms.
It controlls backlight and is able to capture and freeze a frame when
the LCD controller (and the rest of the plaform) is powered off.

What is missing here is the description of connections to the LCD
controller and the panel. Maybe it would be a good idea to plug in it
betweend the two in a manner described in
<Documentation/devicetree/bindings/graph.txt>.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/misc/himax,hx8837.txt  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/himax,hx8837.txt

diff --git a/Documentation/devicetree/bindings/misc/himax,hx8837.txt b/Documentation/devicetree/bindings/misc/himax,hx8837.txt
new file mode 100644
index 000000000000..7ffcc516a1b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/himax,hx8837.txt
@@ -0,0 +1,18 @@
+HX8837 Display Controller
+
+Required properties:
+- compatible: Should be "himax,hx8837".
+- reg: I2C address, must be 0x0d
+- stat-gpios: gpio specifier of DCON_STAT0 and DCON_STAT1 pins (active high)
+- load-gpio: gpio specifier of DCON_LOAD pin (active high)
+- irq-gpio: gpio specifier of DCON_IRQ pin (active high)
+
+Example:
+	dcon@d {
+		compatible = "himax,hx8837";
+		reg = <0x0d>;
+		stat-gpios = <&gpio 100 GPIO_ACTIVE_HIGH
+			      &gpio 101 GPIO_ACTIVE_HIGH>;
+		load-gpio = <&gpio 142 GPIO_ACTIVE_HIGH>;
+		irq-gpio = <&gpio 124 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.17.1
