From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] doc: dt: add documentation for nxp,lpc1850-usb-otg-phy
Date: Sat, 16 May 2015 19:27:57 +0200
Message-ID: <1431797277-4906-3-git-send-email-manabian@gmail.com>
References: <1431797277-4906-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431797277-4906-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for nxp,lpc1850-usb-otg-phy. This PHY
can found on NXP LPC18xx and LPC43xx devices.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/phy/nxp,lpc1850-usb-otg-phy.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
new file mode 100644
index 000000000000..3da60ca04a42
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
@@ -0,0 +1,19 @@
+NXP LPC18xx/43xx internal USB OTG PHY binding
+---------------------------------------------
+
+This file contains documentation for the internal USB OTG PHY found
+in NXP LPC18xx and LPC43xx SoCs.
+
+Required properties:
+- compatible	: must be "nxp,lpc1850-usb-otg-phy"
+- clocks	: must be exactly one entry
+See: Documentation/devicetree/bindings/clock/clock-bindings.txt
+- #phy-cells	: must be 0 for this phy
+See: Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Example:
+usb0_otg_phy: usb0-otg-phy {
+	compatible = "nxp,lpc1850-usb-otg-phy";
+	clocks = <&ccu1 CLK_USB0>;
+	#phy-cells = <0>;
+};
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
