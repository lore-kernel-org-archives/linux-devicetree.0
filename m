From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 2/2] ARM: sun8i: v3s: enable EHCI/OHCI for Lichee Pi Zero
Date: Thu, 21 Dec 2017 23:05:37 +0800
Message-ID: <20171221150537.20304-3-icenowy@aosc.io>
References: <20171221150537.20304-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221150537.20304-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the USB port on Lichee Pi Zero works in the OTG mode, enable the
EHCI/OHCI controllers for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
index 387fc2aa546d..cf2d9fe3bbb7 100644
--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
@@ -77,6 +77,10 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &mmc0 {
 	pinctrl-0 = <&mmc0_pins_a>;
 	pinctrl-names = "default";
@@ -86,6 +90,10 @@
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins_a>;
 	pinctrl-names = "default";
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
