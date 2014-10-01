From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/6] ARM: meson: add meson8 machine definition
Date: Wed,  1 Oct 2014 23:29:41 +0200
Message-ID: <1412198986-26534-2-git-send-email-b.galvani@gmail.com>
References: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412198986-26534-1-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a machine definition for Amlogic Meson8 SoCs.

Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-meson/Kconfig | 5 +++++
 arch/arm/mach-meson/meson.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 2c1154e..b289e8e 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -10,4 +10,9 @@ config MACH_MESON6
 	default ARCH_MESON
 	select MESON6_TIMER
 
+config MACH_MESON8
+	bool "Amlogic Meson8 SoCs support"
+	default ARCH_MESON
+	select MESON6_TIMER
+
 endif
diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index 5ee064f..e95d6ae 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -21,7 +21,15 @@ static const char * const m6_common_board_compat[] = {
 	NULL,
 };
 
+static const char * const m8_common_board_compat[] = {
+	"amlogic,meson8",
+	NULL,
+};
+
 DT_MACHINE_START(AML8726_MX, "Amlogic Meson6 platform")
 	.dt_compat	= m6_common_board_compat,
 MACHINE_END
 
+DT_MACHINE_START(MESON8, "Amlogic Meson8 platform")
+	.dt_compat	= m8_common_board_compat,
+MACHINE_END
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
