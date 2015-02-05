From: Roman Volkov <v1ron-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] dts: vt8500: Add SDHC node to DTS file for WM8650
Date: Thu,  5 Feb 2015 12:54:26 +0300
Message-ID: <1423130066-3666-1-git-send-email-v1ron@v1ros.org>
References: <1421608444-25525-1-git-send-email-v1ron@v1ros.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421608444-25525-1-git-send-email-v1ron-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roman Volkov <v1ron-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is no DT node for SDHC controller for WM8650, while the driver already
exists. Add missing node to make the controller working by default.

Signed-off-by: Roman Volkov <v1ron-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
Reviewed-by: Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/wm8650.dtsi b/arch/arm/boot/dts/wm8650.dtsi
index b1c59a7..5d85ccd 100644
--- a/arch/arm/boot/dts/wm8650.dtsi
+++ b/arch/arm/boot/dts/wm8650.dtsi
@@ -187,6 +187,15 @@
 			interrupts = <43>;
 		};
 
+		sdhc@d800a000 {
+			compatible = "wm,wm8505-sdhc";
+			reg = <0xd800a000 0x400>;
+			interrupts = <20>, <21>;
+			clocks = <&clksdhc>;
+			bus-width = <4>;
+			sdon-inverted;
+		};
+
 		fb: fb@d8050800 {
 			compatible = "wm,wm8505-fb";
 			reg = <0xd8050800 0x200>;
-- 
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
