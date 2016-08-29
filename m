From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 0/3] ARm64: amlogic: Introduce common GX family dtsi
Date: Mon, 29 Aug 2016 09:56:08 +0200
Message-ID: <1472457371-1305-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The new Amlogic GLX SoCs (S905X and S905D) are part of the Meson GX family so
they share some basic characteritics that can be described in a common GX
dtsi file used by the Meson GXBB and Meson GXL dtsi.

This patchset introduces the common dtsi and switches the GLX and GXBB to use
the common dtsi, the GXBB dtsi is reformated to handle this situation.

This patchset depends on Carlo Caione "ARM64: dts: amlogic: Add basic support for Amlogic S905X" [1]

[1] http://lkml.kernel.org/r/1472382113-10754-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org

Neil Armstrong (3):
  ARM64: dts: amlogic: Add Meson GX Family common dtsi
  ARM64: dts: amlogic: Switch Meson GXL dtsi to use common GX dtsi
  ARM64: dts: amlogic: Switch Meson GXBB dtsi to use common GX dtsi

 arch/arm64/boot/dts/amlogic/meson-gx-common.dtsi | 181 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi      | 320 +++++++----------------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi       | 133 +---------
 3 files changed, 281 insertions(+), 353 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-common.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
