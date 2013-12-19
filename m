From: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 0/2] ARM: mach-moxart: add MOXA ART SoC support
Date: Thu, 19 Dec 2013 11:47:42 +0100
Message-ID: <1387450064-6598-1-git-send-email-jonas.jensen@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The reason behind why fixed rate clock "ref12" couldn't be moved from
.dtsi to .dts:

There was nothing else in "clocks { .. }", the entire block was then
deleted from .dtsi.

If a skeleton "clocks { .. }" remain in .dtsi, the node can then be
moved to .dts, and of_clk_get() works again.

Changes since v6:

1. move fixed rate clock "ref12" from .dtsi to .dts
2. sort new entry alphabetically in arch/arm/Kconfig
3. rebase to next-20131219: arch/arm/Makefile arch/arm/Kconfig

Applies to next-20131219

Jonas Jensen (2):
  ARM: mach-moxart: add MOXA ART SoC platform files
  ARM: mach-moxart: add MOXA ART SoC device tree files

 Documentation/devicetree/bindings/arm/moxart.txt |  12 ++
 arch/arm/Kconfig                                 |   2 +
 arch/arm/Makefile                                |   1 +
 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/moxart-uc7112lx.dts            | 117 ++++++++++++++++++
 arch/arm/boot/dts/moxart.dtsi                    | 148 ++++++++++++++++++++++
 arch/arm/configs/moxart_defconfig                | 149 +++++++++++++++++++++++
 arch/arm/mach-moxart/Kconfig                     |  31 +++++
 arch/arm/mach-moxart/Makefile                    |   3 +
 arch/arm/mach-moxart/moxart.c                    |  15 +++
 10 files changed, 479 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/moxart.txt
 create mode 100644 arch/arm/boot/dts/moxart-uc7112lx.dts
 create mode 100644 arch/arm/boot/dts/moxart.dtsi
 create mode 100644 arch/arm/configs/moxart_defconfig
 create mode 100644 arch/arm/mach-moxart/Kconfig
 create mode 100644 arch/arm/mach-moxart/Makefile
 create mode 100644 arch/arm/mach-moxart/moxart.c

-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
