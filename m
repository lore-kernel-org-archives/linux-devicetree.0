From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 01/20] dt-bindings: i2c: eeprom: Document vendor to be used and deprecated ones
Date: Mon, 22 May 2017 16:01:49 +0200
Message-ID: <20170522140208.24652-2-javier@dowhile0.org>
References: <20170522140208.24652-1-javier@dowhile0.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522140208.24652-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account, so the exact list of supported <vendor,device> tuples
should be documented in the Device Tree binding document.

But there is no need to have different manufacturers if the EEPROM chips
from different manufacturers are really compatible, so matching using a
single "atmel" vendor is enough for all chip types.

Document in the Device Tree binding that the "atmel" manufacturer should
be used, and also document the manufacturers that have been deprecated.

Suggested-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>

---

Changes in v4:
- Document the manufacturers that have been deprecated (Rob Herring).

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/eeprom/eeprom.txt | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
index 5696eb508e95..121499252179 100644
--- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
+++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
@@ -2,22 +2,16 @@ EEPROMs (I2C)
 
 Required properties:
 
-  - compatible : should be "<manufacturer>,<type>", like these:
+  - compatible : should be "atmel,<type>", like these:
 
 	"atmel,24c00", "atmel,24c01", "atmel,24c02", "atmel,24c04",
 	"atmel,24c08", "atmel,24c16", "atmel,24c32", "atmel,24c64",
 	"atmel,24c128", "atmel,24c256", "atmel,24c512", "atmel,24c1024"
 
-	"catalyst,24c32"
+	The following manufacturers values have been deprecated:
+	"at", "at24", "catalyst", "microchip", "nxp", "ramtron", "renesas", "st"
 
-	"microchip,24c128"
-
-	"ramtron,24c64"
-
-	"renesas,r1ex24002"
-
-	 If there is no specific driver for <manufacturer>, a generic
-	 driver based on <type> is selected. Possible types are:
+	 Possible types are:
 	 "24c00", "24c01", "24c02", "24c04", "24c08", "24c16", "24c32", "24c64",
 	 "24c128", "24c256", "24c512", "24c1024", "spd"
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
