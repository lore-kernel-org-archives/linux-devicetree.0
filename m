From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V3 00/14] genirq endian fixes; bcm7120/brcmstb IRQ
 updates
Date: Mon, 3 Nov 2014 21:18:20 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1411032117050.5308@nanos>
References: <1414890241-9938-1-git-send-email-cernekee@gmail.com> <2217077.1aQXS9nJph@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2217077.1aQXS9nJph@wuerfel>
Sender: linux-sh-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, jason@lakedaemon.net, ralf@linux-mips.org, linux-sh@vger.kernel.org, sergei.shtylyov@cogentembedded.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Mon, 3 Nov 2014, Arnd Bergmann wrote:
> On Saturday 01 November 2014 18:03:47 Kevin Cernekee wrote:
> > V2->V3:
> > 
> >  - Move updated irq_reg_{readl,writel} functions back into <linux/irq.h>
> >    so they can be called by irqchip drivers
> > 
> >  - Add gc->reg_{readl,writel} function pointers so that irqchip
> >    drivers like arch/sh/boards/mach-se/{7343,7722}/irq.c can override them
> > 
> >  - CC: linux-sh list in lieu of Paul's defunct linux-sh.org email address
> > 
> >  - Fix handling of zero L2 status in bcm7120-l2.c
> > 
> >  - Rebase on Linus' head of tree
> 
> Looks all great. I also looked at the series now and am very happy
> about how it turned out.

Does that translate to an Acked-by on the whole lot?

Jason, can you please pick that lot up with an Acked-by-me on the
changes to the existing infrastructure?

Thanks,

	tglx
