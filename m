From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Tue, 22 Jan 2019 16:30:07 -0800
Message-ID: <7hef94z04w.fsf@baylibre.com>
References: <20190111172134.30147-1-brgl@bgdev.pl> <20190111172134.30147-3-brgl@bgdev.pl> <08200de1-fde5-c525-c874-c7872259067b@ti.com> <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=McrT4KTW45=3CTBxspVb+z8k=DDjOvKi9NH0aA9eJ8=cQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> pon., 14 sty 2019 o 13:20 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>>
>> Hi Bartosz,
>>
>> On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> >
>> > Currently the clocksource and clockevent support for davinci platforms
>> > lives in mach-davinci. It hard-codes many things, used global variable=
s,
>> > implements functionalities unused by any platform and has code fragmen=
ts
>> > scattered across many (often unrelated) files.
>> >
>> > Implement a new, modern and simplified timer driver and put it into
>> > drivers/clocksource. We still need to support legacy board files so
>> > export a config structure and a function that allows machine code to
>> > register the timer.
>> >
>> > We don't check the return values of regmap reads and writes since with
>> > mmio it's only likely to fail due to programmer's errors.
>> >
>> > We also don't bother freeing resources on errors in
>> > davinci_timer_register() as the system won't boot without a timer anyw=
ay.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> With this series, DA830 fails to boot. Rest of the devices are okay from
>> boot perspective.
>>
>> DA830 is pretty unique because it uses the same timer-half for both
>> clocksource and clockevent. May be you can set the same configuration on
>> your DA850 to see the same issue? Else, I will enable low-level debug
>> and try to provide more debug data.
>>
>
> I can't boot da850 with the same config as da830 (0x60 compare
> register, compare irq 74) even with the old timer code. Just to make
> sure: does da830 boot fine with mainline v5.0-rc2?
>
>> Some minor comments below from quick look:
>>
>> > diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource=
/timer-davinci.c
>> > new file mode 100644
>> > index 000000000000..7282a1fda80f
>> > --- /dev/null
>> > +++ b/drivers/clocksource/timer-davinci.c
>> > @@ -0,0 +1,415 @@
>> > +// SPDX-License-Identifier: GPL-2.0+
>> > +/*
>> > + * TI DaVinci clocksource driver
>> > + *
>> > + * Copyright (C) 2019 Texas Instruments
>> > + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> > + * (with some parts adopted from code by Kevin Hilman <khilman@baylib=
re.com>)
>>
>> Did you really intend GPL v2 or later? The original code referred to
>> above is marked 2.0 only.
>>
>
> I'm not sure. Should it be GPLv2 only? I'm not well versed with licensing.

I guess it's up to you since you're the author of this new, reworked
driver, but the original one I wrote was GPLv2 only.

Note however that that the choice of v2 only was not out of objection to
v2+ but because I wrote that in 2007, when there was no "+" ;)

Kevin
