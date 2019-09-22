From: Heiko Schocher <hs@denx.de>
Subject: [PATCH 1/2] misc: add cc1101 devicetree binding
Date: Sun, 22 Sep 2019 08:03:55 +0200
Message-ID: <20190922060356.58763-2-hs@denx.de>
References: <20190922060356.58763-1-hs@denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922060356.58763-1-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add devicetree binding for cc1101 misc driver.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 .../devicetree/bindings/misc/cc1101.txt       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/cc1101.txt

diff --git a/Documentation/devicetree/bindings/misc/cc1101.txt b/Documentation/devicetree/bindings/misc/cc1101.txt
new file mode 100644
index 0000000000000..afea6acf4a9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/cc1101.txt
@@ -0,0 +1,27 @@
+driver cc1101 Low-Power Sub-1 GHz RF Transceiver chip from Texas
+Instruments.
+
+Requires node properties:
+- compatible : should be "ti,cc1101";
+- reg        : Chip select address of device, see:
+               Documentation/devicetree/bindings/spi/spi-bus.txt
+- gpios      : list of 2 gpios, first gpio is for GDO0 pin
+               second for GDO2 pin, see more:
+               Documentation/devicetree/bindings/gpio/gpio.txt
+
+Recommended properties:
+ - spi-max-frequency: Definition as per
+                Documentation/devicetree/bindings/spi/spi-bus.txt
+ - freq       : used spi frequency for communication with cc1101 chip
+
+example:
+
+&ecspi4 {
+        cc1101@0 {
+                compatible = "ti,cc1101";
+                spi-max-frequency = <10000000>;
+                reg = <0>;
+                freq = <5000000>;
+                gpios = <&gpio2 11 GPIO_ACTIVE_HIGH &gpio5 8 GPIO_ACTIVE_HIGH>;
+        };
+};
-- 
2.21.0
