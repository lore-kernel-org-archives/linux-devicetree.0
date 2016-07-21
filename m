From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2 3/4] drivers: reset: Add STM32 reset driver
Date: Thu, 21 Jul 2016 19:16:02 -0400
Message-ID: <20160721231602.GK21225@windriver.com>
References: <1469092768-17489-1-git-send-email-gabriel.fernandez@st.com>
 <1469092768-17489-4-git-send-email-gabriel.fernandez@st.com>
 <CAP=VYLq+Yp=dyMLY5zp8evNJ+jLkUgJ_s19gD1uC6KP8MmXPDQ@mail.gmail.com>
 <34955897.5sjo821nJx@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <34955897.5sjo821nJx@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, gabriel.fernandez@st.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>, patrice.chotard@st.com, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@st.com
List-Id: devicetree@vger.kernel.org

[Re: [PATCH v2 3/4] drivers: reset: Add STM32 reset driver] On 21/07/2016 (Thu 21:55) Arnd Bergmann wrote:

> On Thursday, July 21, 2016 3:48:09 PM CEST Paul Gortmaker wrote:
> > > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > > index 5d65a93..64ebb0c 100644
> > > --- a/drivers/reset/Makefile
> > > +++ b/drivers/reset/Makefile
> > > @@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
> > >  obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
> > >  obj-$(CONFIG_MACH_PISTACHIO) += reset-pistachio.o
> > >  obj-$(CONFIG_ARCH_MESON) += reset-meson.o
> > > +obj-$(CONFIG_ARCH_STM32) += reset-stm32.o
> > 
> > In my tree, this Kconfig ARCH_STM32 is a bool, so...
> > 
> > >  obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
> > >  obj-$(CONFIG_ARCH_STI) += sti/
> > >  obj-$(CONFIG_ARCH_HISI) += hisilicon/
> > > diff --git a/drivers/reset/reset-stm32.c b/drivers/reset/reset-stm32.c
> > > new file mode 100644
> > > index 0000000..993af2a
> > > --- /dev/null
> > > +++ b/drivers/reset/reset-stm32.c
> > > @@ -0,0 +1,113 @@
> > > +/*
> > > + * Copyright (C) Maxime Coquelin 2015
> > > + * Author:  Maxime Coquelin <mcoquelin.stm32@gmail.com>_
> > > + * License terms:  GNU General Public License (GPL), version 2
> > > + *
> > > + * Heavily based on sunxi driver from Maxime Ripard.
> > > + */
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > 
> > ...we probably don't need module.h here or any of the other
> > MODULE_<blah> tags/macros either.  Use the builtin for the
> > register and all should be good.
> 
> I wonder if we should have separate symbols for each reset driver
> instead. Those could be allowed to be tristate, and could also
> be enabled for compile testing on other architectures.

I'm not quite clear on what you mean by the above.  Maybe if you have a
pointer to an example -- say like the work you mention below -- then
I'll understand what you have in mind.

P.
--

> 
> I actually made a patch for that a while ago, to simplify the
> dependencies around reset drivers.
> 
> 	Arnd
