From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv5 1/2] ARM: socfpga: support suspend to ram
Date: Fri, 29 May 2015 15:55:47 -0500
Message-ID: <alpine.DEB.2.02.1505291548110.28347@linuxheads99>
References: <1432847977-18880-1-git-send-email-atull@opensource.altera.com>
 <1432847977-18880-2-git-send-email-atull@opensource.altera.com>
 <5567D9C4.7090903@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5567D9C4.7090903-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Delicious Quinoq <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 29 May 2015, Dinh Nguyen wrote:

> 
> 
> On 5/28/15 4:19 PM, Alan Tull wrote:
> > Add code that requests that the sdr controller go into
> > self-refresh mode.  This code is run from ocram.
> > 
> > Suspend-to-RAM and EDAC support are mutually exclusive on
> > SOCFPGA.  If the EDAC is enabled, it will prevent the
> > platform from going into suspend.
> > 
> > Example of how to request to suspend to ram:
> >  $ echo enabled > \
> > /sys/devices/soc/ffc02000.serial0/tty/ttyS0/power/wakeup
> > 
> >  $ echo -n mem > /sys/power/state
> > 
> > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > v2: use Generic on-chip SRAM driver to allocate ocram
> >     rm fncpy_align since generic allocator handles alignment
> >     check __arm_ioremap_exec return code
> >     check for NULL pointers
> >     add a comment regarding sdram controller configuration
> > v3: fix renamed #define
> >     propagate socfpga_setup_ocram_self_refresh error code
> > v4: Kconfig: don't need to select GENERIC_ALLOCATER
> >     add CONFIG_SOCFPGA_SUSPEND
> >     make s2r and EDAC support mutually exclusive
> >     socfpga.c: add sdr_ctl_base_addr
> >     return error if ocram not available in device tree
> >     update copyright years
> > v5: remove compile time dependency
> >     edac driver will prevent suspend
> >     don't configure scu standby mode; done in enable_scu().
> >     fix comments about required sdram controller configuration
> > ---
> >  arch/arm/mach-socfpga/Kconfig        |   10 ++-
> >  arch/arm/mach-socfpga/Makefile       |    1 +
> >  arch/arm/mach-socfpga/core.h         |    6 +-
> >  arch/arm/mach-socfpga/pm.c           |  149 ++++++++++++++++++++++++++++++++++
> >  arch/arm/mach-socfpga/self-refresh.S |  136 +++++++++++++++++++++++++++++++
> >  arch/arm/mach-socfpga/socfpga.c      |    6 +-
> >  drivers/edac/altera_edac.c           |   20 +++++
> >  7 files changed, 325 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm/mach-socfpga/pm.c
> >  create mode 100644 arch/arm/mach-socfpga/self-refresh.S
> > 
> 
> Which branch are you basing this patch on? I got a trivial patch
> conflict in Kconfig when I applied to arm-soc/for-next and v4.1-rc5.
> 
> Also, I'm getting these sparse warnings:
> 
> arch/arm/mach-socfpga/pm.c:86:25: warning: incorrect type in argument 1
> (different address spaces)
> arch/arm/mach-socfpga/pm.c:86:25:    expected void *<noident>
> arch/arm/mach-socfpga/pm.c:86:25:    got void [noderef]
> <asn:2>*[assigned] suspend_ocram_base
> arch/arm/mach-socfpga/pm.c:108:52: warning: cast removes address space
> of expression
> 
> Dinh
> 

The problem is that fncpy wants parameter 1 to be void* and 
__arm_ioremap_exec wants 'void __ioram *'.

I get other warnings if I declare 'void *suspend_ocram_base' or cast it as
(void *) for fncpy().  It looks like we are stuck with this warning.

However sparse kindly pointed out that I needed to fix a declaration in
altera_edac.c:

-const struct dev_pm_ops altr_sdram_pm_ops = {
+static const struct dev_pm_ops altr_sdram_pm_ops = {

I'll fix that in the next rev.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
