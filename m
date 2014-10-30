From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V2 03/15] genirq: Generic chip: Move irq_reg_{readl,writel}
 accessors into generic-chip.c
Date: Thu, 30 Oct 2014 09:43:02 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410300941290.5308@nanos>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-4-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-4-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: arnd@arndb.de, f.fainelli@gmail.com, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Oct 2014, Kevin Cernekee wrote:

> This allows us to implement per-irqchip behavior when necessary, instead
> of hardcoding the behavior for all irqchip drivers at compile time.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  include/linux/irq.h       |  7 -------
>  kernel/irq/generic-chip.c | 10 ++++++++++
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 03f48d9..8049e93 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -639,13 +639,6 @@ void arch_teardown_hwirq(unsigned int irq);
>  void irq_init_desc(unsigned int irq);
>  #endif
>  
> -#ifndef irq_reg_writel
> -# define irq_reg_writel(val, addr)	writel(val, addr)
> -#endif
> -#ifndef irq_reg_readl
> -# define irq_reg_readl(addr)		readl(addr)
> -#endif
> -

Brilliant patch that.

# git grep -l irq_reg_readl drivers/irqchip/
drivers/irqchip/irq-atmel-aic.c
drivers/irqchip/irq-atmel-aic5.c
drivers/irqchip/irq-sunxi-nmi.c
drivers/irqchip/irq-tb10x.c

Thanks,

	tglx
