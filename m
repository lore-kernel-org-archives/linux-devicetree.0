From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv6][ 3/7] ARM: imx{25,27} DT: Permit the selection of the imxfb framebuffer driver.
Date: Thu, 24 Oct 2013 10:01:01 +0200
Message-ID: <1382601665-6830-3-git-send-email-denis@eukrea.com>
References: <1382601665-6830-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382601665-6830-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Without that patch, a user can't select the imxfb driver when the i.MX2=
5 and/or
  the i.MX27 device tree board are selected and that no boards that sel=
ects
  IMX_HAVE_PLATFORM_IMX_FB are compiled in.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v5->v6:
- Reworked the patch not to make DT boards depend on IMX_HAVE_PLATFORM_=
IMX_FB.=20
- Added better explanations of why that patch is needed in the commit m=
essage.
---
 arch/arm/mach-imx/Kconfig         |    5 +++++
 arch/arm/mach-imx/devices/Kconfig |    1 +
 drivers/video/Kconfig             |    2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 9f67338..3ccb5d5 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -64,6 +64,9 @@ config ARCH_HAS_RNGA
 config HAVE_IMX_ANATOP
 	bool
=20
+config HAVE_IMX_FB
+       bool
+
 config HAVE_IMX_GPC
 	bool
=20
@@ -254,6 +257,7 @@ endchoice
 config MACH_IMX25_DT
 	bool "Support i.MX25 platforms from device tree"
 	select SOC_IMX25
+	select HAVE_IMX_FB
 	help
 	  Include support for Freescale i.MX25 based platforms
 	  using the device tree for discovery
@@ -442,6 +446,7 @@ config MACH_IMX27IPCAM
 config MACH_IMX27_DT
 	bool "Support i.MX27 platforms from device tree"
 	select SOC_IMX27
+	select HAVE_IMX_FB
 	help
 	  Include support for Freescale i.MX27 based platforms
 	  using the device tree for discovery
diff --git a/arch/arm/mach-imx/devices/Kconfig b/arch/arm/mach-imx/devi=
ces/Kconfig
index 68c74fb..a7af9f4 100644
--- a/arch/arm/mach-imx/devices/Kconfig
+++ b/arch/arm/mach-imx/devices/Kconfig
@@ -26,6 +26,7 @@ config IMX_HAVE_PLATFORM_IMXDI_RTC
 	bool
=20
 config IMX_HAVE_PLATFORM_IMX_FB
+	select HAVE_IMX_FB
 	bool
=20
 config IMX_HAVE_PLATFORM_IMX_I2C
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 14317b7..a97529f 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -363,7 +363,7 @@ config FB_SA1100
=20
 config FB_IMX
 	tristate "Freescale i.MX1/21/25/27 LCD support"
-	depends on FB && IMX_HAVE_PLATFORM_IMX_FB
+	depends on FB && HAVE_IMX_FB
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
