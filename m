From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/7] irqchip: atmel-aic: add new atmel AIC driver
Date: Thu, 26 Jun 2014 22:20:24 +0200
Message-ID: <53AC8088.6020905@free-electrons.com>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com> <1403276487-8792-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403276487-8792-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 20/06/2014 17:01, Boris BREZILLON wrote:
> Add new atmel AIC (Advanced Interrupt Controller) driver based on the
> generic chip infrastructure.
>
> This driver is only compatible with dt enabled board and replaces the old
> implementation found in arch/arm/mach-at91/irq.c.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/irqchip/Kconfig         |   7 +
>  drivers/irqchip/Makefile        |   1 +
>  drivers/irqchip/irq-atmel-aic.c | 700 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 708 insertions(+)
>  create mode 100644 drivers/irqchip/irq-atmel-aic.c
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index bbb746e..6a7ad81 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -30,6 +30,13 @@ config ARM_VIC_NR
>  	  The maximum number of VICs available in the system, for
>  	  power management.
>  
> +config ATMEL_AIC_IRQ
> +	bool
> +	select GENERIC_IRQ_CHIP
> +	select IRQ_DOMAIN
> +	select MULTI_IRQ_HANDLER
> +	select SPARSE_IRQ
> +

I just though a bit about it and it might be better to split AIC and
AIC5 support in 2 different drivers, because the AIC is only available
on at91sam9/at91rm9200 SoCs and AIC5 only available on sama5 SoCs, and
AFAICT there is no combination of both controller in a singler SoC.

Jason, Thomas, let me know if you think this worth the trouble, and if
so, should I keep a common implementation (in irq-atmel-aic-common.c/.h)
for the shared functions/structures.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
