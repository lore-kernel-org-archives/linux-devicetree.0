From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Tue, 24 Apr 2018 18:34:55 +0200
Message-ID: <20180424163458.11947-5-johan@kernel.org>
References: <20180424163458.11947-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add binding for u-blox GNSS receivers.

Note that the u-blox product names encodes form factor (e.g. "neo"),
chipset (e.g. "8") and variant (e.g. "q"), but that only formfactor and
chipset is used for the compatible strings (for now).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../devicetree/bindings/gnss/u-blox.txt       | 31 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt

diff --git a/Documentation/devicetree/bindings/gnss/u-blox.txt b/Documentation/devicetree/bindings/gnss/u-blox.txt
new file mode 100644
index 000000000000..bb54b83a177f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/u-blox.txt
@@ -0,0 +1,31 @@
+u-blox GNSS Receiver DT binding
+
+The u-blox GNSS receivers can use UART, DDC (I2C), SPI and USB interfaces.
+
+Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
+properties.
+
+Required Properties:
+
+- compatible 	: Must be one of
+
+			"u-blox,neo-8"
+			"u-blox,neo-m8"
+
+- vcc-supply	: Main voltage regulator (VCC)
+
+Optional Properties:
+
+- timepulse-gpios	: Timepulse (e.g. 1PPS) GPIO (TIMEPULSE)
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
+	};
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b5f978a4cac6..2128dfdf73f1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -374,6 +374,7 @@ tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
 tsd	Theobroma Systems Design und Consulting GmbH
 tyan	Tyan Computer Corporation
+u-blox	u-blox
 ucrobotics	uCRobotics
 ubnt	Ubiquiti Networks
 udoo	Udoo
-- 
2.17.0
