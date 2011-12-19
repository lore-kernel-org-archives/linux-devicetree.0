From: "Cousson, Benoit" <b-cousson@ti.com>
Subject: Re: [PATCH 2/9] irq: check domain hwirq range for DT translate
Date: Mon, 19 Dec 2011 13:41:52 +0100
Message-ID: <4EEF3110.30203@ti.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-3-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Barry Song <baohua.song@csr.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Rob,

While trying your series to take advantage of the generic-irq domain 
support for OMAP3 INTC, I realized that the following patch is breaking 
drivers that are using irq_domain_add_simple.

The point is that irq_domain_add_simple does not populate hwirq_base or 
nr_irq, so that test will always fail if the domain is created by the 
irq_domain_add_simple API.

Adding an extra parameter to provide the nr_irq should fix that.

The long term fix should be to use the generic-irq for such driver, but 
this is not the same effort, so it might worth fixing that API for the 
moment.

Regards,
Benoit

On 12/14/2011 4:28 PM, Rob Herring wrote:
> From: Rob Herring<rob.herring@calxeda.com>
>
> A DT node may have more than 1 domain associated with it, so make sure
> the hwirq number is within range when doing DT translation.
>
> Signed-off-by: Rob Herring<rob.herring@calxeda.com>
> Cc: Thomas Gleixner<tglx@linutronix.de>
> ---
>   kernel/irq/irqdomain.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 200ce83..ae6441e 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -135,6 +135,9 @@ int irq_domain_simple_dt_translate(struct irq_domain *d,
>   		return -EINVAL;
>   	if (intsize<  1)
>   		return -EINVAL;
> +	if ((intspec[0]<  d->hwirq_base) ||
> +	    (intspec[0]>= d->hwirq_base + d->nr_irq))
> +		return -EINVAL;
>
>   	*out_hwirq = intspec[0];
>   	*out_type = IRQ_TYPE_NONE;
