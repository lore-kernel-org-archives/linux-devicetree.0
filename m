From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 15:10:42 +0200
Message-ID: <5257F8D2.5080700@aksignal.cz>
References: <1381485939-12435-1-git-send-email-jiri.prchal@aksignal.cz> <CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com> <5257E15D.5080602@aksignal.cz> <CACRpkdYkG-0x9_oQijA6hYn+snDsjtVT+RhYhDe_9gjfDdWuoA@mail.gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYkG-0x9_oQijA6hYn+snDsjtVT+RhYhDe_9gjfDdWuoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Dne 11.10.2013 14:49, Linus Walleij napsal(a):
> On Fri, Oct 11, 2013 at 1:30 PM, skrev Ji=C5=99=C3=AD Prchal <jiri.pr=
chal@aksignal.cz>:
>> Dne 11.10.2013 12:48, Linus Walleij napsal(a):
>
>>> - What do you think of the approach of just not using this for DT
>>>     boots, instead we create a new userspace ABI, using e.g. a
>>>     char device for each GPIO chip like /dev/gpio0, /dev/gpio1 etc
>>>     and access these using ioctl:s?
>>
>> It would be nice, but yesterday was late.
>> Even nicer would be /dev/in13, /dev/out20 etc.
>
> Hm like one device node per pin?
>
> /dev/gpio0/in01
> /dev/gpio0/out01
> etc
Yes, because one userspace app is controling out1 and the other out2.
And maybe /dev/gpio/, not sorted by chip, because out2 and out3 could b=
e another chip.
Just picked up unused gpio over soc and some added by SPI expander.
=46or example:
SOC -> board name
pioC18 -> in13
pioB12 -> in14
pioA31 -> out15
etc

>
>>> - I guess you have a specific system in mind for this? What is the
>>>     use case? I have seen *way* too many people trying to reimpleme=
nt
>>>     drivers/leds/leds-gpio.c
>>>     drivers/input/keyboard/gpio_keys.c
>>>     drivers/input/keyboard/gpio_keys_polled.c
>>>     drivers/power/gpio-charger.c
>>>     drivers/i2c/busses/i2c-gpio.c
>>>     drivers/extcon/extcon-gpio.c
>>>     drivers/spi/spi-gpio.c
>>>     IN USERSPACE! JUST BECAUSE THEY CAN!
>>
>> As I know, no one is good for me. May be I could use gpio-led for ou=
tputs,
>> but they would be under sysfs/leds and it isn't clear.
>
> If the GPIOs are actually connected to LEDs you should be
> using drivers/leds/leds-gpio.c and not export the GPIOs.
I know that, just don't like /sys/class/leds/out15/brightness.

>
>> And what for inputs?
>
> Depends on what input. For simple buttons:
>
> drivers/input/keyboard/gpio_keys.c
> drivers/input/keyboard/gpio_keys_polled.c
>
> Then you get the input events from /dev/input/eventN
> just like any other key press.
>
> extcon-gpio.c is for e.g. headphone insertion on mobile
> phones etc.
Hm, my inputs are simple digital inputs from real world, like "door ope=
n",
"somewhere is voltage", "some switch is on". And more than one app is r=
eading them.
So what to use for it?

Thanks
Jiri
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
