From: kevans91-OYTqUY/oFF8@public.gmane.org
Subject: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Tue, 19 Dec 2017 15:05:23 -0600
Message-ID: <20171219210523.10428-1-kevans91@ksu.edu>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
thermal calibration data, add node to describe it.

a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
supported in an external driver for FreeBSD.

Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
---

Changes in v2:
 - remove bogus "From:" line in commit text; no functional change

 Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1 +
 arch/arm/boot/dts/sun8i-a83t.dtsi                               | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
index d69543701..e319fe5e2 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible: Should be one of the following:
   "allwinner,sun4i-a10-sid"
   "allwinner,sun7i-a20-sid"
+  "allwinner,sun8i-a83t-sid"
   "allwinner,sun8i-h3-sid"
   "allwinner,sun50i-a64-sid"
 
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index de5119a2a..cced6e5fb 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -238,6 +238,11 @@
 			#size-cells = <0>;
 		};
 
+		sid: eeprom@1c14000 {
+			compatible = "allwinner,sun8i-a83t-sid";
+			reg = <0x1c14000 0x400>;
+		};
+
 		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun8i-a83t-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
