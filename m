From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 8 Dec 2014 16:23:01 +0100
Message-ID: <CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdUMDCeAt5oXtbJSRrw2ES36Szj5KuXEyyeMRS26i1Y97w@mail.gmail.com>
	<CACna6rxdub-PvCOKZzKKkiWOEuPsq4=QrJSNv_j4K+7QHKd=PQ@mail.gmail.com>
	<CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> Hi Rafa=C5=82,
>
> On Mon, Dec 8, 2014 at 3:47 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail=
=2Ecom> wrote:
>> On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>>>> SN54HC595 and SN74HC595 are devices based on shift registers contr=
olled
>>>> with 5 input signals (serial-in) and providing 8 outputs (parallel=
-out).
>>>>
>>>> They are present on some Broadcom home router boards where manufac=
turer
>>>> needed few extra GPIOs.
>>>>
>>>> This driver simply uses specified GPIOs to control shift registers=
 and
>>>> registers another GPIO chip. So you can call it a GPIO extender.
>>>>
>>>> Due to the hardware design only output direction is supported. Rea=
ding
>>>> values is handled using tiny internal cache.
>>>>
>>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
>>>>  drivers/gpio/Kconfig                               |  11 ++
>>>>  drivers/gpio/Makefile                              |   1 +
>>>>  drivers/gpio/gpio-sn54hc595.c                      | 219 ++++++++=
+++++++++++++
>>>
>>> The '595 is already handled by drivers/gpio/gpio-74x164.c.
>>
>> gpio-74x164.c seems to be tight closely to the SPI. In my case it's
>> GPIO-controller '595.
>
> Right. gpio-74x164.c uses the SPI framework, so it will work with any=
 SPI
> master controller, while your driver contains a very simple variant (=
without any
> timing constraints) of spi-gpio.c, and is limited to connecting to GP=
IO pins.
>
>> Do you have any other idea how we could handle this?
>
> Your driver does provide OE support, which gpio-74x164 doesn't suppor=
t.
> Perhaps that can be added to gpio-74x164 instead?

It's not the missing OE support in gpio-74x164 that worries me, but
the whole rest.

I would need to modify gpio-74x164 to:
1) Use another OF table with different entry
2) Use different probe function that doesn't take spi_device parameter
and doesn't do spi setup
3) Extend struct gen_74x164_chip to include GPIOs
4) Use totally different __gen_74x164_write_config

Amount of shared code would be so small I doubt it's worth it. Both
driver are quite trivial (200 or less LOC). Sharing:
1) ~5 lines long __gen_74x164_write_config
2) ~5 lines long gen_74x164_set_value
3) 1 line long gen_74x164_direction_output
makes me feel it's not really worth combining these two drivers into a =
one.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
