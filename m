From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v5 7/8] ARM: sun8i: h2+: enable USB OTG for
 Orange Pi Zero board
Date: Sat, 25 Mar 2017 22:50:14 +0800
Message-ID: <20170325145015.22076-8-icenowy@aosc.xyz>
References: <20170325145015.22076-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB24I3LDAKGQEFETYF5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170325145015.22076-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Orange Pi Zero board features a USB OTG port, which has a ID pin, and
can be used to power up the board. However, even if the board is powered
via +5V pin in GPIO/expansion headers, the VBUS in the OTG port cannot
be powered up, thus it's impossible to use it in host mode with simple
OTG cables.

Add support for it in peripheral mode.

If someone really want to use it in host mode, the mode of PHY can be
switch via sysfs, then use a powered USB OTG cable or powered USB HUB to
power up external USB devices.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v5:
- Add Chen-Yu's ACK.
Changes in v3:
- Add "h2+:" in commit message.

 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index 96c32293598a..9e8b082c134f 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -95,6 +95,10 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -131,6 +135,10 @@
 	bias-pull-up;
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &ohci1 {
 	status = "okay";
 };
@@ -153,7 +161,17 @@
 	status = "disabled";
 };
 
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &usbphy {
-	/* USB VBUS is always on */
+	/*
+	 * USB Type-A port VBUS is always on. However, MicroUSB VBUS can only
+	 * power up the board; when it's used as OTG port, this VBUS is
+	 * always off even if the board is powered via GPIO pins.
+	 */
 	status = "okay";
+	usb0_id_det-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 };
-- 
2.12.0
