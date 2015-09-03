From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: set missing irq ack handler for
 ar7100-misc-intc irq chip
Date: Thu, 3 Sep 2015 10:32:45 +0200
Message-ID: <20150903103245.21dc9dd7@avionic-0020>
References: <1441251262-13335-1-git-send-email-lynxis@fe80.eu>
	<1441251262-13335-2-git-send-email-lynxis@fe80.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441251262-13335-2-git-send-email-lynxis-qyMx1GtpvWw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Cc: Alban <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  3 Sep 2015 05:34:21 +0200
Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org> wrote:

> The irq ack handler was forgotten while introducing OF support.
> Only ar71xx and ar933x based devices require it.
> 
> Signed-off-by: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
> ---
>  arch/mips/ath79/irq.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
> index afb0096..1917f55 100644
> --- a/arch/mips/ath79/irq.c
> +++ b/arch/mips/ath79/irq.c
> @@ -308,8 +308,17 @@ static int __init ath79_misc_intc_of_init(
>  
>  	return 0;
>  }
> -IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
> -		ath79_misc_intc_of_init);
> +
> +static int __init ar7100_misc_intc_of_init(
> +	struct device_node *node, struct device_node *parent)
> +{
> +	pr_info("IRQ: Setup ar7100 misc IRQ controller from devicetree.\n");

Debug left over?

> +	ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
> +	return ath79_misc_intc_of_init(node, parent);
> +}
> +
> +IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
> +		ar7100_misc_intc_of_init);
>  
>  static int __init ar79_cpu_intc_of_init(
>  	struct device_node *node, struct device_node *parent)

Otherwise that looks good.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
