From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH v2 0/4] Add bcm2835aux interrupt controller
Date: Mon, 12 Jun 2017 15:25:02 +0100
Message-ID: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Devices in the BCM2835 AUX block share a common interrupt line, with a
register indicating which devices have active IRQs. Expose this as a
nested interrupt controller to avoid IRQ sharing problems (easily
observed if UART1 and SPI1/2 are enabled simultaneously).

This patch set is complicated by the fact that the DT node for the AUX
clock controller includes the AUXIRQ register needed by this driver.
Patch 1 lays the groundwork by allowing this overlap and preparing for
a future DT change that removes it.

Changes in v2:
* Add DT bindings and header file for bcm2835-aux-intc.
* Split the interrupt-controller functionality into a dedicated irqchip
  driver with a dedicated DT node.
* Remove mask tracking from the intc driver, so that all interrupts
  (including spurious ones) are submitted to the IRQ framework.
* Replace hard-coded masks with BIT macro in the intc driver.
* Prepare the AUX clock driver for a time when its DT node may only be
  a single word register, but until then ioremap its region without
  reserving it to permit sharing.

Phil Elwell (4):
  clk: bcm2835: More flexible IO register remapping
  dt: bindings: Add bindings for bcm2835-aux-intc
  irqchip: Add BCM2835 AUX interrupt controller
  ARM: dts: bcm283x: Add and use bcm2835-aux-intc

 .../interrupt-controller/brcm,bcm2835-aux-intc.txt |  28 ++++
 arch/arm/boot/dts/bcm283x.dtsi                     |  27 +++-
 drivers/clk/bcm/clk-bcm2835-aux.c                  |  20 ++-
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-bcm2835-aux.c                  | 155 +++++++++++++++++++++
 .../interrupt-controller/bcm2835-aux-intc.h        |  20 +++
 6 files changed, 243 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
 create mode 100644 drivers/irqchip/irq-bcm2835-aux.c
 create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
