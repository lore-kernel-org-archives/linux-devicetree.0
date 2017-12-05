From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH v2] ARM: dts: sun8i: h3: enable USB OTG for NanoPi Neo board
Date: Tue, 5 Dec 2017 23:03:58 +0100
Message-ID: <20171205220358.GA28161@t440.localdomain>
References: <20171205090706.et5a7dizkhn6auje@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205090706.et5a7dizkhn6auje-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Similarly to Orange Pi Zero, NanoPi Neo board has an USB OTG port with
an ID pin but with unpowered VBUS. This patch enables this port in
forced peripheral mode.

ohci/ehci nodes are still enabled since the host mode may work if
external power source is used. In that case, the mode can be switched
for example via sysfs. The same strategy is used for Orange Pi Zero
board DTS.

Signed-off-by: Krzysztof Adamski <k@japko.eu>
---

Changes since version 1:
- nodes sorted alphabetically
- added explanation why enabling ohci/ehci still makes sense

 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
index 78f6c24952dd..9f33f6fae595 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
@@ -47,9 +47,26 @@
 	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &emac {
 	phy-handle = <&int_mii_phy>;
 	phy-mode = "mii";
 	allwinner,leds-active-low;
 	status = "okay";
 };
+
+&ohci0 {
+	status = "okay";
+};
+
+&usb_otg {
+	status = "okay";
+	dr_mode = "peripheral";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+};
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
