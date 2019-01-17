From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Thu, 17 Jan 2019 17:54:32 +0100
Message-ID: <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Add binding for Mediatek-based GNSS receivers.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---

v2:
Renamed bindings from Globaltop/gtop to Mediatek/mtk.
Moved current-speed as an optional propertie.
Removed the status line in the example.
Added "mediatek,mt3339" compatible.

 .../devicetree/bindings/gnss/mediatek.txt          | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt

diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
new file mode 100644
index 000000000000..fd984b4a9a6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
@@ -0,0 +1,39 @@
+Mediatek-based GNSS Receiver DT binding
+
+Mediatek chipsets are used in GNSS-receiver modules produced by several
+vendors and can use UART, SPI or I2C interfaces.
+
+Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
+properties.
+
+Required properties:
+
+- compatible	: Must be one of
+
+			"globaltop,pa6h"
+			"mediatek,mt3339"
+
+- vcc-supply	: Main voltage regulator (pin name: 3V3_IN, VCC, VDD)
+
+Required properties (I2C):
+- reg		: I2C slave address
+
+Required properties (SPI):
+- reg		: SPI chip select address
+
+Optional properties:
+
+- timepulse-gpios	: Time pulse GPIO
+- v-bckp-supply		: Backup voltage regulator
+- current-speed		: Default UART baud rate
+
+Example:
+
+serial@1234 {
+	compatible = "ns16550a";
+
+	gnss {
+		compatible = "globaltop,pa6h";
+		vcc-supply = <&vcc_3v3>;
+	};
+};
-- 
2.7.4
