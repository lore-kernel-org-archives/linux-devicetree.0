From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 06/19] irqchip/mmp: add missing chained_irq_{enter,exit}()
Date: Fri, 9 Aug 2019 11:56:21 +0100
Message-ID: <319ebbbc-2231-42c9-faec-731ad81eb485@kernel.org>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-7-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-7-lkundrak@v3.sk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/08/2019 10:31, Lubomir Rintel wrote:
> The lack of chained_irq_exit() leaves the muxed interrupt masked on MMP3.
> For reasons unknown this is not a problem on MMP2.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/irqchip/irq-mmp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
> index af9cba4a51c2e..cd8d2253f56d1 100644
> --- a/drivers/irqchip/irq-mmp.c
> +++ b/drivers/irqchip/irq-mmp.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> @@ -132,11 +133,14 @@ struct irq_chip icu_irq_chip = {
>  static void icu_mux_irq_demux(struct irq_desc *desc)
>  {
>  	unsigned int irq = irq_desc_get_irq(desc);
> +	struct irq_chip *chip = irq_get_chip(irq);

Consider using irq_desc_get_chip() instead, which avoids going through
the irq->desc again.

>  	struct irq_domain *domain;
>  	struct icu_chip_data *data;
>  	int i;
>  	unsigned long mask, status, n;
>  
> +	chained_irq_enter(chip, desc);
> +
>  	for (i = 1; i < max_icu_nr; i++) {
>  		if (irq == icu_data[i].cascade_irq) {
>  			domain = icu_data[i].domain;
> @@ -146,7 +150,7 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
>  	}
>  	if (i >= max_icu_nr) {
>  		pr_err("Spurious irq %d in MMP INTC\n", irq);
> -		return;
> +		goto out;
>  	}
>  
>  	mask = readl_relaxed(data->reg_mask);
> @@ -158,6 +162,9 @@ static void icu_mux_irq_demux(struct irq_desc *desc)
>  			generic_handle_irq(icu_data[i].virq_base + n);
>  		}
>  	}
> +
> +out:
> +	chained_irq_exit(chip, desc);
>  }
>  
>  static int mmp_irq_domain_map(struct irq_domain *d, unsigned int irq,
> 

Otherwise looks OK.

	M.
-- 
Jazz is not dead, it just smells funny...
