From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Tue, 12 Feb 2019 08:30:18 -0800
Message-ID: <20190212163018.GL5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212074237.2875-6-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi,

* Lokesh Vutla <lokeshvutla@ti.com> [190212 07:43]:
> +The Interrupt Router (INTR) module provides a mechanism to route M
> +interrupt inputs to N interrupt outputs, where all M inputs are selectable
> +to be driven per N output. There is one register per output (MUXCNTL_N) that
> +controls the selection.
> +
> +
> +                                 Interrupt Router
> +                             +----------------------+
> +                             |  Inputs     Outputs  |
> +        +-------+            | +------+             |
> +        | GPIO  |----------->| | irq0 |             |       Host IRQ
> +        +-------+            | +------+             |      controller
> +                             |    .        +-----+  |      +-------+
> +        +-------+            |    .        |  0  |  |----->|  IRQ  |
> +        | INTA  |----------->|    .        +-----+  |      +-------+
> +        +-------+            |    .          .      |
> +                             | +------+      .      |
> +                             | | irqM |    +-----+  |
> +                             | +------+    |  N  |  |
> +                             |             +-----+  |
> +                             +----------------------+

Is this always one-to-one mapping or can the same interrupt be routed to
multiple targets like to the SoC and some coprocessor?

> +Configuration of these MUXCNTL_N registers is done by a system controller
> +(like the Device Memory and Security Controller on K3 AM654 SoC). System
> +controller will keep track of the used and unused registers within the Router.
> +Driver should request the system controller to get the range of GIC IRQs
> +assigned to the requesting hosts. It is the drivers responsibility to keep
> +track of Host IRQs.
> +
> +Communication between the host processor running an OS and the system
> +controller happens through a protocol called TI System Control Interface
> +(TISCI protocol). For more details refer:
> +Documentation/devicetree/bindings/arm/keystone/ti,sci.txt

Care to describe a bit why the interrupts need to be routed by a system
controller?

Regards,

Tony
