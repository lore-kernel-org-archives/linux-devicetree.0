From: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [V6 2/2] dt-bindings: phy: Add bindings for ralink-usb PHY
Date: Tue, 15 Aug 2017 13:47:03 +0100
Message-ID: <1502801223-20833-2-git-send-email-harvey.hunt@imgtec.com>
References: <1502801223-20833-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502801223-20833-1-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>

Add a binding for the USB phy on Mediatek/Ralink SoCs.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
Changes in V6:
* Add MT7628 binding
* Add optional reg property

Changes in V5:
* None

Changes in V4:
* None

Changes in V3:
* Split out from first patch

 .../devicetree/bindings/phy/ralink-usb-phy.txt      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ralink-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
new file mode 100644
index 0000000..80cd24d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ralink-usb-phy.txt
@@ -0,0 +1,21 @@
+Mediatek/Ralink USB PHY
+
+Required properties:
+ - compatible: "ralink,rt3352-usbphy"
+	       "mediatek,mt7620-usbphy"
+	       "mediatek,mt7628-usbphy"
+ - reg: required for "mediatek,mt7628-usbphy"
+ - #phy-cells: should be 0
+ - resets: the two reset controllers for host and device
+ - reset-names: the names of the 2 reset controllers
+
+Example:
+
+usbphy: phy {
+	compatible = "mediatek,mt7628-usbphy";
+	reg = <0x10120000 0x1000>;
+	#phy-cells = <0>;
+
+	resets = <&rstctrl 22 &rstctrl 25>;
+	reset-names = "host", "device";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
