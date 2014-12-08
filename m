From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 8 Dec 2014 16:03:17 +0100
Message-ID: <CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdUMDCeAt5oXtbJSRrw2ES36Szj5KuXEyyeMRS26i1Y97w@mail.gmail.com>
	<CACna6rxdub-PvCOKZzKKkiWOEuPsq4=QrJSNv_j4K+7QHKd=PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACna6rxdub-PvCOKZzKKkiWOEuPsq4=QrJSNv_j4K+7QHKd=PQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

Hi Rafa=C5=82,

On Mon, Dec 8, 2014 at 3:47 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
> On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
>>> SN54HC595 and SN74HC595 are devices based on shift registers contro=
lled
>>> with 5 input signals (serial-in) and providing 8 outputs (parallel-=
out).
>>>
>>> They are present on some Broadcom home router boards where manufact=
urer
>>> needed few extra GPIOs.
>>>
>>> This driver simply uses specified GPIOs to control shift registers =
and
>>> registers another GPIO chip. So you can call it a GPIO extender.
>>>
>>> Due to the hardware design only output direction is supported. Read=
ing
>>> values is handled using tiny internal cache.
>>>
>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>> ---
>>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
>>>  drivers/gpio/Kconfig                               |  11 ++
>>>  drivers/gpio/Makefile                              |   1 +
>>>  drivers/gpio/gpio-sn54hc595.c                      | 219 +++++++++=
++++++++++++
>>
>> The '595 is already handled by drivers/gpio/gpio-74x164.c.
>
> gpio-74x164.c seems to be tight closely to the SPI. In my case it's
> GPIO-controller '595.

Right. gpio-74x164.c uses the SPI framework, so it will work with any S=
PI
master controller, while your driver contains a very simple variant (wi=
thout any
timing constraints) of spi-gpio.c, and is limited to connecting to GPIO=
 pins.

> Do you have any other idea how we could handle this?

Your driver does provide OE support, which gpio-74x164 doesn't support.
Perhaps that can be added to gpio-74x164 instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
