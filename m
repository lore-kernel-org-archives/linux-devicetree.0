From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: davinci: da8xx-dt: add OF_DEV_AUXDATA entry for mmc1
Date: Mon,  2 May 2016 15:40:39 +0200
Message-ID: <1462196439-4693-2-git-send-email-petr@barix.com>
References: <1462196439-4693-1-git-send-email-petr@barix.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462196439-4693-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, brain-wDf7oJUeT2I@public.gmane.org, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The da8xx-dt.c contained OF_DEV_AUXDATA entry for mmc0 only. The usage of
mmc1 was not possible from device tree because the probe was failing to
get the related MMC clock.

Add OF_DEV_AUXDATA entry for mmc1 in order to be able to use the mmc1
clocks and therefore the mmc1 interface.

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-davinci/da8xx-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
index c4b5808ca7c1..115c316e9b76 100644
--- a/arch/arm/mach-davinci/da8xx-dt.c
+++ b/arch/arm/mach-davinci/da8xx-dt.c
@@ -34,6 +34,7 @@ static struct of_dev_auxdata da850_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("ti,davinci-i2c", 0x01c22000, "i2c_davinci.1", NULL),
 	OF_DEV_AUXDATA("ti,davinci-wdt", 0x01c21000, "davinci-wdt", NULL),
 	OF_DEV_AUXDATA("ti,da830-mmc", 0x01c40000, "da830-mmc.0", NULL),
+	OF_DEV_AUXDATA("ti,da830-mmc", 0x01e1b000, "da830-mmc.1", NULL),
 	OF_DEV_AUXDATA("ti,da850-ehrpwm", 0x01f00000, "ehrpwm", NULL),
 	OF_DEV_AUXDATA("ti,da850-ehrpwm", 0x01f02000, "ehrpwm", NULL),
 	OF_DEV_AUXDATA("ti,da850-ecap", 0x01f06000, "ecap", NULL),
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
