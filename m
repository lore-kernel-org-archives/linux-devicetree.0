From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 1/7] irqdomain: Fix irq_domain_alloc_irqs return check.
Date: Mon, 13 Oct 2014 13:11:50 +0100
Message-ID: <543BC186.2050701@arm.com>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com> <1412864980-20273-2-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412864980-20273-2-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, "yingjoe.chen@gmail.com" <yingjoe.chen@gmail.com>, "hc.yen@mediatek.com" <hc.yen@mediatek.com>, "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, "nathan.chung@mediatek.com" <nathan.chung@mediatek.com>, "yh.chen@mediatek.com" <yh.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.co>
List-Id: devicetree@vger.kernel.org

On 09/10/14 15:29, Joe.C wrote:
> From: "Joe.C" <yingjoe.chen@mediatek.com>
> 
> Change virq type from unsigned int to int. Otherwise the return value
> check for irq_domain_alloc_irqs will always pass.
> 
> Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
> ---
>  kernel/irq/irqdomain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 584be46..dd8d3ab 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -469,7 +469,7 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
>  	struct irq_domain *domain;
>  	irq_hw_number_t hwirq;
>  	unsigned int type = IRQ_TYPE_NONE;
> -	unsigned int virq;
> +	int virq;
>  
>  	domain = irq_data->np ? irq_find_host(irq_data->np) : irq_default_domain;
>  	if (!domain) {
> 

I'd expect this patch to get folded into Jiang's series.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
