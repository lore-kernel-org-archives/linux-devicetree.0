MIME-Version: 1.0
In-Reply-To: <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop>
	<1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
Date: Tue, 11 Apr 2017 07:15:52 -0500
Message-ID: <CAL_Jsq+bUftj-BosShAX6=hrnmRRuU_UNb+GAg+9E1VFWw-8-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 11, 2017 at 4:34 AM, Richard Fitzgerald <rf@opensource.wolfsonmicro.com> wrote:
> On Mon, 2017-04-10 at 15:17 -0500, Rob Herring wrote:
>> On Fri, Apr 07, 2017 at 01:38:44PM +0100, Charles Keepax wrote:
>> > The Arizona devices only maintain the state of output GPIOs whilst the
>> > CODEC is active, this can cause issues if the CODEC suspends whilst
>> > something is relying on the state of one of its GPIOs. However, in
>> > many systems the CODEC GPIOs are used for audio related features
>> > and thus the state of the GPIOs is unimportant whilst the CODEC is
>> > suspended. Often keeping the CODEC resumed in such a system would
>> > incur a power impact that is unacceptable.
>> >
>> > Add a flag through the second cell of the GPIO specifier in device
>> > tree, to allow the user to select whether a GPIO being configured as
>> > an output should keep the CODEC resumed.
>>
>> If the whole codec can't be suspended, why does this need to be per
>> GPIO? You could just have a single boolean property.
>>
>
> Three reasons I can think of:
>
> 1) The GPIO binding already provides for passing extra information
> through the binding ("Exact meaning of each specifier cell is controller
> specific" as it says in the main gpio binding doc) so why add yet
> another custom property to do it?

While that statement is technically true, we do try to standardize flags. If every driver had its own set we'd end up with a mess. 

> 2) Doing it through the gpio means that if ultimately the child DT node
> that is using it gets disabled (status="disabled") or that driver isn't
> in use the codec will be able to go to sleep. That won't happen with a
> brute-force "big lock".
>
> 3) The codec only has to be kept awake while any such GPIO is actually
> in use. See (2)

Fair enough.

Acked-by: Rob Herring <robh@kernel.org>
