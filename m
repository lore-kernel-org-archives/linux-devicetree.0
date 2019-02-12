From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 00/10] Add support for TISCI irqchip drivers
Date: Tue, 12 Feb 2019 13:12:27 +0530
Message-ID: <20190212074237.2875-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

TI AM65x SoC based on K3 architecture introduced support for Events
which are message based interrupts with minimal latency. These events
are not compatible with regular interrupts and are valid only through
an event transport lane. An Interrupt Aggregator(INTA) is introduced
to convert these events to interrupts. INTA can also group 64 events
into a single interrupt. Now the SoC has many peripherals and a large
number of event sources (time sync or DMA), the use of events is
completely dependent on a user's specific application, which drives a
need for maximum flexibility in which event sources are used in the
system. It is also completely up to software control as to how the
events are serviced.

Because of the huge flexibility there are certain standard peripherals
(like GPIO etc)where all interrupts cannot be directly corrected to host
interrupt controller. For this purpose, Interrupt Router(INTR) is
introduced in the SoC. INTR just does a classic interrupt redirection.

So the SoC has 3 types of interrupt controllers:
- GIC500
- Interrupt Router
- Interrupt Aggregator

Below is a diagrammatic view of how SoC integration of these interrupt
controllers:(https://pastebin.ubuntu.com/p/9ngV3jdGj2/)

Device Index-x               Device Index-y
           |                         |
           |                         |
                      ....
            \                       /
             \                     /
              \  (global events)  /
          +---------------------------+   +---------+
          |                           |   |         |
          |             INTA          |   |  GPIO   |
          |                           |   |         |
          +---------------------------+   +---------+
                         |   (vint)            |
                         |                     |
                        \|/                    |
          +---------------------------+        |
          |                           |<-------+
          |           INTR            |
          |                           |
          +---------------------------+
                         |
                         |
                        \|/ (gic irq)
          +---------------------------+
          |                           |
          |             GIC           |
          |                           |
          +---------------------------+

While at it, TISCI abstracts the handling of all above IRQ routes where
interrupt sources are not directly connected to host interrupt controller.
That would be configuration of Interrupt Aggregator and Interrupt Router.

This series adds support for:
- TISCI commands needed for IRQ configuration
- Interrupt Router(INTR) and Interrupt Aggregator(INTA) drivers

Changes since v4:
- Mentioned the changes in each patch

Changes since v3:
- Fix documentation for Interrupt Router driver
- Rebased on top of latest next.
- Fully tested with DMA(using out of tree patches)
- Fixed a build error with allmodconfig


Grygorii Strashko (1):
  firmware: ti_sci: Add support to get TISCI handle using of_phandle

Lokesh Vutla (8):
  firmware: ti_sci: Add support for RM core ops
  firmware: ti_sci: Add support for IRQ management
  dt-bindings: irqchip: Introduce TISCI Interrupt router bindings
  irqchip: ti-sci-intr: Add support for Interrupt Router driver
  dt-bindings: irqchip: Introduce TISCI Interrupt Aggregator bindings
  irqchip: ti-sci-inta: Add support for Interrupt Aggregator driver
  soc: ti: Add MSI domain support for K3 Interrupt Aggregator
  soc: ti: am6: Enable interrupt controller drivers

Peter Ujfalusi (1):
  firmware: ti_sci: Add RM mapping table for am654

 .../bindings/arm/keystone/ti,sci.txt          |   3 +-
 .../interrupt-controller/ti,sci-inta.txt      |  74 +++
 .../interrupt-controller/ti,sci-intr.txt      |  85 +++
 MAINTAINERS                                   |   6 +
 drivers/firmware/ti_sci.c                     | 536 ++++++++++++++++++
 drivers/firmware/ti_sci.h                     | 102 ++++
 drivers/irqchip/Kconfig                       |  23 +
 drivers/irqchip/Makefile                      |   2 +
 drivers/irqchip/irq-ti-sci-common.c           | 131 +++++
 drivers/irqchip/irq-ti-sci-common.h           |  59 ++
 drivers/irqchip/irq-ti-sci-inta.c             | 531 +++++++++++++++++
 drivers/irqchip/irq-ti-sci-intr.c             | 315 ++++++++++
 drivers/soc/ti/Kconfig                        |  11 +
 drivers/soc/ti/Makefile                       |   1 +
 drivers/soc/ti/k3_inta_msi.c                  | 143 +++++
 include/linux/irqdomain.h                     |   1 +
 include/linux/msi.h                           |   7 +
 include/linux/soc/ti/k3_inta_msi.h            |  21 +
 include/linux/soc/ti/ti_sci_protocol.h        |  72 +++
 19 files changed, 2122 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 drivers/irqchip/irq-ti-sci-common.c
 create mode 100644 drivers/irqchip/irq-ti-sci-common.h
 create mode 100644 drivers/irqchip/irq-ti-sci-inta.c
 create mode 100644 drivers/irqchip/irq-ti-sci-intr.c
 create mode 100644 drivers/soc/ti/k3_inta_msi.c
 create mode 100644 include/linux/soc/ti/k3_inta_msi.h

-- 
2.19.2
