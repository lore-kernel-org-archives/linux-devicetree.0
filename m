From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Wed, 16 Dec 2015 15:55:07 -0800
Message-ID: <1450310115-22163-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a major rewrite of the previous Raspberry Pi 2 submission.
SMP support is now included, and the DT includes are cleaned up to
avoid massive duplication.

The branch (based on 4.4-rc5, to get the USB regression fixes) can be
found at:

https://github.com/anholt/linux/tree/bcm2836-4.4

Andrea Merello (1):
  irq: bcm2836: Add SMP support for the 2836

Eric Anholt (7):
  irq: bcm2836: Fix initialization of the LOCAL_IRQ_CNT*IRQ timers
  dt-bindings: Add root properties for Raspberry Pi 2
  ARM: bcm2835: Split the DT for peripherals from the DT for the CPU
  ARM: bcm2835: Move the CPU/peripheral include out of common RPi DT.
  ARM: bcm2835: Add devicetree for bcm2836 and Raspberry Pi 2 B
  ARM: bcm2835: Add a compat string for bcm2836 machine probe
  ARM: bcm2835: Add Kconfig support for bcm2836

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |   4 +
 arch/arm/Kconfig.debug                             |  10 +-
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |   1 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |   1 +
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |   1 +
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |   1 +
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   2 -
 arch/arm/boot/dts/bcm2835.dtsi                     | 194 +--------------------
 ...{bcm2835-rpi-b-plus.dts => bcm2836-rpi-2-b.dts} |   9 +-
 arch/arm/boot/dts/bcm2836.dtsi                     |  77 ++++++++
 arch/arm/boot/dts/{bcm2835.dtsi => bcm283x.dtsi}   |   7 +-
 arch/arm/mach-bcm/Kconfig                          |   8 +-
 arch/arm/mach-bcm/board_bcm2835.c                  |   5 +
 drivers/irqchip/irq-bcm2836.c                      |  53 +++++-
 15 files changed, 168 insertions(+), 208 deletions(-)
 copy arch/arm/boot/dts/{bcm2835-rpi-b-plus.dts => bcm2836-rpi-2-b.dts} (72%)
 create mode 100644 arch/arm/boot/dts/bcm2836.dtsi
 copy arch/arm/boot/dts/{bcm2835.dtsi => bcm283x.dtsi} (96%)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
