From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 0/4] ARM: SoC: add a new platform, UniPhier (arch/arm/mach-uniphier)
Date: Thu, 16 Apr 2015 16:59:03 +0900
Message-ID: <1429171147-19464-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This is an initial series for supporting Socionext UniPhier SoCs,
based on ARM Cortex-A9, mainly used for digital TVs, video recorders, etc.


Masahiro Yamada (4):
  ARM: UniPhier: add basic support for UniPhier architecture
  ARM: multi_v7_defconfig: enable UniPhier SoC family
  ARM: dts: UniPhier: add support for UniPhier SoCs and boards
  MAINTAINERS: add myself as ARM/UniPhier maintainer

 MAINTAINERS                                  |  7 +++
 arch/arm/Kconfig                             |  2 +
 arch/arm/Makefile                            |  1 +
 arch/arm/boot/dts/Makefile                   |  5 ++
 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts   | 51 +++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi      | 78 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts  | 51 +++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi     | 85 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts  | 52 +++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi     | 85 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts  | 51 +++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi     | 78 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-support-card.dtsi | 39 +++++++++++++
 arch/arm/configs/multi_v7_defconfig          |  1 +
 arch/arm/mach-uniphier/Kconfig               | 11 ++++
 arch/arm/mach-uniphier/Makefile              |  2 +
 arch/arm/mach-uniphier/headsmp.S             | 21 +++++++
 arch/arm/mach-uniphier/platsmp.c             | 78 +++++++++++++++++++++++++
 arch/arm/mach-uniphier/uniphier.c            | 31 ++++++++++
 19 files changed, 729 insertions(+)
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-support-card.dtsi
 create mode 100644 arch/arm/mach-uniphier/Kconfig
 create mode 100644 arch/arm/mach-uniphier/Makefile
 create mode 100644 arch/arm/mach-uniphier/headsmp.S
 create mode 100644 arch/arm/mach-uniphier/platsmp.c
 create mode 100644 arch/arm/mach-uniphier/uniphier.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
