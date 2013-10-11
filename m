From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 16:46:51 +0200
Message-ID: <CACRpkdau1nGVuDji+gxBnkuC2Ri4SM+MUL+FnQKvMpKMLnG1dQ@mail.gmail.com>
References: <1381485939-12435-1-git-send-email-jiri.prchal@aksignal.cz>
	<CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com>
	<5257E15D.5080602@aksignal.cz>
	<CACRpkdYkG-0x9_oQijA6hYn+snDsjtVT+RhYhDe_9gjfDdWuoA@mail.gmail.com>
	<5257F8D2.5080700@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5257F8D2.5080700@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, Bryan Wu <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2013 at 3:10 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@aks=
ignal.cz> wrote:
> Dne 11.10.2013 14:49, Linus Walleij napsal(a):

>> If the GPIOs are actually connected to LEDs you should be
>> using drivers/leds/leds-gpio.c and not export the GPIOs.
>
> I know that, just don't like /sys/class/leds/out15/brightness.

Hm, then you might want to modify the way names are set
on leds rather ... this is the way we handle LEDs in the kernel
so any problems need to be discussed with Bryan Wu,
the LED maintainer.

>>> And what for inputs?
>>
>> Depends on what input. For simple buttons:
>>
>> drivers/input/keyboard/gpio_keys.c
>> drivers/input/keyboard/gpio_keys_polled.c
>>
>> Then you get the input events from /dev/input/eventN
>> just like any other key press.
>>
>> extcon-gpio.c is for e.g. headphone insertion on mobile
>> phones etc.
>
> Hm, my inputs are simple digital inputs from real world, like "door o=
pen",
> "somewhere is voltage", "some switch is on". And more than one app is
> reading them.
> So what to use for it?

This is actually a valid case for using userspace GPIO, because
of course the kernel cannot model the entire world :-D

What makes me suspicious is mostly when some system
(board with GPIO used in an electronic design) is modeled
from userspace.

So this seems to be OK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
