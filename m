From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 0/3] ARM: bcm2836: Move SMP startup code to arch/arm
Date: Mon,  7 Aug 2017 00:32:08 +0200
Message-ID: <1502058731-12462-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series move the SMP startup code of BCM2836 and
BCM2837 to the right place. There was already a patch from Marc Zyngier [1],
but it breaks SMP for RPI 3 on 32-bit (other cores stays offline).

I based my patch series on Marc's patch with the following changes:
 * define enable-method and use it in the dts files
 * place SMP code into platsmp.c
 * rename bcm2836_smp_boot_secondary() to bcm2836_boot_secondary()
 * use of_find_compatible_node() instead of of_find_matching_node()

This series requires the patch "ARM: dts: bcm283x: Move the BCM2837
DT contents from arm64 to arm."

[1] - https://patchwork.kernel.org/patch/9719845/

Stefan Wahren (3):
  dt-bindings: arm: add SMP enable-method for BCM2836
  ARM: dts: bcm283x: Add 32-bit enable method for SMP
  irqchip: bcm2836: Move SMP startup code to arch/arm

 Documentation/devicetree/bindings/arm/cpus.txt |  1 +
 arch/arm/boot/dts/bcm2836.dtsi                 |  1 +
 arch/arm/boot/dts/bcm2837.dtsi                 |  1 +
 arch/arm/mach-bcm/Makefile                     |  3 +
 arch/arm/mach-bcm/platsmp.c                    | 35 ++++++++++++
 drivers/irqchip/irq-bcm2836.c                  | 79 +-------------------------
 include/linux/irqchip/irq-bcm2836.h            | 70 +++++++++++++++++++++++
 7 files changed, 113 insertions(+), 77 deletions(-)
 create mode 100644 include/linux/irqchip/irq-bcm2836.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
