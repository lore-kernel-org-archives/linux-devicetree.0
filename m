From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 16/20] ARM: mmp: add SMP support
Date: Fri, 23 Aug 2019 09:13:33 +0200
Message-ID: <0897fa54f487f481bf8770ed516578b6f4f53380.camel@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
         <20190822092643.593488-17-lkundrak@v3.sk>
         <6f9d2285-5ca4-a63a-610e-890b49a4f816@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6f9d2285-5ca4-a63a-610e-890b49a4f816@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, Marc Zyngier <maz@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-22 at 09:36 -0700, Florian Fainelli wrote:
> On 8/22/19 2:26 AM, Lubomir Rintel wrote:
> > Used to bring up the second core on MMP3.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > 
> > ---
> > Changes since v1:
> > - Wrap SW_BRANCH_VIRT_ADDR with __pa_symbol()
> > 
> >  arch/arm/mach-mmp/Makefile  |  3 +++
> >  arch/arm/mach-mmp/platsmp.c | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 36 insertions(+)
> >  create mode 100644 arch/arm/mach-mmp/platsmp.c
> > 
> > diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
> > index 322c1c97dc900..7b3a7f979eece 100644
> > --- a/arch/arm/mach-mmp/Makefile
> > +++ b/arch/arm/mach-mmp/Makefile
> > @@ -22,6 +22,9 @@ ifeq ($(CONFIG_PM),y)
> >  obj-$(CONFIG_CPU_PXA910)	+= pm-pxa910.o
> >  obj-$(CONFIG_CPU_MMP2)		+= pm-mmp2.o
> >  endif
> > +ifeq ($(CONFIG_SMP),y)
> > +obj-$(CONFIG_MACH_MMP3_DT)	+= platsmp.o
> > +endif
> >  
> >  # board support
> >  obj-$(CONFIG_MACH_ASPENITE)	+= aspenite.o
> > diff --git a/arch/arm/mach-mmp/platsmp.c b/arch/arm/mach-mmp/platsmp.c
> > new file mode 100644
> > index 0000000000000..98d5ef23623cb
> > --- /dev/null
> > +++ b/arch/arm/mach-mmp/platsmp.c
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
> > + */
> > +#include <linux/io.h>
> > +#include <asm/smp_scu.h>
> > +#include <asm/smp.h>
> > +#include "addr-map.h"
> > +
> > +#define SW_BRANCH_VIRT_ADDR	CIU_REG(0x24)
> > +
> > +static int mmp3_boot_secondary(unsigned int cpu, struct task_struct *idle)
> > +{
> > +	/*
> > +	 * Apparently, the boot ROM on the second core spins on this
> > +	 * register becoming non-zero and then jumps to the address written
> > +	 * there. No IPIs involved.
> > +	 */
> > +	__raw_writel(virt_to_phys(secondary_startup),
> > +			__pa_symbol(SW_BRANCH_VIRT_ADDR));
> 
> That looks wrong, the __pa_symbol() is applicable to secondary_startup,
> while SW_BRANCH_VIRT_ADDR does not need that.

Whoops, sorry for that. Will fix in the next patch version in a few
days.

Thanks
Lubo
