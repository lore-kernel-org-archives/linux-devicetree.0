From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Fri, 22 Jul 2016 23:47:16 +0800
Message-ID: <CAGb2v66tf1LcBs69ECW0Xa2OeN0C0NWVyvpC8=4DsVLjAnrO3Q@mail.gmail.com>
References: <1468496825-4896-1-git-send-email-linux@rempel-privat.de> <CACRpkdZLG1Ffdiw3xkP4G0XBr=WDXg2Vbh2Xmgno1PTNhfZHfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZLG1Ffdiw3xkP4G0XBr=WDXg2Vbh2Xmgno1PTNhfZHfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Oleksij Rempel <fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 22, 2016 at 10:55 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jul 14, 2016 at 1:47 PM, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org> wrote:
>
>> This names the GPIO lines on the Banana Pi board in accordance with
>> the A20_Banana_Pi v1.4 Specification.
>>
>> This will make these line names reflect through to userspace
>> so that they can easily be identified and used with the new
>> character device ABI.
>>
>> Some care has been taken to name all lines, not just those used
>> by the external connectors, also lines that are muxed into some
>> other function than GPIO: these are named "[FOO]" so that users
>> can see with lsgpio what all lines are used for.
>>
>> Ps: most of the text was taken from Linux Wallej patch.
>
> LinuS
>
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
>
> Nice usecase!
>
>> +       /*
>> +        * Legend: proper name = the GPIO line is used as GPIO
>> +        *         NC = not connected (not routed from the SoC)
>> +        *         "[PER]" = pin is muxed for peripheral (not GPIO)
>> +        *         "" = no idea, schematic doesn't say, could be
>> +        *              unrouted (not connected to any external pin)
>> +        *         LSEC = Low Speed External Connector
>> +        *         HSEC = High Speed External Connector

I don't see LSEC/HSEC used anywhere?

>> +        */
>
> So maybe we should make this naming convention a suggested
> standard. People seem to like it.

One question about this whole thing: how extensively should we add
the names? Only for exposed pins? Or every pin that's routed/used?

>> +       gpio-line-names =
>> +               /* PA */
>> +               "[ERXD3]", "[ERXD2]", "[ERXD1]", "[ERXD0]", "[ETXD3]",
>> +                       "[ETXD2]", "[ETXD1]", "[ETXD0]",
>> +               "[ERXCK]", "[ERXERR]", "[ERXDV]", "[EMDC]", "[EMDIO]",
>> +                       "[ETXEN]", "[ETXCK]", "[ECRS]",
>> +               "[ECOL]", "[ETXERR]", "", "", "", "", "", "",
>> +               "", "", "", "", "", "", "", "",
>> +               /* PB */
>> +               "[PMU-SCK]", "[PMU-SDA]", "", "", "", "NC", "NC", "NC",
>> +               "NC", "[USB0-DRV]", "NC", "NC", "NC", "NC", "", "",
>> +               "", "", "", "", "SCL", "SDA", "", "",
>
> Are these bit-banged SCL and SDA for doing I2C with
> GPIO? Otherwise you probably want to name them "[SCL]" and "[SDA]"

There's an actual I2C controller backing them.

>
>> +               "TXD0", "RXD0", "IO-1", "PH3", "[USB0-IDDET]", "PH5", "", "",
>
> Same here. You probably want "[TXD0]" etc unless you're bit-banging
> the serial port. "IO-1" sounds like a real GPIO though and should
> probably be named like that without [] and "PH3" what is that really?
> A device-muxed pin or some kind of GPIO?

PH3 is actually the pin name. The vendor uses "IO-7" and "IO-8" as function
names for PH3 and PH5, but actually names them "NC":

    http://www.bananapi.org/p/product.html

>
>> +               "", "", "[SD0-DET]", "", "", "", "", "",
>> +               "NC", "", "", "", "IO-4", "IO-5", "NC", "[EMAC-PWR-EN]",
>
> So these seem correct too.
>
>> +               "[LED1]", "NC", "NC", "NC", "", "", "", "",
>
> "LED1" seems like the right name, if this is a GPIO used to drive
> a LED.

This is GPIO based.

>
>> +               "", "", "", "IO-GCLK", "NC", "NC", "NC", "NC",
>
> WHat is IO-GCLK? A real GPIO line used for toggling a clock?
> Or a hardware clock signal? In the first case it it correctly named,
> in the other case it should be "[IO-GCLK]".

According to the schematics this is a PWM output.

Regards
ChenYu

>
>> +               "NC", "NC", "[SPI-CE0]", "[SPI-CLK]", "[SPI-MOSI]",
>> +                       "[SPI-MISO]", "[SPI-CE1]", "NC",
>> +               "IO-6", "IO-3", "IO-2", "IO-0", "", "", "", "",
>
> Looks right.
>
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
