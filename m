From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 08 Dec 2014 16:41:10 +0100
Message-ID: <2176453.HD1opzG9Wg@wuerfel>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com> <CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com> <CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 December 2014 16:23:01 Rafa=C5=82 Mi=C5=82ecki wrote:
> On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > Hi Rafa=C5=82,
> >
> > On Mon, Dec 8, 2014 at 3:47 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
> >> On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> >>> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@g=
mail.com> wrote:
> >>>> SN54HC595 and SN74HC595 are devices based on shift registers con=
trolled
> >>>> with 5 input signals (serial-in) and providing 8 outputs (parall=
el-out).
> >>>>
> >>>> They are present on some Broadcom home router boards where manuf=
acturer
> >>>> needed few extra GPIOs.
> >>>>
> >>>> This driver simply uses specified GPIOs to control shift registe=
rs and
> >>>> registers another GPIO chip. So you can call it a GPIO extender.
> >>>>
> >>>> Due to the hardware design only output direction is supported. R=
eading
> >>>> values is handled using tiny internal cache.
> >>>>
> >>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >>>> ---
> >>>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
> >>>>  drivers/gpio/Kconfig                               |  11 ++
> >>>>  drivers/gpio/Makefile                              |   1 +
> >>>>  drivers/gpio/gpio-sn54hc595.c                      | 219 ++++++=
+++++++++++++++
> >>>
> >>> The '595 is already handled by drivers/gpio/gpio-74x164.c.
> >>
> >> gpio-74x164.c seems to be tight closely to the SPI. In my case it'=
s
> >> GPIO-controller '595.
> >
> > Right. gpio-74x164.c uses the SPI framework, so it will work with a=
ny SPI
> > master controller, while your driver contains a very simple variant=
 (without any
> > timing constraints) of spi-gpio.c, and is limited to connecting to =
GPIO pins.
> >
> >> Do you have any other idea how we could handle this?
> >
> > Your driver does provide OE support, which gpio-74x164 doesn't supp=
ort.
> > Perhaps that can be added to gpio-74x164 instead?
>=20
> It's not the missing OE support in gpio-74x164 that worries me, but
> the whole rest.
>=20
> I would need to modify gpio-74x164 to:
> 1) Use another OF table with different entry
> 2) Use different probe function that doesn't take spi_device paramete=
r
> and doesn't do spi setup
> 3) Extend struct gen_74x164_chip to include GPIOs
> 4) Use totally different __gen_74x164_write_config

I think the suggestion was to use the spi-gpio driver in combination
with gpio-74x164.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
