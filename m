From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10] ARM: Versatile irq and clock DT support
Date: Tue, 20 May 2014 16:09:26 -0500
Message-ID: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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

I've tested under QEMU and Linus Walleij has tested an earlier version 
on Versatile AB h/w.

Rob

Rob Herring (10):
  dt/bindings: add passthru-mask property to versatile-fpga-irq
  dts: versatile: add missing irq controller properties
  irqchip: versatile-fpga: add pass-thru enable support
  irqchip: versatile-fpga: add DT init
  ARM: versatile: remove init_irq hook for DT boot
  dts: versatile: add pl180 compatible strings
  dt/bindings: arm-boards: add binding for Versatile core module
  dt/bindings: add compatible string for versatile osc clock
  dts: versatile: add clock tree
  clk: versatile: add versatile OSC support

 Documentation/devicetree/bindings/arm/arm-boards   |  6 ++
 .../devicetree/bindings/arm/versatile-fpga-irq.txt |  3 +
 .../devicetree/bindings/clock/arm-integrator.txt   |  4 +-
 arch/arm/boot/dts/versatile-ab.dts                 | 81 +++++++++++++++++++++-
 arch/arm/boot/dts/versatile-pb.dts                 | 12 +++-
 arch/arm/mach-versatile/versatile_dt.c             |  1 -
 drivers/clk/versatile/Makefile                     |  3 +-
 drivers/clk/versatile/clk-integrator.c             | 35 +++++++++-
 drivers/irqchip/irq-versatile-fpga.c               |  9 +++
 9 files changed, 145 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
