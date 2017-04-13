From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 01/22] dt-bindings: i2c: eeprom: Document manufacturer used as generic fallback
Date: Thu, 13 Apr 2017 15:28:18 -0300
Message-ID: <20170413182839.25381-2-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413182839.25381-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

Document in the Device Tree binding document that this manufacturer should
be used as the generic fallback.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/eeprom/eeprom.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
index 5696eb508e95..d0395f14e2b3 100644
--- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
+++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
@@ -17,7 +17,8 @@ Required properties:
 	"renesas,r1ex24002"
 
 	 If there is no specific driver for <manufacturer>, a generic
-	 driver based on <type> is selected. Possible types are:
+	 driver based on <type> and manufacturer "atmel" is selected.
+	 Possible types are:
 	 "24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32", "24c64",
 	 "24c128", "24c256", "24c512", "24c1024", "spd"
 
-- 
2.9.3
