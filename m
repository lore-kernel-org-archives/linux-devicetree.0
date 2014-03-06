From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/6] ARM: BCM63XX: add support for BCM63138 SoC
Date: Thu, 6 Mar 2014 09:45:53 -0800
Message-ID: <1394127959-3159-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patchset adds very minimal support for the BCM63138 SoC which is
a xDSL SoC using a dual Cortex A9 CPU complex.

Future work will focus on:

- clock device/driver/providers
- SMP support (already working)
- DT'fying drivers/tty/serial/bcm63xx_uart.c to be usable

Florian Fainelli (6):
  ARM: BCM63XX: add basic support for the Broadcom BCM63138 DSL SoC
  ARM: restrict BCM_KONA_UART to ARCH_BCM_MOBILE
  ARM: BCM63XX: add low-level UART debug support
  ARM: BCM63XX: add BCM63138 minimal Device Tree
  ARM: BCM63XX: add BCM963138DVT Reference platform DTS
  MAINTAINERS: add entry for the Broadcom BCM63xx ARM SoCs

 .../devicetree/bindings/arm/bcm/bcm63138.txt       |   9 ++
 MAINTAINERS                                        |  10 ++
 arch/arm/Kconfig.debug                             |  20 +++-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm63138.dtsi                    | 109 +++++++++++++++++++++
 arch/arm/boot/dts/bcm63138dvt.dts                  |  18 ++++
 arch/arm/include/debug/bcm63xxx.S                  |  33 +++++++
 arch/arm/mach-bcm/Kconfig                          |  20 ++++
 arch/arm/mach-bcm/Makefile                         |   2 +
 arch/arm/mach-bcm/bcm63xx.h                        |  29 ++++++
 arch/arm/mach-bcm/board_bcm63xx.c                  |  94 ++++++++++++++++++
 11 files changed, 342 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm63138.txt
 create mode 100644 arch/arm/boot/dts/bcm63138.dtsi
 create mode 100644 arch/arm/boot/dts/bcm63138dvt.dts
 create mode 100644 arch/arm/include/debug/bcm63xxx.S
 create mode 100644 arch/arm/mach-bcm/bcm63xx.h
 create mode 100644 arch/arm/mach-bcm/board_bcm63xx.c

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
