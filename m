From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Mon, 14 Jan 2019 17:39:03 +0100
Message-ID: <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
References: <20190111172134.30147-1-brgl@bgdev.pl> <20190111172134.30147-3-brgl@bgdev.pl>
 <08200de1-fde5-c525-c874-c7872259067b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08200de1-fde5-c525-c874-c7872259067b@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

pon., 14 sty 2019 o 13:20 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> Hi Bartosz,
>
> On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently the clocksource and clockevent support for davinci platforms
> > lives in mach-davinci. It hard-codes many things, used global variables=
,
> > implements functionalities unused by any platform and has code fragment=
s
> > scattered across many (often unrelated) files.
> >
> > Implement a new, modern and simplified timer driver and put it into
> > drivers/clocksource. We still need to support legacy board files so
> > export a config structure and a function that allows machine code to
> > register the timer.
> >
> > We don't check the return values of regmap reads and writes since with
> > mmio it's only likely to fail due to programmer's errors.
> >
> > We also don't bother freeing resources on errors in
> > davinci_timer_register() as the system won't boot without a timer anywa=
y.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> With this series, DA830 fails to boot. Rest of the devices are okay from
> boot perspective.
>
> DA830 is pretty unique because it uses the same timer-half for both
> clocksource and clockevent. May be you can set the same configuration on
> your DA850 to see the same issue? Else, I will enable low-level debug
> and try to provide more debug data.
>

I can't boot da850 with the same config as da830 (0x60 compare
register, compare irq 74) even with the old timer code. Just to make
sure: does da830 boot fine with mainline v5.0-rc2?

> Some minor comments below from quick look:
>
> > diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/=
timer-davinci.c
> > new file mode 100644
> > index 000000000000..7282a1fda80f
> > --- /dev/null
> > +++ b/drivers/clocksource/timer-davinci.c
> > @@ -0,0 +1,415 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * TI DaVinci clocksource driver
> > + *
> > + * Copyright (C) 2019 Texas Instruments
> > + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > + * (with some parts adopted from code by Kevin Hilman <khilman@baylibr=
e.com>)
>
> Did you really intend GPL v2 or later? The original code referred to
> above is marked 2.0 only.
>

I'm not sure. Should it be GPLv2 only? I'm not well versed with licensing.

Bart

> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clockchips.h>
> > +#include <linux/clocksource.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/regmap.h>
> > +#include <linux/sched_clock.h>
> > +
> > +#include <clocksource/timer-davinci.h>
> > +
> > +#define DAVINCI_TIMER_REG_TIM12                      0x10
> > +#define DAVINCI_TIMER_REG_TIM34                      0x14
> > +#define DAVINCI_TIMER_REG_PRD12                      0x18
> > +#define DAVINCI_TIMER_REG_PRD34                      0x1c
> > +#define DAVINCI_TIMER_REG_TCR                        0x20
> > +#define DAVINCI_TIMER_REG_TGCR                       0x24
> > +
> > +#define DAVINCI_TIMER_TIMMODE_MASK           0x0000000c
> > +#define DAVINCI_TIMER_RESET_MASK             0x00000003
> > +#define DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED        0x00000004
> > +#define DAVINCI_TIMER_UNRESET                        0x00000003
>
> I think these are more readable if using BIT() and GENMASK()
>
> Thanks,
> Sekhar
