From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V2 02/15] sh: Eliminate unused irq_reg_{readl,writel}
 accessors
Date: Thu, 30 Oct 2014 11:43:00 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410301142010.5308@nanos>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-3-git-send-email-cernekee@gmail.com> <2294092.AHz8W66sEP@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2294092.AHz8W66sEP@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Oct 2014, Arnd Bergmann wrote:

> On Wednesday 29 October 2014 19:17:55 Kevin Cernekee wrote:
> > Defining these macros way down in arch/sh/.../irq.c doesn't cause
> > kernel/irq/generic-chip.c to use them.  As far as I can tell this code
> > has no effect.
> > 
> > Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> 
> Actually it overrides the 32-bit accessors with 16-bit accessors,
> which does seem intentional and certainly has an effect.

Not really. Neither arch/sh/boards/mach-se/7343/irq.c nor
arch/sh/boards/mach-se/7722/irq.c actually use
irq_reg_readl/writel. They simply define it.
 
Thanks,

	tglx
