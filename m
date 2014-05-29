From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/11] ARM: Versatile irq and clock DT support
Date: Thu, 29 May 2014 17:40:10 -0500
Message-ID: <1401403221-27523-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This series is some preparation work to fully convert Versatile platform
to DT. This converts the IRQ initialization to DT based init and adds
clocks to the Versatile DT. This doesn't actually enable using common
clock framework, but that is only a matter of removing the old clock
code and enabling the appropriate Kconfig options. This will be done
when Versatile can be completely converted over to DT boot. I have that
working in my tree, but full DT conversion is also dependent on DT PCI
support.

For v2, the all users (i.e. Integrator) of irq-versatile-fpga are 
converted over to use IRQCHIP_DECLARE. The pass-thru feature setup is 
using the compatible string instead of adding a new property.

I've tested Versatile and Integrator under QEMU and Linus Walleij has 
tested an earlier version on Versatile AB h/w.

Linus, This could use testing again on Versatile.

Rob

Rob Herring (11):
  dts: versatile: add missing irq controller properties
  irqchip: versatile-fpga: Add IRQCHIP_DECLARE support
  irqchip: versatile-fpga: add support for arm,versatile-sic
  ARM: integrator: convert to use irqchip_init
  ARM: versatile: remove init_irq hook for DT boot
  dts: versatile: add pl180 compatible strings
  dt/bindings: arm-boards: add binding for Versatile core module
  dt/bindings: add compatible string for versatile osc clock
  ARM: timer-sp: allow getting timer1 clock from DT to fallback to
    legacy clock
  dts: versatile: add clock tree
  clk: versatile: add versatile OSC support

 Documentation/devicetree/bindings/arm/arm-boards   |  6 ++
 .../devicetree/bindings/clock/arm-integrator.txt   |  4 +-
 arch/arm/boot/dts/versatile-ab.dts                 | 81 +++++++++++++++++++++-
 arch/arm/boot/dts/versatile-pb.dts                 | 12 +++-
 arch/arm/common/timer-sp.c                         |  4 +-
 arch/arm/mach-integrator/integrator_ap.c           | 10 +--
 arch/arm/mach-integrator/integrator_cp.c           | 10 +--
 arch/arm/mach-versatile/versatile_dt.c             |  1 -
 drivers/clk/versatile/Makefile                     |  3 +-
 .../{clk-integrator.c => clk-versatile.c}          | 35 +++++++++-
 drivers/irqchip/irq-versatile-fpga.c               | 17 ++++-
 11 files changed, 155 insertions(+), 28 deletions(-)
 rename drivers/clk/versatile/{clk-integrator.c => clk-versatile.c} (66%)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
