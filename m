From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: sun6i: Add EHCI support for the
 M9 board
Date: Thu, 13 Nov 2014 10:31:48 +0100
Message-ID: <1415871109-28332-6-git-send-email-hdegoede@redhat.com>
References: <1415871109-28332-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBIPVSGRQKGQE42TJ4MQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415871109-28332-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Mele M9 / A1000G quad uses both usb-ports, one goes to an internal
usb wifi card, the other to a build-in usb-hub, so neither need their
OHCI companion controller to be enabled since the are always connected at
USB-2 speeds.

The controller which is attached to the wifi also does not need a vbus
regulator.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31-m9.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31-m9.dts b/arch/arm/boot/dts/sun6i-a31-m9.dts
index bc6115d..c85247e 100644
--- a/arch/arm/boot/dts/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/sun6i-a31-m9.dts
@@ -32,6 +32,19 @@
 			status = "okay";
 		};
 
+		usbphy: phy@01c19400 {
+			usb1_vbus-supply = <&reg_usb1_vbus>;
+			status = "okay";
+		};
+
+		ehci0: usb@01c1a000 {
+			status = "okay";
+		};
+
+		ehci1: usb@01c1b000 {
+			status = "okay";
+		};
+
 		pio: pinctrl@01c20800 {
 			mmc0_cd_pin_m9: mmc0_cd_pin@0 {
 				allwinner,pins = "PH22";
@@ -39,6 +52,12 @@
 				allwinner,drive = <0>;
 				allwinner,pull = <1>;
 			};
+			usb1_vbus_pin_m9: usb1_vbus_pin@0 {
+				allwinner,pins = "PC27";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
 		};
 
 		uart0: serial@01c28000 {
@@ -47,4 +66,11 @@
 			status = "okay";
 		};
 	};
+
+	reg_usb1_vbus: usb1-vbus {
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb1_vbus_pin_m9>;
+		gpio = <&pio 2 27 0>;
+		status = "okay";
+	};
 };
-- 
2.1.0
