From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC 07/10] ARM: meson: enable MESON_IRQ_GPIO in Kconfig for meson8
Date: Tue,  4 Oct 2016 17:08:25 +0200
Message-ID: <1475593708-10526-8-git-send-email-jbrunet@baylibre.com>
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475593708-10526-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add select MESON_IRQ_GPIO in Kconfig for Amlogic's meson8 and meson8b SoC

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-meson/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index b6e3acc63e14..63157295cd9d 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -21,11 +21,13 @@ config MACH_MESON8
 	bool "Amlogic Meson8 SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select MESON_IRQ_GPIO
 
 config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
 	select COMMON_CLK_MESON8B
+	select MESON_IRQ_GPIO
 
 endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
