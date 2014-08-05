From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v1 1/2] devicetree: bindings: improve description for GPIO assisted NAND flash
Date: Tue,  5 Aug 2014 10:37:25 +0200
Message-ID: <1407227846-3257-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Expand the description of the 'gpios' property in the GPIO assisted
NAND flash binding, to explicitly list the required GPIO pin references
and their order.

Update the example section to individually bracket the GPIO references,
and capitalize the signal names for improved readability.

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt        |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d3c90f..af8915b41ccf 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -11,8 +11,8 @@ Required properties:
   are made in native endianness.
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
-- gpios : specifies the gpio pins to control the NAND device.  nwp is an
-  optional gpio and may be set to 0 if not present.
+- gpios : Specifies the GPIO pins to control the NAND device.  The order of
+  GPIO references is:  RDY, nCE, ALE, CLE, and an optional nWP.
 
 Optional properties:
 - bank-width : Width (in bytes) of the device.  If not present, the width
@@ -35,11 +35,11 @@ gpio-nand@1,0 {
 	reg = <1 0x0000 0x2>;
 	#address-cells = <1>;
 	#size-cells = <1>;
-	gpios = <&banka 1 0	/* rdy */
-		 &banka 2 0 	/* nce */
-		 &banka 3 0 	/* ale */
-		 &banka 4 0 	/* cle */
-		 0		/* nwp */>;
+	gpios = <&banka 1 0>,	/* RDY */
+		<&banka 2 0>, 	/* nCE */
+		<&banka 3 0>, 	/* ALE */
+		<&banka 4 0>, 	/* CLE */
+		<0>;		/* nWP */
 
 	partition@0 {
 	...
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
