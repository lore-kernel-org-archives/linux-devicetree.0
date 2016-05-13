From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH 0/3] ARM: clps711x: Initial DT support
Date: Fri, 13 May 2016 14:26:25 +0300
Message-ID: <1463138788-5390-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This small series of patches adds initial DT support for Cirrus Logic
ARMv4T processors.

Alexander Shiyan (3):
  ARM: clps711x: Reduce static map size
  ARM: clps711x: Add basic DT support
  ARM: dts: clps711x: Add basic Cirrus Logic CDB89712 Development board

 arch/arm/Kconfig                               |   2 +
 arch/arm/boot/dts/Makefile                     |   2 +
 arch/arm/boot/dts/clps711x-cdb89712.dts        |  56 +++++++
 arch/arm/boot/dts/clps711x.dtsi                | 201 +++++++++++++++++++++++++
 arch/arm/include/debug/clps711x.S              |   4 +-
 arch/arm/mach-clps711x/Kconfig                 |   7 +
 arch/arm/mach-clps711x/common.c                |  20 ++-
 arch/arm/mach-clps711x/devices.c               |   6 +
 arch/arm/mach-clps711x/devices.h               |   1 +
 arch/arm/mach-clps711x/include/mach/hardware.h |   2 +-
 10 files changed, 295 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/clps711x-cdb89712.dts
 create mode 100644 arch/arm/boot/dts/clps711x.dtsi

-- 
2.4.9

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
