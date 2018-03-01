Return-Path: <SRS0=Tccq=FX=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/3] ARM: dts: omap4-droid4: Fix USB PHY port naming
Date: Wed, 28 Feb 2018 20:01:05 -0800
Message-Id: <20180301040107.39444-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Marcel Partap <mpartap@gmx.net>, Michael Scott <michael.scott@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

We have a USB OCHI PHY on port 1 for mdm6600. Port 2 is using transceiverless
logic (TLL) for USB EHCI for w3glte modem.

Let's also fix the node name to use usb-phy while at it.

Cc: Marcel Partap <mpartap@gmx.net>
Cc: Michael Scott <michael.scott@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -71,8 +71,8 @@
 		regulator-always-on;
 	};
 
-	/* HS USB Host PHY on PORT 1 */
-	hsusb1_phy: hsusb1_phy {
+	/* HS USB host TLL nop-phy on port 2 for w3glte */
+	hsusb2_phy: usb-phy@2 {
 		compatible = "usb-nop-xceiv";
 		#phy-cells = <0>;
 	};
@@ -584,7 +584,7 @@
 };
 
 &usbhsehci {
-	phys = <&hsusb1_phy>;
+	phys = <&hsusb2_phy>;
 };
 
 &usbhshost {
-- 
2.16.2
