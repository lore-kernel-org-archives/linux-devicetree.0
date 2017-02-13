From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v5 3/3] MIPS: ath79: Fix the USB PHY reset names
Date: Mon, 13 Feb 2017 23:25:46 +0100
Message-ID: <1487024746-32082-3-git-send-email-albeu@free.fr>
References: <1487024746-32082-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487024746-32082-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

The binding for the USB PHY went thru before the driver. However the
new version of the driver now use the PHY core support for reset, and
this expect the reset to be named "phy". So remove the "usb-" prefix
from the the reset names.

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
Changelog:
v5: * Also fix the AR9331 dtsi
---
 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt | 4 ++--
 arch/mips/boot/dts/qca/ar9132.dtsi                      | 2 +-
 arch/mips/boot/dts/qca/ar9331.dtsi                      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
index cafe219..c3a29c5 100644
--- a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
+++ b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
@@ -3,7 +3,7 @@
 Required properties:
 - compatible: "qca,ar7100-usb-phy"
 - #phys-cells: should be 0
-- reset-names: "usb-phy"[, "usb-suspend-override"]
+- reset-names: "phy"[, "suspend-override"]
 - resets: references to the reset controllers
 
 Example:
@@ -11,7 +11,7 @@ Example:
 	usb-phy {
 		compatible = "qca,ar7100-usb-phy";
 
-		reset-names = "usb-phy", "usb-suspend-override";
+		reset-names = "phy", "suspend-override";
 		resets = <&rst 4>, <&rst 3>;
 
 		#phy-cells = <0>;
diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 302f0a8..808c2bb 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -160,7 +160,7 @@
 	usb_phy: usb-phy {
 		compatible = "qca,ar7100-usb-phy";
 
-		reset-names = "usb-phy", "usb-suspend-override";
+		reset-names = "phy", "suspend-override";
 		resets = <&rst 4>, <&rst 3>;
 
 		#phy-cells = <0>;
diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index cf47ed4..4ffa3e8 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -145,7 +145,7 @@
 	usb_phy: usb-phy {
 		compatible = "qca,ar7100-usb-phy";
 
-		reset-names = "usb-phy", "usb-suspend-override";
+		reset-names = "phy", "suspend-override";
 		resets = <&rst 4>, <&rst 3>;
 
 		#phy-cells = <0>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
