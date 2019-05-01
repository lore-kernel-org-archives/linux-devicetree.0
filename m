From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 00/14] Add support for TISCI Interrupt controller
 drivers
Date: Wed, 1 May 2019 18:53:41 +0530
Message-ID: <7edd8582-ce51-60a0-24e1-c45fe6725705@ti.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
 <30f5c877-a4dc-8ad9-0ad0-c172a60dc853@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30f5c877-a4dc-8ad9-0ad0-c172a60dc853@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On 01/05/19 5:28 PM, Marc Zyngier wrote:
> On 30/04/2019 11:12, Lokesh Vutla wrote:
>> TI AM65x SoC based on K3 architecture introduced support for Events
>> which are message based interrupts with minimal latency. These events
>> are not compatible with regular interrupts and are valid only through
>> an event transport lane. An Interrupt Aggregator(INTA) is introduced
>> to convert these events to interrupts. INTA can also group 64 events
>> into a single interrupt. Now the SoC has many peripherals and a large
>> number of event sources (time sync or DMA), the use of events is
>> completely dependent on a user's specific application, which drives a
>> need for maximum flexibility in which event sources are used in the
>> system. It is also completely up to software control as to how the
>> events are serviced.
>>
>> Because of the huge flexibility there are certain standard peripherals
>> (like GPIO etc)where all interrupts cannot be directly corrected to host
>> interrupt controller. For this purpose, Interrupt Router(INTR) is
>> introduced in the SoC. INTR just does a classic interrupt redirection.
>>
>> So the SoC has 3 types of interrupt controllers:
>> - GIC500
>> - Interrupt Router
>> - Interrupt Aggregator
>>
>> Below is a diagrammatic view of how SoC integration of these interrupt
>> controllers:(https://pastebin.ubuntu.com/p/9ngV3jdGj2/)
>>
>> Device Index-x               Device Index-y
>>            |                         |
>>            |                         |
>>                       ....
>>             \                       /
>>              \                     /
>>               \  (global events)  /
>>           +---------------------------+   +---------+
>>           |                           |   |         |
>>           |             INTA          |   |  GPIO   |
>>           |                           |   |         |
>>           +---------------------------+   +---------+
>>                          |   (vint)            |
>>                          |                     |
>>                         \|/                    |
>>           +---------------------------+        |
>>           |                           |<-------+
>>           |           INTR            |
>>           |                           |
>>           +---------------------------+
>>                          |
>>                          |
>>                         \|/ (gic irq)
>>           +---------------------------+
>>           |                           |
>>           |             GIC           |
>>           |                           |
>>           +---------------------------+
>>
>> While at it, TISCI abstracts the handling of all above IRQ routes where
>> interrupt sources are not directly connected to host interrupt controller.
>> That would be configuration of Interrupt Aggregator and Interrupt Router.
>>
>> This series adds support for:
>> - TISCI commands needed for IRQ configuration
>> - Interrupt Router(INTR) driver.
>> - Interrupt Aggregator(INTA) driver.
>> - Interrupt Aggregator MSI bus layer.
>>
>> Marc,
>> 	As discussed offline, the firmware changes are going to come within
>> 	a day or so. These changes are tested against local binary which is
>> 	bound to release.
>>
>> Boot Log: https://pastebin.ubuntu.com/p/YwprMKXdg4/
>>
>> Changes since v7:
>> - Rebased on top of latest master.
>> - Each patch has respective changes mentioned.
>>
>> Grygorii Strashko (1):
>>   firmware: ti_sci: Add support to get TISCI handle using of_phandle
>>
>> Lokesh Vutla (12):
>>   firmware: ti_sci: Add support for RM core ops
>>   firmware: ti_sci: Add support for IRQ management
>>   firmware: ti_sci: Add helper apis to manage resources
>>   genirq: Introduce irq_chip_{request,release}_resource_parent() apis
>>   gpio: thunderx: Use the default parent apis for
>>     {request,release}_resources
>>   dt-bindings: irqchip: Introduce TISCI Interrupt router bindings
>>   irqchip: ti-sci-intr: Add support for Interrupt Router driver
>>   dt-bindings: irqchip: Introduce TISCI Interrupt Aggregator bindings
>>   irqchip: ti-sci-inta: Add support for Interrupt Aggregator driver
>>   soc: ti: Add MSI domain bus support for Interrupt Aggregator
>>   irqchip: ti-sci-inta: Add msi domain support
>>   arm64: arch_k3: Enable interrupt controller drivers
>>
>> Peter Ujfalusi (1):
>>   firmware: ti_sci: Add RM mapping table for am654
>>
>>  .../bindings/arm/keystone/ti,sci.txt          |   3 +-
>>  .../interrupt-controller/ti,sci-inta.txt      |  66 ++
>>  .../interrupt-controller/ti,sci-intr.txt      |  82 +++
>>  MAINTAINERS                                   |   6 +
>>  arch/arm64/Kconfig.platforms                  |   5 +
>>  drivers/firmware/ti_sci.c                     | 651 ++++++++++++++++++
>>  drivers/firmware/ti_sci.h                     | 102 +++
>>  drivers/gpio/gpio-thunderx.c                  |  16 +-
>>  drivers/irqchip/Kconfig                       |  23 +
>>  drivers/irqchip/Makefile                      |   2 +
>>  drivers/irqchip/irq-ti-sci-inta.c             | 615 +++++++++++++++++
>>  drivers/irqchip/irq-ti-sci-intr.c             | 275 ++++++++
>>  drivers/soc/ti/Kconfig                        |   6 +
>>  drivers/soc/ti/Makefile                       |   1 +
>>  drivers/soc/ti/ti_sci_inta_msi.c              | 146 ++++
>>  include/linux/irq.h                           |   2 +
>>  include/linux/irqdomain.h                     |   1 +
>>  include/linux/msi.h                           |  10 +
>>  include/linux/soc/ti/ti_sci_inta_msi.h        |  23 +
>>  include/linux/soc/ti/ti_sci_protocol.h        | 124 ++++
>>  kernel/irq/chip.c                             |  27 +
>>  21 files changed, 2173 insertions(+), 13 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>>  create mode 100644 drivers/irqchip/irq-ti-sci-inta.c
>>  create mode 100644 drivers/irqchip/irq-ti-sci-intr.c
>>  create mode 100644 drivers/soc/ti/ti_sci_inta_msi.c
>>  create mode 100644 include/linux/soc/ti/ti_sci_inta_msi.h
> 
> Lokesh,
> 
> Thanks for having respun this quickly.
> 
> I've applied the first 13 patches to irqchip-next (after tidying up some
> of the commit messages). I've left the last patch for armsoc to take,
> unless you guys insist on me taking it.

I prefer if everything goes as a single bundle, unless arm-soc maintainers
object. Want to start posting DT nodes.

> 
> If nothing horrible appears in -next tomorrow, I'll send the 5.2 PR with
> this series.

Awesome.

> 
> Hopefully we won't see more of this madness any time soon... :-/

IRQCHIP is one part of it. Fun is yet to start with DMA.

Thanks and regards,
Lokesh
