From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [RESEND PATCH v5 01/16] dt-bindings: i2c: eeprom: Document vendor to be used and deprecated ones
Date: Thu, 15 Jun 2017 20:54:03 +0200
Message-ID: <20170615185418.13980-2-javier@dowhile0.org>
References: <20170615185418.13980-1-javier@dowhile0.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615185418.13980-1-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, Simon Horman <horms@verge.net.au>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

Document in the Device Tree binding document that this manufacturer should
be used as the generic fallback. Also document the deprecated vendors.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>

---

Changes in v5:
- Only deprecate the atmel variants at25 and at (Geert Uytterhoeven).

Changes in v4:
- Document the manufacturers that have been deprecated (Rob Herring).

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/eeprom/eeprom.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
index 5696eb508e95..afc04589eadf 100644
--- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
+++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
@@ -16,8 +16,12 @@ Required properties:
 
 	"renesas,r1ex24002"
 
+	The following manufacturers values have been deprecated:
+	"at", "at24"
+
 	 If there is no specific driver for <manufacturer>, a generic
-	 driver based on <type> is selected. Possible types are:
+	 device with <type> and manufacturer "atmel" should be used.
+	 Possible types are:
 	 "24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32", "24c64",
 	 "24c128", "24c256", "24c512", "24c1024", "spd"
 
-- 
2.9.3
