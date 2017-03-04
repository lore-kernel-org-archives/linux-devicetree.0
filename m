From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/2] Add support for HwaCom AmazeTV
Date: Sat,  4 Mar 2017 21:26:22 +0100
Message-ID: <20170304202624.29682-1-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

New DTS to support the HwaCom AmazeTV based on the Meson S905X SoC.

Changelog:
 v2:
  - Changed DTS name to meson-gxl-s905x-hwacom-amazetv.dts
 v3:
  - Split patchset in two parts: DTS and documentation update
  - Makefile now sorted alphabetically
  - DTS nodes now sorted alphabetically

Carlo Caione (2):
  dt-bindings: amlogic: Add HwaCom board
  ARM64: dts: meson-gxl: Add support for HwaCom AmazeTV

 Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts | 164 +++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
