From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/7] dt-bindings: phy-lpc18xx-usb-otg: remove unit address from binding
Date: Wed, 30 Mar 2016 00:30:46 +0200
Message-ID: <1459290646-3592-8-git-send-email-manabian@gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459290646-3592-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT bindings should either use a unit address and a reg property
or none of them. Since either of them aren't really useful for
such a simple device like this one remove the unit address.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt b/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
index bd61b46..3bb821c 100644
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
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
