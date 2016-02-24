From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: phy-lpc18xx-usb-otg: remove unit address from binding
Date: Wed, 24 Feb 2016 23:20:38 +0100
Message-ID: <1456352438-15691-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT bindings should either use a unit address and a reg property
or none of them. Since either of them aren't really useful for
such a simple device like this one remove the unit address.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Hi Rob,

As discussed here:
http://marc.info/?l=devicetree&m=145626556706715&w=2

I'll take the DT changes through my own tree. Note that
they might not make it in the next kernel release.

 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt b/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
index bd61b467e30a..3bb821cd6a7f 100644
--- a/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
+++ b/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
@@ -18,7 +18,7 @@ creg: syscon@40043000 {
 	compatible = "nxp,lpc1850-creg", "syscon", "simple-mfd";
 	reg = <0x40043000 0x1000>;
 
-	usb0_otg_phy: phy@004 {
+	usb0_otg_phy: phy {
 		compatible = "nxp,lpc1850-usb-otg-phy";
 		clocks = <&ccu1 CLK_USB0>;
 		#phy-cells = <0>;
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
