From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/13] ARM: dts: armada-385-linksys: usb3 label cleanup
Date: Sun, 21 May 2017 14:48:55 +0200
Message-ID: <20170521124903.11050-7-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we use the reference for the USB3.0 port update the node name
and labels for the phy and vbus to match the label used by
armada-38x.dtsi.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

Notes:

  Going by documentation regulator-name is only of informative nature so
  changing it should be a non issue.
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 932fca4..6cc1ec7 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -63,16 +63,16 @@
 			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
 	};
 
-	usb3_phy: usb3_phy {
+	usb3_1_phy: usb3_1-phy {
 		compatible = "usb-nop-xceiv";
-		vcc-supply = <&reg_xhci0_vbus>;
+		vcc-supply = <&usb3_1_vbus>;
 	};
 
-	reg_xhci0_vbus: xhci0-vbus {
+	usb3_1_vbus: usb3_1-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
-		pinctrl-0 = <&xhci0_vbus_pins>;
-		regulator-name = "xhci0-vbus";
+		pinctrl-0 = <&usb3_1_vbus_pins>;
+		regulator-name = "usb3_1-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
@@ -371,7 +371,7 @@
 		marvell,function = "gpio";
 	};
 
-	xhci0_vbus_pins: xhci0-vbus-pins {
+	usb3_1_vbus_pins: usb3_1-vbus-pins {
 		marvell,pins = "mpp50";
 		marvell,function = "gpio";
 	};
@@ -393,5 +393,5 @@
 
 &usb3_1 {
 	status = "okay";
-	usb-phy = <&usb3_phy>;
+	usb-phy = <&usb3_1_phy>;
 };
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
