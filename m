From: Alban <albeu@free.fr>
Subject: [PATCH v4 3/3] MIPS: ath79: Fix the USB PHY reset names
Date: Sun,  5 Feb 2017 20:52:32 +0100
Message-ID: <1486324352-15188-3-git-send-email-albeu@free.fr>
References: <1486324352-15188-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486324352-15188-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Antony Pavlov <antonynpavlov@gmail.com>, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Alban Bedel <albeu@free.fr>

The binding for the USB PHY went thru before the driver. However the
new version of the driver now use the PHY core support for reset, and
this expect the reset to be named "phy". So remove the "usb-" prefix
from the the reset names.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt | 4 ++--
 arch/mips/boot/dts/qca/ar9132.dtsi                      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.7.4
