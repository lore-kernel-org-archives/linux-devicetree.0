From: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Subject: [PATCH/RFT 02/12] ARM: davinci: hawk: add full constraints for ohci plat boot
Date: Fri,  7 Oct 2016 18:42:47 +0200
Message-ID: <1475858577-10366-3-git-send-email-ahaslam@baylibre.com>
References: <1475858577-10366-1-git-send-email-ahaslam@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475858577-10366-1-git-send-email-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

The phy framework requests an optional "phy" regulator. If it does
not find one, it returns -EPROBE_DEFER. In the case of non-DT based boot
for the omap138-lcdk board, this would prevent the usb11 phy to probe
correctly and ohci would not enumerate.

By calling "regulator_has_full_constraints", An error would be returned
instead of DEFER for the "optional" regulator, and the probe of
the phy driver can continue normally without a regulator.

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-davinci/board-omapl138-hawk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c b/arch/arm/mach-davinci/board-omapl138-hawk.c
index c5cb8d9..1dc6112 100644
--- a/arch/arm/mach-davinci/board-omapl138-hawk.c
+++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
@@ -14,6 +14,7 @@
 #include <linux/console.h>
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-davinci.h>
+#include <linux/regulator/machine.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -328,6 +329,7 @@ static __init void omapl138_hawk_init(void)
 	if (ret)
 		pr_warn("%s: dsp/rproc registration failed: %d\n",
 			__func__, ret);
+	regulator_has_full_constraints();
 }
 
 #ifdef CONFIG_SERIAL_8250_CONSOLE
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
