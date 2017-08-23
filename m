From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] irqchip: uniphier-aidet: add UniPhier AIDET irqchip
 driver
Date: Wed, 23 Aug 2017 09:01:10 +0100
Message-ID: <5dfc1478-c558-eb6d-6a82-a9ca23851bcd@arm.com>
References: <1503451907-21535-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503451907-21535-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/08/17 02:31, Masahiro Yamada wrote:
> UniPhier SoCs contain AIDET (ARM Interrupt Detector).  This is intended
> to provide additional features that are not covered by GIC.  The main
> purpose is to provide logic inverter to support low level and falling
> edge trigger types for interrupt lines from on-board devices.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes in v3:
>   - Use irq_domain_create_hierarchy() instead of legacy
>     irq_domain_add_hierarchy()
>   - Add .irq_set_affinity hook
>   - Pass proper trigger type to parent
> 
> Changes in v2:
>   - Use readl/write_relaxed instead of readl/writel
>   - Move val = 0 for code symmetry
>   - .alloc() hook only supports nr_irqs==1 case
>   - Move struct irq_chip to static data because this driver expects
>     only one device instance in the system
>   - Match the interrupt number to SPI of GIC to make DT binding clearer
>     (register offset starts from 0x4)
> 
>  .../socionext,uniphier-aidet.txt                   |  32 +++
>  MAINTAINERS                                        |   1 +
>  drivers/irqchip/Kconfig                            |   8 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-uniphier-aidet.c               | 261 +++++++++++++++++++++
>  5 files changed, 303 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/socionext,uniphier-aidet.txt
>  create mode 100644 drivers/irqchip/irq-uniphier-aidet.c
Queued for 4.14.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
