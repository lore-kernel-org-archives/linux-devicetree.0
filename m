From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Tue, 19 May 2015 10:11:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1505191010510.4225@nanos>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch> <1431769465-26867-9-git-send-email-stefan@agner.ch> <20150516205103.GO2067@n2100.arm.linux.org.uk> <alpine.DEB.2.11.1505170952060.4225@nanos> <alpine.DEB.2.11.1505181735230.4225@nanos>
 <20150519053503.GP1071@dragon>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150519053503.GP1071@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, arnd@arndb.de, Stefan Agner <stefan@agner.ch>, shawn.guo@linaro.org, kernel@pengutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, u.kleine-koenig@pengutronix.de, olof@lixom.net, daniel.lezcano@linaro.org, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 19 May 2015, Shawn Guo wrote:
> On Mon, May 18, 2015 at 05:36:43PM +0200, Thomas Gleixner wrote:
> > 
> > 
> > On Sun, 17 May 2015, Thomas Gleixner wrote:
> > 
> > > On Sat, 16 May 2015, Russell King - ARM Linux wrote:
> > > 
> > > > On Sat, May 16, 2015 at 11:44:20AM +0200, Stefan Agner wrote:
> > > > > Remove the needless differences between MMU/!MMU addruart calls.
> > > > > This allows to use the same addruart macro on SoC level. Useful
> > > > > for SoC consisting of multiple CPUs with and without MMU such as
> > > > > Freescale Vybrid.
> > > > > 
> > > > > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > > > 
> > > > Depending on the merge plan for the remainder (has tglx reviewed the IRQ
> > > > changes yet?  I think he needs to before this can be merged)... if it's
> > > > not going to go in for the next merge window, this should find its way
> > > > into the patch system so it can be applied anyway.
> > > 
> > > I'm going to apply the irq core and chip driver modifications to a
> > > separate branch later today, so you or ARM-SOC folks can pull that
> > > in. Will send you a mail where it can be found.
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-arm
> > 
> > That contains the first 5 patches which touch kernel/irq/ and
> > drivers/irqchip/
> 
> Russell, Arnd,
> 
> I guess the easiest way to merge rest of the series is to have them go
> via i.MX tree with your nods?

If you pull the irq stuff. Make sure that the HEAD is b5cc5cbc11697. I
pushed out a broken version earlier.

Thanks,

	tglx
