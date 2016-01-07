From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v5 2/5] Documentation: devicetree: Add DT bindings to eeprom_93xx46 driver.
Date: Wed,  6 Jan 2016 22:55:01 -0500
Message-ID: <1452138904-24820-3-git-send-email-cory.tusar@pid1solutions.com>
References: <1452138904-24820-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452138904-24820-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit documents bindings to be added to the eeprom_93xx46 driver
which will allow:

  - Device word size and read-only attributes to be specified.
  - A device-specific compatible string for use with Atmel AT93C46D
    EEPROMs.
  - Specifying a GPIO line to function as a 'select' or 'enable' signal
    prior to accessing the EEPROM.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Chris Healy <chris.healy@zii.aero>
---
 .../devicetree/bindings/misc/eeprom-93xx46.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
new file mode 100644
index 0000000..a8ebb46
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
@@ -0,0 +1,25 @@
+EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
+
+Required properties:
+- compatible : shall be one of:
+    "atmel,at93c46d"
+    "eeprom-93xx46"
+- data-size : number of data bits per word (either 8 or 16)
+
+Optional properties:
+- read-only : parameter-less property which disables writes to the EEPROM
+- select-gpios : if present, specifies the GPIO that will be asserted prior to
+  each access to the EEPROM (e.g. for SPI bus multiplexing)
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
+
+Example:
+	eeprom@0 {
+		compatible = "eeprom-93xx46";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cs-high;
+		data-size = <8>;
+		select-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.4.10
