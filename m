From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/7] ARM: dts: lpc32xx: ea3250: add SoC name prefix to board dts file
Date: Tue, 26 Apr 2016 03:37:27 +0300
Message-ID: <1461631050-10479-5-git-send-email-vz@mleia.com>
References: <1461631050-10479-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461631050-10479-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

To simplify matching of DTS files of all NXP LPC32xx powered boards by
a file name add 'lpc3250' prefix to Embedded Artists LPC3250 board dts
file.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                           | 3 ++-
 arch/arm/boot/dts/{ea3250.dts => lpc3250-ea3250.dts} | 0
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename arch/arm/boot/dts/{ea3250.dts => lpc3250-ea3250.dts} (100%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 95c1923..9f8b14f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -241,7 +241,8 @@ dtb-$(CONFIG_ARCH_LPC18XX) += \
 	lpc4350-hitex-eval.dtb \
 	lpc4357-ea4357-devkit.dtb
 dtb-$(CONFIG_ARCH_LPC32XX) += \
-	ea3250.dtb phy3250.dtb
+	lpc3250-ea3250.dtb \
+	phy3250.dtb
 dtb-$(CONFIG_MACH_MESON6) += \
 	meson6-atv1200.dtb
 dtb-$(CONFIG_MACH_MESON8) += \
diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
similarity index 100%
rename from arch/arm/boot/dts/ea3250.dts
rename to arch/arm/boot/dts/lpc3250-ea3250.dts
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
