From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 01/11] irqchip: Allow irq_reg_{readl,writel} to use
 __raw_{readl_writel}
Date: Wed, 29 Oct 2014 20:10:07 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410292007080.5308@nanos>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <11255905.1JsQYcArO7@wuerfel> <CAJiQ=7BcVH52-PCo40dSEoNHjT1Pg8X88uq-KZ6tQPKYWaM94A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiQ=7BcVH52-PCo40dSEoNHjT1Pg8X88uq-KZ6tQPKYWaM94A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 Oct 2014, Kevin Cernekee wrote:
> Thomas:
> > How does that work with multi arch kernels?
> 
> I am assuming this question refers to e.g. CONFIG_ARCH_MULTIPLATFORM
> 
> If GENERIC_IRQ_CHIP is being used, the current implementation of
> generic-chip.c will have to pick one global definition of
> irq_reg_{readl,writel} for all supported SoCs.
> 
> One possibility is that individual irqchip drivers requiring special
> accessors can pass in their own function pointers, similar to this:
> 
> struct sdhci_ops {
> #ifdef CONFIG_MMC_SDHCI_IO_ACCESSORS
> u32 (*read_l)(struct sdhci_host *host, int reg);
> u16 (*read_w)(struct sdhci_host *host, int reg);
> u8 (*read_b)(struct sdhci_host *host, int reg);
> void (*write_l)(struct sdhci_host *host, u32 val, int reg);
> void (*write_w)(struct sdhci_host *host, u16 val, int reg);
> void (*write_b)(struct sdhci_host *host, u8 val, int reg);
> #endif
> 
> and fall back to readl/writel if none are supplied.  It would be nice
> if this provided common definitions for the __raw_ and maybe the BE
> variants too.
> 
> Or, we could add IRQ_GC_NATIVE_IO and/or IRQ_GC_BE_IO to enum irq_gc_flags.

I definitely prefer to have these options in the generic chip
implementation so we avoid that driver writers duplicate code in
creative and wrong ways.

Thanks,

	tglx
