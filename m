From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/13] pinctrl: add bcm63xx base code
Date: Tue, 23 Aug 2016 11:15:48 +0200
Message-ID: <CACRpkdYO2Fj90etLaua86bnqNfk73F8wDgWU_e4W3HG3=VZM5A@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-2-git-send-email-jonas.gorski@gmail.com>
 <CACRpkdbAWJruB=4rv_SoPZ5D5XgWjebK_Qmv2GLgOOrSyqXcDA@mail.gmail.com> <CAOiHx=ndEkqQjRS5Hu5LovLmXiqFsPhx0X4k+1CFmGzhD11LRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOiHx=ndEkqQjRS5Hu5LovLmXiqFsPhx0X4k+1CFmGzhD11LRA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 3:44 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> On 22 August 2016 at 14:46, Linus Walleij <linus.walleij@linaro.org> wrote:

>> Why not just put it in the existing pinctrl/bcm directory?
>
> Because at the time I started writing these drivers it was still
> exclusive for ARCH_BCM, will move them there.

OK thanks.

>> The drivers in there share nothing but being Broadcom
>> anyways. And when you're at it, do take a look at the
>> other Broadcom drivers to check if they would
>> happen to share something with your hardware, I find
>> it dazzling that hardware engineers repeatedly reinvents
>> pin controllers but what can I do.
>>
>>> +config PINCTRL_BCM63XX
>>> +       bool
>>> +       select GPIO_GENERIC
>>
>> depends on ARCH_****?
>
> This isn't a user selectable symbol so I don't see the need for that.

This is usually used to narrow the compile coverage to an arch so
that the autobuilders do not explode on the driver when they try
to enable and compile it for every arch in the world using randconfig.

>> depends on OF_GPIO?
>>
>> Will it really be used on non-DT systems?
>
> I plan to use it on both mips/bcm63xx (no dts support) and bmips (dts
> support), so yes.

Tentatively OK. If you are sure it will actually happen, generally
I don't like "design for the future" I prefer "design for here and now".

>> - The only reason for not using of_gpio_simple_xlate() seems to be that
>>   you have several GPIO banks. So why not model every bank as a
>>   separate device? Or did you consider this already?
>
> I did consider it, but it makes the !OF case more complicated, and the
> current of_gpio base code requires changing for it.
>
> That's because some of the pinctrl chips need to set the
> gpio-direction for muxes, and for that need to have a reference to the
> gpio-controller(s). Since any muxes directly tied to the controller
> node will get applied as soon as the controller is registered, it
> needs to aquire the gpio-controller references first.

If you were using syscon to access the register instead of remapping
then this problem would go away, because then the pin control
and the GPIO driver can simply just write into the same registers
to change the direction, because regmap provides marshalling
(serialization) and locking of register access so you don't even
need a spinlock or anything to share: you're already sharing the
regmap abstraction.

This is part of the beauty of doing this with syscon+regmap and
makes me even more convinced that it is the right solution for these
drivers.

If you're worried about the pin controller changing the direction of
the GPIOs behind the back of the GPIO driver: that is what the
.get_direction() callback in the gpio_chip is for, i.e. it is not a
problem.

> On the gpio-controller side, to flag these a requiring pinctrl those
> would then have a gpio-range property, which will cause the probe
> being deferred until the reference to the controller can be resolved.
> Which waits for the gpio-controller to be registered, so it can
> resolve its references to it. A true catch 22 ;-)

So avoid that entire dilemma by removing the entire
cross-dependency. Use syscon+regmap and just write into
the direction registers from the pin controller driver.

>>> +#ifdef CONFIG_OF
>>> +               gc[i].of_gpio_n_cells = 2;
>>> +               gc[i].of_xlate = bcm63xx_gpio_of_xlate;
>>> +#endif
>>> +
>>> +               gc[i].label = label;
>>> +               gc[i].ngpio = pins;
>>> +
>>> +               devm_gpiochip_add_data(dev, &gc[i], gc);
>>
>> Because this also gets pretty hairy... since you don't have one device
>> per gpiochip.

And I'm not convinced that having several gpiochips spawn from one
device is a good idea.


>> A current trend in simple MMIO devices is to simply add themselves as a
>> compatible string in drivers/gpio/gpio-mmio.c. Example:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/drivers/gpio/gpio-mmio.c?h=devel&id=05cc995f4d44c2b14a1f15f3271cc9715cb81099
>>
>> This could be a viable approach if you find a way to flag that such a GPIO
>> has a pin control backend.
>
> The most obvious would be having a gpio-ranges property, but this
> leads to issues mentioned above. And only works for OF.

Ranges can be registered from boardfiles. In fact that was how
it was devised from the beginning, OF ranges were added later.

Yours,
Linus Walleij
