From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 01/11] ARM: brcmstb: add infrastructure for ARM-based
 Broadcom STB SoCs
Date: Wed, 30 Jul 2014 19:36:35 -0700
Message-ID: <20140731023635.GN3711@ld-irv-0074>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
 <1405976886-27807-2-git-send-email-computersforpeace@gmail.com>
 <20140730092635.GI30282@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140730092635.GI30282-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Wed, Jul 30, 2014 at 10:26:35AM +0100, Russell King wrote:
> On Mon, Jul 21, 2014 at 02:07:56PM -0700, Brian Norris wrote:
> > +static DEFINE_SPINLOCK(boot_lock);
> > +
> > +static void brcmstb_secondary_init(unsigned int cpu)
> > +{
> > +	/*
> > +	 * Synchronise with the boot thread.
> > +	 */
> > +	spin_lock(&boot_lock);
> > +	spin_unlock(&boot_lock);
> > +}
> > +
> > +static int brcmstb_boot_secondary(unsigned int cpu, struct task_struct *idle)
> > +{
> > +	/*
> > +	 * set synchronisation state between this boot processor
> > +	 * and the secondary one
> > +	 */
> > +	spin_lock(&boot_lock);
> > +
> > +	/* Bring up power to the core if necessary */
> > +	if (brcmstb_cpu_get_power_state(cpu) == 0)
> > +		brcmstb_cpu_power_on(cpu);
> > +
> > +	brcmstb_cpu_boot(cpu);
> > +
> > +	/*
> > +	 * now the secondary core is starting up let it run its
> > +	 * calibrations, then wait for it to finish
> > +	 */
> > +	spin_unlock(&boot_lock);
> 
> I've just read through this code (because it caused my allmodconfig to
> break) and spotted this.

Sorry about the allmodconfig problems. I never compile-tested with ARMv6
enabled. This look OK?

diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index f3665121729b..5ce82b4ba931 100644
--- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_ARCH_BCM2835)	+= board_bcm2835.o
 obj-$(CONFIG_ARCH_BCM_5301X)	+= bcm_5301x.o
 
 ifeq ($(CONFIG_ARCH_BRCMSTB),y)
+CFLAGS_platsmp-brcmstb.o	+= -march=armv7-a
 obj-y				+= brcmstb.o
 obj-$(CONFIG_SMP)		+= headsmp-brcmstb.o platsmp-brcmstb.o
 endif

> What function does boot_lock perform here?  Please, don't quote the
> comments (I know where the comments came from) but what I want to hear
> is your comments about why you decided to retain this.

You might glean a little more from my response to Rob, but I'm not sure
there was a good reason for retaining this. We do need to be sure the
CPU is fully powered online before bringing it out of reset, but the
spinlock seems overkill AFAICT.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
