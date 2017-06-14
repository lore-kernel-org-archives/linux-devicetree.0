From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 0/4] Add bcm2835aux interrupt controller
Date: Wed, 14 Jun 2017 17:29:06 +0100
Message-ID: <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Devices in the AUX block share a common interrupt line, with a register
indicating which devices have active IRQs. Expose this as a nested
interrupt controller to avoid IRQ sharing problems (easily observed if
UART1 and SPI1/2 are enabled simultaneously).

There was a suggestion that this driver is unnecessary and that it
should be left to IRQ sharing, but the use of AUXIRQ is meant to
be an optimisation to avoid having to poll all of the peripherals.

This patch set is complicated by the fact that the DT node for the AUX
clock controller includes the AUXIRQ register needed by this driver.
Patch 1 lays the groundwork by allowing this overlap and preparing for
a future DT change that removes it.

Changes in v3:
* Expanded comment on the remapping logic (patch 1).
* Removed explicit "Valid values" in dt bindings (patch 2).
* Added Reviewed-by: (patch 2).
* Moved irq_set_chip_and_handler into .map method (patch 3).
* Set IRQ type to TYPE_LEVEL_HIGH.

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

