From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] ARM64: Add Vega S96 board support
Date: Tue, 19 Sep 2017 14:05:46 +0200
Message-ID: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the Tronsmart Vega S96 TV Box based
on the Q200 Amlogic Reference design.

Neil Armstrong (2):
  ARM64: dts: meson-gxm: Add Vega S96 board
  dt-bindings: arm: amlogic: Add Tronsmart Vega S96 binding

 Documentation/devicetree/bindings/arm/amlogic.txt  |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts | 39 ++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
