From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 13:30:37 +0200
Message-ID: <5257E15D.5080602@aksignal.cz>
References: <1381485939-12435-1-git-send-email-jiri.prchal@aksignal.cz> <CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org



Dne 11.10.2013 12:48, Linus Walleij napsal(a):
> This patch must be CC to devicetree@vger.kernel.org as it concerns
> device tree bindings. Please also keep Alexandre Courbot in the loop as
> he's working on GPIO refactorings.
Send them too.

>
> On Fri, Oct 11, 2013 at 12:05 PM, Jiri Prchal <jiri.prchal@aksignal.cz> wrote:
>
>> Add export possibility to sysfs with given name in device tree.
>> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
>>
>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>
> This is a very terse commit message for something which will have
> a very drastic impact on the Linux kernel and device tree.
It looks drastic, but it change name of function and adds one parameter to it.
And of course dt probe.
>
>> +3) gpio-export
>> +--------------
>> +
>> +gpio-export will allow you to automatically export gpio
>
>
> What does this mean? You have to define all terms. And also consider the
> audience. If someone is using device tree on Symbian or Windows,
> what does "export" mean to them? Not all readers of this document
> are Linux implementers.
Didn't know that dt is using someone else.
>
>> +required properties:
>> +- compatible: Should be "gpio-export"
>
> If this is a Linux-specific concept it should be named "linux-gpio-export"
>
> But overall I'm not happy with this *at all* as the sysfs ABI is already
> enough of a trouble for us. WIth platforms switching to DT-only
> probing it would be perfect to get rid of this sysfs interface altogether.
I'm not happy too.

>
> Two questions:
>
> - What do you think of the approach of just not using this for DT
>    boots, instead we create a new userspace ABI, using e.g. a
>    char device for each GPIO chip like /dev/gpio0, /dev/gpio1 etc
>    and access these using ioctl:s?
It would be nice, but yesterday was late.
Even nicer would be /dev/in13, /dev/out20 etc.

>
> - I guess you have a specific system in mind for this? What is the
>    use case? I have seen *way* too many people trying to reimplement
>    drivers/leds/leds-gpio.c
>    drivers/input/keyboard/gpio_keys.c
>    drivers/input/keyboard/gpio_keys_polled.c
>    drivers/power/gpio-charger.c
>    drivers/i2c/busses/i2c-gpio.c
>    drivers/extcon/extcon-gpio.c
>    drivers/spi/spi-gpio.c
>    IN USERSPACE! JUST BECAUSE THEY CAN!
As I know, no one is good for me. May be I could use gpio-led for outputs,
but they would be under sysfs/leds and it isn't clear. And what for inputs?

>
>>From a kernel developers point of view the kernel shall handle
> hardware, so that is why I'm quite picky about this.
It is hardware, my board has IN13, IN14 ... OUT19, GSM_ON etc. Why didn't
access them by right HW name.

Thanks
Jiri
