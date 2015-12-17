From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 2/8] irq: bcm2836: Add SMP support for the 2836
Date: Thu, 17 Dec 2015 07:17:42 +0200
Message-ID: <20151217051742.GV2318@tarshish>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
 <1450310115-22163-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1450310115-22163-3-git-send-email-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Ray Jui <rjui@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Andrea Merello <andrea.merello@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Wed, Dec 16, 2015 at 03:55:09PM -0800, Eric Anholt wrote:
> @@ -226,6 +228,26 @@ static const struct irq_domain_ops bcm2836_arm_irqchip_intc_ops = {
>  	.xlate = irq_domain_xlate_onecell
>  };
>  
> +#ifdef CONFIG_SMP

Why not put this section under the existing '#ifdef CONFIG_SMP' just a few 
lines above?

> +int __init bcm2836_smp_boot_secondary(unsigned int cpu,
> +				      struct task_struct *idle)
> +{
> +	unsigned long secondary_startup_phys =
> +		(unsigned long)virt_to_phys((void *)secondary_startup);
> +
> +	dsb();
> +	writel(secondary_startup_phys,
> +	       intc.base + LOCAL_MAILBOX3_SET0 + 16 * cpu);
> +
> +	return 0;
> +}
> +
> +static const struct smp_operations bcm2836_smp_ops __initconst = {
> +	.smp_boot_secondary	= bcm2836_smp_boot_secondary,
> +};
> +
> +#endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
