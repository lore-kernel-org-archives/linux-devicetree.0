From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 08/15] irqchip: bcm7120-l2: Eliminate bad IRQ check
Date: Thu, 30 Oct 2014 14:09:25 +0300
Message-ID: <54521C65.8060603@cogentembedded.com>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-9-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-9-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>, arnd@arndb.de, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/30/2014 5:18 AM, Kevin Cernekee wrote:

> This check may be prone to race conditions, e.g.

> 1) Some external event (e.g. GPIO level) causes an IRQ to become pending
> 2) Peripheral asserts the L2 IRQ
> 3) CPU takes an interrupt
> 4) The event from #1 goes away
> 5) bcm7120_l2_intc_irq_handle() reads back a 0 status

> Unlike the hardware supported by brcmstb-l2, the bcm7120-l2 controller
> does not latch the IRQ status.  Bits can change if the inputs to the
> controller change.  Also, do_bad_IRQ() is an ARM-specific macro.

> So let's just nuke it.

> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/irqchip/irq-bcm7120-l2.c | 9 ---------
>   1 file changed, 9 deletions(-)

> diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
> index b9f4fb8..49d8f3d 100644
> --- a/drivers/irqchip/irq-bcm7120-l2.c
> +++ b/drivers/irqchip/irq-bcm7120-l2.c
[...]
> @@ -51,19 +49,12 @@ static void bcm7120_l2_intc_irq_handle(unsigned int irq, struct irq_desc *desc)
>   	chained_irq_enter(chip, desc);
>
>   	status = __raw_readl(b->base + IRQSTAT);
> -
> -	if (status == 0) {
> -		do_bad_IRQ(irq, desc);
> -		goto out;
> -	}
> -
>   	do {

    I think this needs to now become:

	while (status) {

>   		irq = ffs(status) - 1;
>   		status &= ~(1 << irq);

    In case 'status' is 0, 'irq' will be equal to -1. How does the shift by 
negative value work?

>   		generic_handle_irq(irq_find_mapping(b->domain, irq));
>   	} while (status);

WBR, Sergei
