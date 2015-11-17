From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH 2/7] misc: eeprom: 93xx46: Add DT bindings to eeprom_93xx46 driver.
Date: Mon, 16 Nov 2015 23:16:31 -0500
Message-ID: <1447733796-15546-3-git-send-email-cory.tusar@pid1solutions.com>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit documents bindings to be added to the eeprom_93xx46 driver
which allow device word size and read-only attributes to be specified
via devicetree.

Currently the only supported device is a generic "eeprom-93xx46", which
mirrors the configuration options previously available as a platform
device.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 .../devicetree/bindings/misc/eeprom-93xx46.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
new file mode 100644
index 0000000..ba493a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
@@ -0,0 +1,20 @@
+EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
+
+Required properties:
+- compatible : "eeprom-93xx46"
+- data-size : number of data bits per word (either 8 or 16)
+
+Optional properties:
+- read-only : parameter-less property which disables writes to the EEPROM
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
+
+Example:
+	93c46c@0 {
+		compatible = "eeprom-93xx46";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cs-high;
+		data-size = <8>;
+	};
-- 
2.4.10
