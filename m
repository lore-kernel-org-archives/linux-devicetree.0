From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/2] phy: dt bindings: add NXP LPC18xx/43xx USB OTG PHY bindings
Date: Thu,  9 Jul 2015 22:48:26 +0200
Message-ID: <1436474906-2669-3-git-send-email-manabian@gmail.com>
References: <1436474906-2669-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436474906-2669-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for NXP LPC18xx/43xx USB OTG PHY. This
PHY can found on NXP LPC18xx and LPC43xx devices with USB support.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/phy/phy-lpc18xx-usb-otg.txt           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt b/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
new file mode 100644
index 000000000000..bd61b467e30a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
@@ -0,0 +1,26 @@
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
+The phy node must be a child of the creg syscon node.
+
+Example:
+creg: syscon@40043000 {
+	compatible = "nxp,lpc1850-creg", "syscon", "simple-mfd";
+	reg = <0x40043000 0x1000>;
+
+	usb0_otg_phy: phy@004 {
+		compatible = "nxp,lpc1850-usb-otg-phy";
+		clocks = <&ccu1 CLK_USB0>;
+		#phy-cells = <0>;
+	};
+};
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
