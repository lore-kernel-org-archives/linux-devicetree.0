From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/7] dt-bindings: add generic gnss binding
Date: Tue, 24 Apr 2018 18:34:53 +0200
Message-ID: <20180424163458.11947-3-johan@kernel.org>
References: <20180424163458.11947-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Describe generic properties for GNSS receivers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../devicetree/bindings/gnss/gnss.txt         | 36 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gnss.txt

diff --git a/Documentation/devicetree/bindings/gnss/gnss.txt b/Documentation/devicetree/bindings/gnss/gnss.txt
new file mode 100644
index 000000000000..bcdaca043eaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/gnss.txt
@@ -0,0 +1,36 @@
+GNSS Receiver DT binding
+
+This documents the binding structure and common properties for GNSS receiver
+devices.
+
+A GNSS receiver node is a node named "gnss" and typically resides on a serial
+bus (e.g. UART, I2C or SPI).
+
+Please refer to the following documents for generic properties:
+
+	Documentation/devicetree/bindings/serial/slave-device.txt
+	Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Required Properties:
+
+- compatible 	: A string reflecting the vendor and specific device the node
+		  represents
+
+Optional Properties:
+- enable-gpios	: GPIO used to power on (or off) the device
+- timepulse-gpios	: Timepulse (e.g. 1PPS) GPIO
+
+Example:
+
+serial@1234 {
+	compatible = "ns16550a";
+
+	gnss {
+		compatible = "u-blox,neo-8";
+
+		vcc-supply = <&gnss_reg>;
+		timepulse-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+
+		current-speed = <4800>;
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index dc3df211c1a7..fa219e80a1f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5965,6 +5965,7 @@ F:	include/uapi/linux/gigaset_dev.h
 GNSS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/gnss/
 F:	drivers/gnss/
 F:	include/linux/gnss.h
 
-- 
2.17.0
