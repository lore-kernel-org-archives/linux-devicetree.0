From: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: [PATCH v4 0/2] ARM: mach-moxart: add MOXA ART SoC support
Date: Fri, 13 Dec 2013 15:38:26 +0100
Message-ID: <CACmBeS1oTB=aewysR67-dQfn17X_at=ajP0-ZEqbX8MarTi5_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Forwarding this because I used the wrong Cc address to
devicetree-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

---------- Forwarded message ----------
From: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: 13 December 2013 15:33
Subject: [PATCH v4 0/2] ARM: mach-moxart: add MOXA ART SoC support
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org,
arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org,
Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


This set adds MOXA ART SoC and platform support.

Changes since v3:
1. removed platform specific UART debug files,
   replaced by generic code under DEBUG_LL_UART_8250.

arch/arm/mach-moxart/*:
2. select DMA_OF and PHYLIB
3. remove .init_time hook
4. reinsert restart code that rely on watchdog register
   (watchdog maintainers rejected arm_pm_restart in watchdog code)
   assign arm_pm_restart from .init_machine
5. move to ARCH_MULTI_V4T (ARCH_MULTI_V4 was removed)

arch/arm/boot/dts/moxart-uc7112lx.dts:
6. remove comments
7. add "mdio0"/"mdio1" nodes
8. add phy-handle/phy-mode to "mac0"/"mac1" nodes
9. change bootargs (change root=/dev/mtdblock2 to root=/dev/mmcblk0p1)
10. add gpio-leds node "leds"
11. add gpio-keys-polled node "gpio_keys_polled"
12. rename "mmc" node "sdhci"

arch/arm/boot/dts/moxart.dtsi:
13. add fixed-clock node "ref12"
14. remove "clk" node, add nodes "clk_pll"/"clk_apb"
15. add gpio-rtc-* (sclk|data|reset) to "rtc" node
16. add "dma" node
17. remove second register from "gpio" node

Applies to next-20131213


Jonas Jensen (2):
  ARM: mach-moxart: add MOXA ART SoC platform files
  ARM: mach-moxart: add MOXA ART SoC device tree files

 Documentation/devicetree/bindings/arm/moxart.txt |  12 ++
 arch/arm/Kconfig                                 |   2 +
 arch/arm/Makefile                                |   1 +
 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/moxart-uc7112lx.dts            | 131 ++++++++++++++++++++
 arch/arm/boot/dts/moxart.dtsi                    | 100 +++++++++++++++
 arch/arm/configs/moxart_defconfig                | 148 +++++++++++++++++++++++
 arch/arm/mach-moxart/Kconfig                     |  31 +++++
 arch/arm/mach-moxart/Makefile                    |   3 +
 arch/arm/mach-moxart/moxart.c                    |  75 ++++++++++++
 10 files changed, 504 insertions(+)
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
