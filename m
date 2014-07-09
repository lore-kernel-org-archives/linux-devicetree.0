From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/7] ARM: at91: move aic driver to drivers/irqchips
Date: Wed, 9 Jul 2014 18:44:28 +0200
Message-ID: <53BD716C.6080504@atmel.com>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403276487-8792-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/06/2014 17:01, Boris BREZILLON :
> Hello,
> 
> This series moves the AIC driver to the irqchip directory and make use of
> the generic chip framework whenever possible.
> 
> This driver only support DT boards (all legacy board files should be soon
> replaced by their DT versions).
> 
> Best Regards,

I repeat here for clarity:

Boris,
Once the AIC and AIC5 drivers are split, you can add my:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And send the whole series to Jason.

Jason,
like you said in your response to patch #3/7, we can share a topic
branch so that both arm-soc and yourself have this material in our trees
and can go forward with other patch series on top of this one...

Thanks for your work and review. Bye,


> Changes since v2:
>  - remove irq line muxing definition
>  - rework Kconfig options
> 
> Changes since v1:
>  - rework the irq-mux bindings
> 
> Boris BREZILLON (7):
>   genirq: generic chip: export irq_map_generic_chip function
>   irqchip: atmel-aic: move binding doc to interrupt-controller directory
>   irqchip: atmel-aic: add new atmel AIC driver
>   ARM: at91: introduce OLD_IRQ_AT91 Kconfig option
>   ARM: at91: enclose at91_aic_xx calls in
>     IS_ENABLED(CONFIG_OLD_IRQ_AT91) blocks
>   ARM: at91: make use of the new AIC driver for dt enabled boards
>   ARM: at91: remove old irq material
> 
>  .../devicetree/bindings/arm/atmel-aic.txt          |  42 --
>  .../bindings/interrupt-controller/atmel,aic.txt    |  42 ++
>  arch/arm/mach-at91/Kconfig                         |  17 +-
>  arch/arm/mach-at91/Kconfig.non_dt                  |   6 +
>  arch/arm/mach-at91/Makefile                        |   3 +-
>  arch/arm/mach-at91/board-dt-rm9200.c               |  13 -
>  arch/arm/mach-at91/board-dt-sam9.c                 |  13 -
>  arch/arm/mach-at91/board-dt-sama5.c                |  13 -
>  arch/arm/mach-at91/irq.c                           | 270 +-------
>  arch/arm/mach-at91/pm.c                            |  32 +-
>  arch/arm/mach-at91/setup.c                         |   3 +-
>  drivers/irqchip/Kconfig                            |   7 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-atmel-aic.c                    | 700 +++++++++++++++++++++
>  include/linux/irq.h                                |   2 +
>  kernel/irq/generic-chip.c                          |   5 +-
>  16 files changed, 800 insertions(+), 369 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/atmel-aic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
>  create mode 100644 drivers/irqchip/irq-atmel-aic.c
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
