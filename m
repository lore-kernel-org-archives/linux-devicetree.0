From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH v3 01/21] dt-bindings: i2c: eeprom: Document manufacturer used as generic fallback
Date: Thu, 13 Apr 2017 22:04:25 -0300
Message-ID: <20170414010445.21727-2-javier@osg.samsung.com>
References: <20170414010445.21727-1-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414010445.21727-1-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

Document in the Device Tree binding document that this manufacturer should
be used as the generic fallback.

Suggested-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

---

Changes in v3: None
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
