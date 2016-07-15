From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Fri, 15 Jul 2016 09:00:22 +0200
Message-ID: <16178876.fFBuoBSjbd@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <20160714135426.GC31509@io.lakedaemon.net> <5788718E.7080708@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5788718E.7080708@iommu.org>
Sender: linux-clk-owner@vger.kernel.org
To: Wan Zongshun <vw@iommu.org>
Cc: Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, robh@kernel.org, p.zabel@pengutronix.de, Wan Zongshun <mcuos.com@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday, July 15, 2016 1:15:58 PM CEST Wan Zongshun wrote:
> 
> Actually, I have two choice to implement this function:
> 
> option1:
> 
> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
> {
>         u32 hwirq;
> 
>         (void)readl(aic_base + REG_AIC_IPER);
>         hwirq = readl(aic_base + REG_AIC_ISNR);
> 
>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
> }

(side note: I think you want handle_domain_irq())

> option2:
> 
> void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
> {
>         u32 hwirq;
> 
>         hwirq = readl(aic_base + REG_AIC_IPER);
>         hwirq <<= 2;
> 
>         handle_IRQ((irq_find_mapping(aic_domain, hwirq)), regs);
> }
> 
> Though the option2 do shift for hwirq, but it seems better than do io 
> operation by readl,so I prefer to option2, agree?

That will only return an irq number that is a multiple of four, which
seems wrong since the numbers are not that. Did you mean to write

	hwirq = ilog2(hwirq);   ?

That assumes that REG_AIC_IPER contains a 32-bit value with one single
bit set to indicate which IRQ was triggered.

If the difference is only in performance, you could try measuring which
of the two ends up being faster.

	Arnd
