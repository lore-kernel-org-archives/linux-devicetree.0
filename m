From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Thu, 11 Dec 2014 12:03:09 +0100
Message-ID: <CAMuHMdWc1Uu81pG5QiPLpjX4h-3TeBjXXhnCX+4yNNTKQEzo3w@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
	<CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
	<2176453.HD1opzG9Wg@wuerfel>
	<CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
	<CAMuHMdVvK1CTB1SKiNgD8zB9qorV=sQwRO66Dbm5zy=jhw82RA@mail.gmail.com>
	<20141209091202.GS8739@lukather>
	<CACna6rwBO388iF+BJ2=nCEWrNsedag8bbBc+OZYe+pvf4zrmgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACna6rwBO388iF+BJ2=nCEWrNsedag8bbBc+OZYe+pvf4zrmgw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 11, 2014 at 11:36 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail=
=2Ecom> wrote:
> On 9 December 2014 at 10:12, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>> On Mon, Dec 08, 2014 at 05:59:11PM +0100, Geert Uytterhoeven wrote:
>>> > I think that implementing support for this extra SPI layer will
>>> > actually require more code/tricks than a separated driver.
>>>
>>> Yes, it will require more code, as spi-gpio is more generic than yo=
ur simple
>>> implementation.  But the end result is more flexible and reusable.
>>>
>>> The only thing missing is the programmable OE and reset pins,
>>> which are assumed hardwired by the gpio-74x164 driver.
>>> These could be implemented using new gpio-oe and gpio-reset
>>> properties.
>>
>> From my (very) vague memories of it, OE was actually supported by
>> using it as spi-gpio's chip select.
>>
>> So I'd say that only the gpio-reset should be implemented.
>
> I've tracked how spi_bitbang_transfer_one does work. Long story short=
 it does:

[deleted standard SPI protocol]

> As you can see, we don't call OE in spi_gpio_chipselect. So currently
> both input signals and unhandled: OE and SRCLR. Luckily for me, it
> appears my bootloader puts them in a wanted state, but this still
> should be handled somehow.

I think you can just add two properties (one array for OE, one for SRCL=
R)
to the bindings for the gpio-74x164 driver, so it can set those GPIO pi=
ns,
if present. Note that they should be arrays, as gpio-74x164 supports\
daisy-chaining chips.

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
