From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: phy3250: enable ssp0
Date: Wed, 20 Apr 2016 09:20:59 -0400
Message-ID: <1461158460-2946-3-git-send-email-slemieux.tyco@gmail.com>
References: <1461158460-2946-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461158460-2946-1-git-send-email-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

Preparatory change prior to disabling SSPx controllers
by default in the shared LPC32xx DTSI file.

Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/phy3250.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index a00d7ce..26e070f 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -146,6 +146,7 @@
 				#size-cells = <0>;
 				num-cs = <1>;
 				cs-gpios = <&gpio 3 5 0>;
+				status = "okay";
 
 				eeprom: at25@0 {
 					pl022,interface = <0>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
