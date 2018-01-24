From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: [PATCH] powerpc: dts: use 'atmel' as at24 manufacturer for kmcent2
Date: Wed, 24 Jan 2018 22:38:34 +0100
Message-ID: <20180124213834.4870-1-brgl@bgdev.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Holger Brunck <holger.brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/kmcent2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts b/arch/powerpc/boot/dts/fsl/kmcent2.dts
index 5922c1ea0e96..3094df05f5ea 100644
--- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
+++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
@@ -130,7 +130,7 @@
 					#size-cells = <0>;
 
 					eeprom@54 {
-						compatible = "24c02";
+						compatible = "atmel,24c02";
 						reg = <0x54>;
 						pagesize = <2>;
 						read-only;
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
