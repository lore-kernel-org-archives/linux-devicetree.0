From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v4 00/13] Add support for TISCI irqchip drivers
Date: Wed, 2 Jan 2019 13:58:39 +0200
Message-ID: <cd50afd7-f093-b2a3-e567-f76af91db76c@ti.com>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227060829.5080-1-lokeshvutla@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 27/12/2018 8.08, Lokesh Vutla wrote:
> TI AM65x SoC based on K3 architecture, introduced support for Events
> which are message based interrupts with minimal latency. These events
> are not compatible with regular interrupts and are valid only through
> an event transport lane. An Interrupt Aggregator(INTA) is introduced
> to convert these events to interrupts. INTA can also group 64 events
> into a single interrupt. Now the SoC has many peripherals and a large
> number of event sources (time sync or DMA), the use of events is
> completely dependent on a user's specific application, which drives a
> need for maximum flexibility in which event sources are used in the
> system. It is also completely up to software control as to how the
> events are serviced.
> 
> Because of the huge flexibility there are certain standard peripherals
> (like GPIO etc)where all interrupts cannot be directly corrected to host
> interrupt controller. For this purpose, Interrupt Router(INTR) is
> introduced in the SoC. INTR just does a classic interrupt redirection.
> 
> So the SoC has 3 types of interrupt controllers:
> - GIC500
> - Interrupt Router
> - Interrupt Aggregator
> 
> Below is a diagrammatic view of how SoC integration of these interrupt
> controllers:(https://pastebin.ubuntu.com/p/9ngV3jdGj2/)
> 
> Device Index-x               Device Index-y
>            |                         |
>            |                         |
>                       ....
>             \                       /
>              \                     /
>               \  (global events)  /
>           +---------------------------+   +---------+
>           |                           |   |         |
>           |             INTA          |   |  GPIO   |
>           |                           |   |         |
>           +---------------------------+   +---------+
>                          |   (vint)            |
>                          |                     |
>                         \|/                    |
>           +---------------------------+        |
>           |                           |<-------+
>           |           INTR            |
>           |                           |
>           +---------------------------+
>                          |
>                          |
>                         \|/ (gic irq)
>           +---------------------------+
>           |                           |
>           |             GIC           |
>           |                           |
>           +---------------------------+
> 
> While at it, TISCI abstracts the handling of all above IRQ routes where
> interrupt sources are not directly connected to host interrupt controller.
> That would be configuration of Interrupt Aggregator and Interrupt Router.
> 
> This series adds support for:
> - TISCI commands needed for IRQ configuration
> - Interrupt Router(INTR) and Interrupt Aggregator(INTA) drivers

With the compilation fix to drivers/irqchip/irq-ti-sci-inta.c dmatest
and audio works with the series:

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Changes since v3:
> - Fix documentation for Interrupt Router driver
> - Rebased on top of latest next.
> - Fully tested with DMA(using out of tree patches)
> - Fixed a build error with allmodconfig
> 
> Grygorii Strashko (1):
>   firmware: ti_sci: Add support to get TISCI handle using of_phandle
> 
> Lokesh Vutla (11):
>   firmware: ti_sci: Add support for RM core ops
>   firmware: ti_sci: Add support for IRQ management
>   firmware: ti_sci: Add helper apis to manage resources
>   dt-bindings: irqchip: Introduce TISCI Interrupt router bindings
>   irqchip: ti-sci-intr: Add support for Interrupt Router driver
>   genirq/msi: Add support for allocating single MSI for a device
>   genirq/msi: Add support for .msi_unprepare callback
>   soc: ti: Add MSI domain support for K3 Interrupt Aggregator
>   dt-bindings: irqchip: Introduce TISCI Interrupt Aggregator bindings
>   irqchip: ti-sci-inta: Add support for Interrupt Aggregator driver
>   soc: ti: am6: Enable interrupt controller drivers
> 
> Peter Ujfalusi (1):
>   firmware: ti_sci: Add RM mapping table for am654
> 
>  .../bindings/arm/keystone/ti,sci.txt          |   3 +-
>  .../interrupt-controller/ti,sci-inta.txt      |  74 ++
>  .../interrupt-controller/ti,sci-intr.txt      |  85 ++
>  MAINTAINERS                                   |   4 +
>  drivers/firmware/ti_sci.c                     | 848 ++++++++++++++++++
>  drivers/firmware/ti_sci.h                     | 102 +++
>  drivers/irqchip/Kconfig                       |  23 +
>  drivers/irqchip/Makefile                      |   2 +
>  drivers/irqchip/irq-ti-sci-inta.c             | 561 ++++++++++++
>  drivers/irqchip/irq-ti-sci-intr.c             | 310 +++++++
>  drivers/soc/ti/Kconfig                        |  11 +
>  drivers/soc/ti/Makefile                       |   1 +
>  drivers/soc/ti/k3_inta_msi.c                  | 193 ++++
>  include/linux/irqdomain.h                     |   1 +
>  include/linux/msi.h                           |  12 +
>  include/linux/soc/ti/k3_inta_msi.h            |  22 +
>  include/linux/soc/ti/ti_sci_protocol.h        | 169 ++++
>  kernel/irq/msi.c                              |  72 +-
>  18 files changed, 2470 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>  create mode 100644 drivers/irqchip/irq-ti-sci-inta.c
>  create mode 100644 drivers/irqchip/irq-ti-sci-intr.c
>  create mode 100644 drivers/soc/ti/k3_inta_msi.c
>  create mode 100644 include/linux/soc/ti/k3_inta_msi.h
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
