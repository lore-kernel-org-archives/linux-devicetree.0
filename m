From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v7 0/4] ARM: SoC: add a new platform, UniPhier (arch/arm/mach-uniphier)
Date: Fri,  8 May 2015 13:07:10 +0900
Message-ID: <1431058034-5508-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an initial series for supporting Socionext UniPhier SoCs,
based on ARM Cortex-A9, mainly used for digital TVs, video recorders, etc.


Masahiro Yamada (4):
  ARM: UniPhier: add basic support for UniPhier architecture
  ARM: multi_v7_defconfig: enable UniPhier SoC family
  ARM: dts: UniPhier: add support for UniPhier SoCs and boards
  MAINTAINERS: add myself as ARM/UniPhier maintainer

 MAINTAINERS                                  |   7 ++
 arch/arm/Kconfig                             |   2 +
 arch/arm/Makefile                            |   1 +
 arch/arm/boot/dts/Makefile                   |   5 ++
 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts   |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi      | 110 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts  |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi     | 117 +++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts  |  80 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi     | 117 +++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts  |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi     | 110 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-support-card.dtsi |  65 +++++++++++++++
 arch/arm/configs/multi_v7_defconfig          |   1 +
 arch/arm/mach-uniphier/Kconfig               |  11 +++
 arch/arm/mach-uniphier/Makefile              |   2 +
 arch/arm/mach-uniphier/platsmp.c             |  90 +++++++++++++++++++++
 arch/arm/mach-uniphier/uniphier.c            |  30 +++++++
 18 files changed, 985 insertions(+)
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
 create mode 100644 arch/arm/mach-uniphier/platsmp.c
 create mode 100644 arch/arm/mach-uniphier/uniphier.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
