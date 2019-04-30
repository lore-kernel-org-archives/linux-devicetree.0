From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v8 00/14] Add support for TISCI Interrupt controller
 drivers
Date: Tue, 30 Apr 2019 06:45:12 -0500
Message-ID: <20190430114512.pde3uuh5e3qwve3m@kahuna>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190430101230.21794-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, jason@lakedaemon.net, Device Tree Mailing List <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linus.walleij@linaro.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 15:42-20190430, Lokesh Vutla wrote:
[...]
> Changes since v7:
> - Rebased on top of latest master.
> - Each patch has respective changes mentioned.
> 
> Grygorii Strashko (1):
>   firmware: ti_sci: Add support to get TISCI handle using of_phandle
> 
> Lokesh Vutla (12):
>   firmware: ti_sci: Add support for RM core ops
>   firmware: ti_sci: Add support for IRQ management
>   firmware: ti_sci: Add helper apis to manage resources
>   genirq: Introduce irq_chip_{request,release}_resource_parent() apis
>   gpio: thunderx: Use the default parent apis for
>     {request,release}_resources
>   dt-bindings: irqchip: Introduce TISCI Interrupt router bindings
>   irqchip: ti-sci-intr: Add support for Interrupt Router driver
>   dt-bindings: irqchip: Introduce TISCI Interrupt Aggregator bindings
>   irqchip: ti-sci-inta: Add support for Interrupt Aggregator driver
>   soc: ti: Add MSI domain bus support for Interrupt Aggregator
>   irqchip: ti-sci-inta: Add msi domain support
>   arm64: arch_k3: Enable interrupt controller drivers
> 
> Peter Ujfalusi (1):
>   firmware: ti_sci: Add RM mapping table for am654
> 

For patches 1..5 (Firmware patches):

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
