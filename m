From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
Date: Thu, 13 Apr 2017 14:48:45 +0200
Message-ID: <CACRpkdYAgd+ovH5x+GpbqPqGNG8W=t3A_g1rpY6tha2=FPsfOA@mail.gmail.com>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop> <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
 <20170413091513.GA1878@localhost.localdomain> <CACRpkdZ6PBv72BCn1bXsvhcHD2+dsCdh=3F3Vnnm7AWZqyWrig@mail.gmail.com>
 <1492086093.4826.25.camel@rf-debian.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1492086093.4826.25.camel@rf-debian.wolfsonmicro.main>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 2:21 PM, Richard Fitzgerald
<rf@opensource.wolfsonmicro.com> wrote:
> On Thu, 2017-04-13 at 14:14 +0200, Linus Walleij wrote:
>> On Thu, Apr 13, 2017 at 11:15 AM, Charles Keepax
>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> > On Tue, Apr 11, 2017 at 10:34:27AM +0100, Richard Fitzgerald wrote:
>>
>> >> 3) The codec only has to be kept awake while any such GPIO is actually
>> >> in use. See (2)
>> >
>> > Yeah option 3 is the primary issue here, we only want to keep the
>> > CODEC enabled whilst specific GPIOs are in use. As GPIOs can be
>> > dynamically requested/released by things in the kernel we want to
>> > know which GPIOs require the CODEC to be kept alive. Also in the
>> > future one might be tempted to add maintain whilst high and
>> > maintain whilst low options for lines with pulls on them to
>> > further optimise power.
>>
>> Why does this have to be encoded as information in the device
>> tree? Isn't it better to use a static table in the driver?
>>
>> I don't see what use system integrators and others playing
>> around with the device tree has of this, it will just be confusing
>> to them if it is a chip-internal detail.
>>
>
> They are GPIOs for connecting to external hardware, we don't know what
> people are going to connect them to so they have to tell us how they
> need them to behave.

Aha it is a consumer configuration thing, then I see it.

I think it seems a bit odd that it is assumed that the default is that
we should *not* preserve the GPIO output value if we go to sleep.
Should the flag be inverted?

Also, why can't we just use a generic flag for this, it seems very
very generic.

Look in:
include/dt-bindings/gpio/gpio.h

Is there any reasons why we can't have:
/* Bit 3 express GPIO suspend/resume persistance in low power mode */
#define GPIO_MUST_KEEP_VALUE 0
#define GPIO_MAY_LOOSE_VALUE_DURING_SLEEP 8

Yeah it's talkative but informative. This way you can mark up lines
that are OK to loose their value during low-power/sleep using
just (new) standard bindings that can be reused by others,
also optionally making it possible for the gpiolib core to take action
on these properties if need be.

Yours,
Linus Walleij
