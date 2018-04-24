From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/7] dt-bindings: gnss: add sirfstar binding
Date: Tue, 24 Apr 2018 18:34:57 +0200
Message-ID: <20180424163458.11947-7-johan@kernel.org>
References: <20180424163458.11947-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add binding for SiRFstar-based GNSS receivers.

Note that while four compatible-strings are initially added representing
devices which differ in which I/O interfaces they support, they
otherwise essentially share the same feature set.

Pin and supply names (and some recommended timings) vary slightly, but
the binding recommends using a common set of names.

Note that the wakeup gpio is not intended to be as a wakeup source, but
rather to detect the current power state of the device (active or
hibernate).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../devicetree/bindings/gnss/sirfstar.txt     | 38 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt   |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/sirfstar.txt

diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
new file mode 100644
index 000000000000..5e6a02aec49a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
@@ -0,0 +1,38 @@
+SiRFstar-based GNSS Receiver DT binding
+
+SiRFstar chipsets are used in GNSS-receiver modules produced by several
+vendors and can use UART, SPI or I2C interfaces.
+
+Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
+properties.
+
+Required Properties:
+
+- compatible 	: Must be one of
+
+			"fastrax,uc430"
+			"linx,r4"
+			"wi2wi,w2sg0008i"
+			"wi2wi,w2sg0084i"
+
+- vcc-supply	: Main voltage regulator (3V3_IN, VDD, VCC)
+
+Optional Properties:
+
+- enable-gpios	: GPIO used to power on and off device (ON_OFF)
+- wakeup-gpios	: GPIO used to determine device power state (WAKEUP, RFPWRUP)
+- timepulse-gpios	: Timepulse (e.g 1PPS) GPIO (1PPS, TM)
+
+Example:
+
+serial@1234 {
+	compatible = "ns16550a";
+
+	gnss {
+		compatible = "wi2wi,w2sg0084i";
+
+		vcc-supply = <&gnss_reg>;
+		enable-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2128dfdf73f1..ddd81c82082d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -120,6 +120,7 @@ excito	Excito
 ezchip	EZchip Semiconductor
 fairphone	Fairphone B.V.
 faraday	Faraday Technology Corporation
+fastrax	Fastrax Oy
 fcs	Fairchild Semiconductor
 firefly	Firefly
 focaltech	FocalTech Systems Co.,Ltd
@@ -197,6 +198,7 @@ licheepi	Lichee Pi
 linaro	Linaro Limited
 linksys	Belkin International, Inc. (Linksys)
 linux	Linux-specific binding
+linx	Linx Technologies
 lltc	Linear Technology Corporation
 lsi	LSI Corp. (LSI Logic)
 lwn	Liebherr-Werk Nenzing GmbH
@@ -390,6 +392,7 @@ vivante	Vivante Corporation
 vocore VoCore Studio
 voipac	Voipac Technologies s.r.o.
 vot	Vision Optical Technology Co., Ltd.
+wi2wi	Wi2Wi
 wd	Western Digital Corp.
 wetek	WeTek Electronics, limited.
 wexler	Wexler
-- 
2.17.0
