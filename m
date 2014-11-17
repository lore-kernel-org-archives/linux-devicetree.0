From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v8 06/13] Documentation: bindings: add doc for the Berlin USB PHY
Date: Mon, 17 Nov 2014 14:35:40 +0100
Message-ID: <1416231347-27193-7-git-send-email-antoine.tenart@free-electrons.com>
References: <1416231347-27193-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416231347-27193-1-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the bindings of the Marvell Berlin USB PHY driver.

Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/berlin-usb-phy.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/berlin-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt b/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt
new file mode 100644
index 000000000000..be33780f668e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/berlin-usb-phy.txt
@@ -0,0 +1,16 @@
+* Marvell Berlin USB PHY
+
+Required properties:
+- compatible: "marvell,berlin2-usb-phy" or "marvell,berlin2cd-usb-phy"
+- reg: base address and length of the registers
+- #phys-cells: should be 0
+- resets: reference to the reset controller
+
+Example:
+
+	usb-phy@f774000 {
+		compatible = "marvell,berlin2-usb-phy";
+		reg = <0xf774000 0x128>;
+		#phy-cells = <0>;
+		resets = <&chip 0x104 14>;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
