From: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 1/2] ARM: dts: da850: Add the usb otg device node
Date: Wed, 16 Nov 2016 12:07:35 +0100
Message-ID: <1479294456-7942-2-git-send-email-abailon@baylibre.com>
References: <1479294456-7942-1-git-send-email-abailon@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479294456-7942-1-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the device tree node for the usb otg
controller present in the da850 family of SoC's.

Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 2534aab..ddf4c6e 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -383,6 +383,16 @@
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
+		usb0: usb@200000 {
+			compatible = "ti,da830-musb";
+			reg = <0x200000 0x10000>;
+			interrupts = <58>;
+			interrupt-names = "mc";
+			dr_mode = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb-phy";
+			status = "disabled";
+		};
 		mdio: mdio@224000 {
 			compatible = "ti,davinci_mdio";
 			#address-cells = <1>;
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
