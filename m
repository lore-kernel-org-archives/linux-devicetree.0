From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3] ARM: sun8i: v40: enable USB host ports for
 Banana Pi M2 Berry
Date: Fri,  6 Apr 2018 22:03:44 +0800
Message-ID: <20180406140344.9457-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJP5TXLAKGQEHVZOC7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Banana Pi M2 Berry has an on-board USB Hub that provides 4 USB Type-A
ports, and it's connected to the USB1 port of the SoC.

Enable it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v3:
- Dropped OHCI node and added hub model comment in EHCI.

 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index a26d72c3f9b5..35859d8f3267 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -87,6 +87,11 @@
 	};
 };
 
+&ehci1 {
+	/* Terminus Tech FE 1.1s 4-port USB 2.0 hub here */
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -170,3 +175,8 @@
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc5v0>;
+	status = "okay";
+};
-- 
2.15.1
