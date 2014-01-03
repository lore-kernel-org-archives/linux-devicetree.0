From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Documentation: net: fsl-fec.txt: Specify the phy reset active level
Date: Fri,  3 Jan 2014 11:17:33 -0200
Message-ID: <1388755053-2887-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Since commit 7a399e3a2e (fec: Do not assume that PHY reset is active low), we no
longer assume that the PHY reset is active low.

Now we need to retrieve this information from the device tree instead, so update
the binding documentation to make it clearer.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/net/fsl-fec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 845ff84..68010c3 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -10,7 +10,8 @@ Required properties:
 
 Optional properties:
 - local-mac-address : 6 bytes, mac address
-- phy-reset-gpios : Should specify the gpio for phy reset
+- phy-reset-gpios : Should specify the gpio for the phy reset with the flag that
+indicates whether it is active low or active high.
 - phy-reset-duration : Reset duration in milliseconds.  Should present
   only if property "phy-reset-gpios" is available.  Missing the property
   will have the duration be 1 millisecond.  Numbers greater than 1000 are
@@ -24,7 +25,7 @@ ethernet@83fec000 {
 	reg = <0x83fec000 0x4000>;
 	interrupts = <87>;
 	phy-mode = "mii";
-	phy-reset-gpios = <&gpio2 14 0>; /* GPIO2_14 */
+	phy-reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>; /* GPIO2_14 */
 	local-mac-address = [00 04 9F 01 1B B9];
 	phy-supply = <&reg_fec_supply>;
 };
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
