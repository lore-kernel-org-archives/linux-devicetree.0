From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 14:49:51 +0200
Message-ID: <CACRpkdYkG-0x9_oQijA6hYn+snDsjtVT+RhYhDe_9gjfDdWuoA@mail.gmail.com>
References: <1381485939-12435-1-git-send-email-jiri.prchal@aksignal.cz>
	<CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com>
	<5257E15D.5080602@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5257E15D.5080602@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2013 at 1:30 PM, skrev Ji=F8=ED Prchal <jiri.prchal@aks=
ignal.cz>:
> Dne 11.10.2013 12:48, Linus Walleij napsal(a):

>> - What do you think of the approach of just not using this for DT
>>    boots, instead we create a new userspace ABI, using e.g. a
>>    char device for each GPIO chip like /dev/gpio0, /dev/gpio1 etc
>>    and access these using ioctl:s?
>
> It would be nice, but yesterday was late.
> Even nicer would be /dev/in13, /dev/out20 etc.

Hm like one device node per pin?

/dev/gpio0/in01
/dev/gpio0/out01
etc

>> - I guess you have a specific system in mind for this? What is the
>>    use case? I have seen *way* too many people trying to reimplement
>>    drivers/leds/leds-gpio.c
>>    drivers/input/keyboard/gpio_keys.c
>>    drivers/input/keyboard/gpio_keys_polled.c
>>    drivers/power/gpio-charger.c
>>    drivers/i2c/busses/i2c-gpio.c
>>    drivers/extcon/extcon-gpio.c
>>    drivers/spi/spi-gpio.c
>>    IN USERSPACE! JUST BECAUSE THEY CAN!
>
> As I know, no one is good for me. May be I could use gpio-led for out=
puts,
> but they would be under sysfs/leds and it isn't clear.

If the GPIOs are actually connected to LEDs you should be
using drivers/leds/leds-gpio.c and not export the GPIOs.

> And what for inputs?

Depends on what input. For simple buttons:

drivers/input/keyboard/gpio_keys.c
drivers/input/keyboard/gpio_keys_polled.c

Then you get the input events from /dev/input/eventN
just like any other key press.

extcon-gpio.c is for e.g. headphone insertion on mobile
phones etc.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
