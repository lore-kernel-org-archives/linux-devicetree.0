From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 08 Dec 2014 17:56:56 +0100
Message-ID: <101906283.ZCEfV1JaGs@wuerfel>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com> <2176453.HD1opzG9Wg@wuerfel> <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 December 2014 17:31:45 Rafa=C5=82 Mi=C5=82ecki wrote:
> On 8 December 2014 at 16:41, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 08 December 2014 16:23:01 Rafa=C5=82 Mi=C5=82ecki wrote:
> >> On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> >> >> gpio-74x164.c seems to be tight closely to the SPI. In my case =
it's
> >> >> GPIO-controller '595.
> >> >
> >> > Right. gpio-74x164.c uses the SPI framework, so it will work wit=
h any SPI
> >> > master controller, while your driver contains a very simple vari=
ant (without any
> >> > timing constraints) of spi-gpio.c, and is limited to connecting =
to GPIO pins.
> >> >
> >> >> Do you have any other idea how we could handle this?
> >> >
> >> > Your driver does provide OE support, which gpio-74x164 doesn't s=
upport.
> >> > Perhaps that can be added to gpio-74x164 instead?
> >>
> >> It's not the missing OE support in gpio-74x164 that worries me, bu=
t
> >> the whole rest.
> >>
> >> I would need to modify gpio-74x164 to:
> >> 1) Use another OF table with different entry
> >> 2) Use different probe function that doesn't take spi_device param=
eter
> >> and doesn't do spi setup
> >> 3) Extend struct gen_74x164_chip to include GPIOs
> >> 4) Use totally different __gen_74x164_write_config
> >
> > I think the suggestion was to use the spi-gpio driver in combinatio=
n
> > with gpio-74x164.
>=20
> Oh, OK, I've obviously missed that.
>=20
> I don't know... I'm somehow not really convinced to that, because
> AFAIK there isn't any SPI master device between GPIOs and 'HC595. I
> don't know if pretending there is some extra hardware (just to use
> another Linux driver/layer) is a good idea. This would:
> 1) Not match hardware design
> 2) Involve some extra code.
>=20
> I'm not even sure if this would work out-of-the box (without some
> extra changes) at all. From early look at spi-gpio.c I can't see it
> implementing everything I need for GPIO-connected 'HC595.
> I think that implementing support for this extra SPI layer will
> actually require more code/tricks than a separated driver.

The purpose of the spi-gpio driver is to avoid having to write
two drivers for every spi slave device if someone wants to drive
it using bit-banged gpios.

The existing users of the driver are in fact all using spi-gpio,
see:
arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
arch/arm/boot/dts/imx28-cfa10049.dts

and in openwrt:
target/linux/brcm63xx/patches-3.14/501-board-NB4.patch
target/linux/brcm63xx/patches-3.14/526-board_CT6373-1.patch

so there shouldn't be too much missing, and extending spi-gpio
for any missing features would help other people trying to attach
random spi devices using gpio as well.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
