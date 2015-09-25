From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] ARM: dts: WM8750: fix cpu compatible value
Date: Fri, 25 Sep 2015 20:35:34 +0300
Message-ID: <1443202534-13816-5-git-send-email-vz@mleia.com>
References: <1443202506-13732-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443202506-13732-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change corrects cpu compatible property to a defined one,
see Documentation/devicetree/bindings/arm/cpus.txt

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/wm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/wm8750.dtsi b/arch/arm/boot/dts/wm8750.dtsi
index 557a9c2a..46d076d 100644
--- a/arch/arm/boot/dts/wm8750.dtsi
+++ b/arch/arm/boot/dts/wm8750.dtsi
@@ -17,7 +17,7 @@
 
 		cpu {
 			device_type = "cpu";
-			compatible = "arm,arm1176ej-s";
+			compatible = "arm,arm1176jzf";
 		};
 	};
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
