From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Mon, 25 Jul 2016 15:27:55 +0200
Message-ID: <CACRpkdYnK=7C=F5hZUo-nYv6Z+Pb+eT7vm1e4hL8N-QgJnuLfg@mail.gmail.com>
References: <1468496825-4896-1-git-send-email-linux@rempel-privat.de>
 <CACRpkdZLG1Ffdiw3xkP4G0XBr=WDXg2Vbh2Xmgno1PTNhfZHfg@mail.gmail.com>
 <CAGb2v66tf1LcBs69ECW0Xa2OeN0C0NWVyvpC8=4DsVLjAnrO3Q@mail.gmail.com> <5795A334.3000701@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5795A334.3000701-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "fixed-term.Oleksij.Rempel" <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2016 at 7:27 AM, fixed-term.Oleksij.Rempel
<fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org> wrote:
> On 22.07.2016 17:47, Chen-Yu Tsai wrote:
>> On Fri, Jul 22, 2016 at 10:55 PM, Linus Walleij
>> <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>>> "LED1" seems like the right name, if this is a GPIO used to drive
>>> a LED.
>>
>> This is GPIO based.
>
> This was not clear to me, marking GPIO pin as peripheral, at moment of
> writing and testing it was a allocated by led driver. Bit for example
> IO-GCLK was free to use for GPIO :).. so do [] actually make sense?

I would say if the hardware is used in GPIO mode, i.e. if the hardware
registers of the GPIO block is written to activate the LED, then it
is "LED1".

If there would be a specific LED driver block that disables the GPIO
block to be used for the same lines and have its registers elsewhere,
it would be "[LED1]".

So proper names "FOO" is for the case where the GPIO output is
used as GPIO.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
