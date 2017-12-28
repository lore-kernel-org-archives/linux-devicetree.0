From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: fix USB Ethernet of Orange Pi R1
Date: Thu, 28 Dec 2017 22:05:38 +0800
Message-ID: <20171228140538.14388-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBTXUSPJAKGQE5ODEJSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Orange Pi R1 uses a Realtek RTL8152B USB Ethernet chip, which is easily
seen on the board but not show in the schematics. A regulator for the
power of the RTL8152B chip is hidden, which uses the same pin with the
Wi-Fi regulator on the original Orange Pi Zero.

Add this regulator back to the device tree, and bind it to USB1.

Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
index 32a6d312422e..f7f61cbcd15a 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-r1.dts
@@ -49,6 +49,20 @@
 
 	/delete-node/ reg_vcc_wifi;
 
+	/*
+	 * Ths pin of this regulator is the same with the Wi-Fi extra
+	 * regulator on the original Zero. However it's used for USB
+	 * Ethernet rather than the Wi-Fi now.
+	 */
+	reg_vcc_usb_eth: reg-vcc-usb-ethernet {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc-usb-ethernet";
+		enable-active-high;
+		gpio = <&pio 0 20 GPIO_ACTIVE_HIGH>;
+	};
+
 	aliases {
 		ethernet1 = &rtl8189etv;
 	};
@@ -71,3 +85,7 @@
 		reg = <1>;
 	};
 };
+
+&usbphy {
+	usb1_vbus-supply = <&reg_vcc_usb_eth>;
+};
-- 
2.14.2
