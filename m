From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller
 driver for SiFive SoCs
Date: Fri, 3 May 2019 16:52:46 +0530
Message-ID: <CAJ2_jOEBDyG_7THdbGzny3gAmijGSQGV7eUO8MBwQaTgqKdN5g@mail.gmail.com>
References: <1556793293-21019-1-git-send-email-yash.shah@sifive.com>
 <1556793293-21019-3-git-send-email-yash.shah@sifive.com> <a92e356d-aadc-2c4f-8b23-3d732e7aa58a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a92e356d-aadc-2c4f-8b23-3d732e7aa58a@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2019 at 7:07 PM Andrew F. Davis <afd@ti.com> wrote:
>
> On 5/2/19 6:34 AM, Yash Shah wrote:
> > The driver currently supports only SiFive FU540-C000 platform.
> >
> > The initial version of L2 cache controller driver includes:
> > - Initial configuration reporting at boot up.
> > - Support for ECC related functionality.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  arch/riscv/mm/Makefile          |   1 +
> >  arch/riscv/mm/sifive_l2_cache.c | 221 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 222 insertions(+)
> >  create mode 100644 arch/riscv/mm/sifive_l2_cache.c
> >
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index eb22ab4..1523ee5 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -3,3 +3,4 @@ obj-y += fault.o
> >  obj-y += extable.o
> >  obj-y += ioremap.o
> >  obj-y += cacheflush.o
> > +obj-y += sifive_l2_cache.o
> > diff --git a/arch/riscv/mm/sifive_l2_cache.c b/arch/riscv/mm/sifive_l2_cache.c
> > new file mode 100644
> > index 0000000..923ab34
> > --- /dev/null
> > +++ b/arch/riscv/mm/sifive_l2_cache.c
> > @@ -0,0 +1,221 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * SiFive L2 cache controller Driver
> > + *
> > + * Copyright (C) 2018-2019 SiFive, Inc.
> > + *
> > + */

...

> > +static unsigned int l2_datfail_count(void)
> > +{
> > +     return readl(l2_base + SIFIVE_L2_DATECCFAIL_COUNT);
> > +}
>
> Do you really need all these single line functions? Below in several
> spots you use the readl directly, just do that everywhere.

Ok. Will remove these single line functions.
Thanks for your comments.

- Yash

>
> Andrew
>
