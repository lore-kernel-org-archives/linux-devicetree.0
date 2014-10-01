From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/6] ARM: add machine and dts files for Amlogic Meson8
Date: Wed,  1 Oct 2014 23:29:40 +0200
Message-ID: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

this patchset introduces a machine definition and dts files for
Amlogic Meson8, which is a family of quad-core Cortex-A9 SoCs used in
tablets and set-top boxes.

Beniamino Galvani (6):
  ARM: meson: add meson8 machine definition
  ARM: dts: add dtsi for Amlogic Meson8 SoCs
  ARM: dts: add dts for Tronsmart S89 Elite TV box
  of: add vendor prefix for Tronsmart
  ARM: document Tronsmart compatible properties
  ARM: meson: document meson8 compatible properties

 Documentation/devicetree/bindings/arm/amlogic.txt  |  8 +-
 .../devicetree/bindings/arm/tronsmart.txt          |  7 ++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/boot/dts/meson8-vega-s89e.dts             | 65 ++++++++++++++++
 arch/arm/boot/dts/meson8.dtsi                      | 90 ++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig                        |  5 ++
 arch/arm/mach-meson/meson.c                        |  8 ++
 7 files changed, 181 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tronsmart.txt
 create mode 100644 arch/arm/boot/dts/meson8-vega-s89e.dts
 create mode 100644 arch/arm/boot/dts/meson8.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
