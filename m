From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/19] ARM: sun4i: dt: Add USB host nodes to
 Mele A1000 dts
Date: Sat,  1 Mar 2014 20:26:26 +0100
Message-ID: <1393701998-3553-8-git-send-email-hdegoede@redhat.com>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBA7JZCMAKGQELYQ5OAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393701998-3553-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add nodes for the usb-phy and ehci- and ohci-usb-host controllers.

Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-a1000.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
index d6ec839..fa746aea 100644
--- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
@@ -13,6 +13,7 @@
 
 /dts-v1/;
 /include/ "sun4i-a10.dtsi"
+/include/ "sunxi-common-regulators.dtsi"
 
 / {
 	model = "Mele A1000";
@@ -35,10 +36,32 @@
 			};
 		};
 
+		usbphy: phy@01c13400 {
+			usb1_vbus-supply = <&reg_usb1_vbus>;
+			usb2_vbus-supply = <&reg_usb2_vbus>;
+			status = "okay";
+		};
+
+		ehci0: usb@01c14000 {
+			status = "okay";
+		};
+
+		ohci0: usb@01c14400 {
+			status = "okay";
+		};
+
 		ahci: sata@01c18000 {
 			status = "okay";
 		};
 
+		ehci1: usb@01c1c000 {
+			status = "okay";
+		};
+
+		ohci1: usb@01c1c400 {
+			status = "okay";
+		};
+
 		pinctrl@01c20800 {
 			emac_power_pin_a1000: emac_power_pin@0 {
 				allwinner,pins = "PH15";
@@ -94,4 +117,12 @@
 		enable-active-high;
 		gpio = <&pio 7 15 0>;
 	};
+
+	reg_usb1_vbus: usb1-vbus {
+		status = "okay";
+	};
+
+	reg_usb2_vbus: usb2-vbus {
+		status = "okay";
+	};
 };
-- 
1.9.0
