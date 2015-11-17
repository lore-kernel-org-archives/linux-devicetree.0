From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH 6/7] misc: eeprom: 93xx46: Add DT binding for a GPIO 'select' line.
Date: Mon, 16 Nov 2015 23:16:35 -0500
Message-ID: <1447733796-15546-7-git-send-email-cory.tusar@pid1solutions.com>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit documents an additional devicetree binding in the
eeprom_93x46 driver allowing a GPIO line to function as a 'select'
or 'enable' signal prior to accessing the EEPROM.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 Documentation/devicetree/bindings/misc/eeprom-93xx46.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
index 34a0cc2..75b16f4 100644
--- a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
+++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
@@ -6,6 +6,8 @@ Required properties:
 
 Optional properties:
 - read-only : parameter-less property which disables writes to the EEPROM
+- select-gpio : if present, specifies the GPIO that will be asserted prior to
+  each access to the EEPROM (e.g. for SPI bus multiplexing)
 
 Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
 apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
@@ -17,4 +19,5 @@ Example:
 		spi-max-frequency = <1000000>;
 		spi-cs-high;
 		data-size = <8>;
+		select-gpio = <&gpio4 4 GPIO_ACTIVE_HIGH>;
 	};
-- 
2.4.10
