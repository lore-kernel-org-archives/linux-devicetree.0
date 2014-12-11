From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Thu, 11 Dec 2014 11:36:56 +0100
Message-ID: <CACna6rwBO388iF+BJ2=nCEWrNsedag8bbBc+OZYe+pvf4zrmgw@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
	<CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
	<2176453.HD1opzG9Wg@wuerfel>
	<CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
	<CAMuHMdVvK1CTB1SKiNgD8zB9qorV=sQwRO66Dbm5zy=jhw82RA@mail.gmail.com>
	<20141209091202.GS8739@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20141209091202.GS8739@lukather>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On 9 December 2014 at 10:12, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Mon, Dec 08, 2014 at 05:59:11PM +0100, Geert Uytterhoeven wrote:
>> > I think that implementing support for this extra SPI layer will
>> > actually require more code/tricks than a separated driver.
>>
>> Yes, it will require more code, as spi-gpio is more generic than you=
r simple
>> implementation.  But the end result is more flexible and reusable.
>>
>> The only thing missing is the programmable OE and reset pins,
>> which are assumed hardwired by the gpio-74x164 driver.
>> These could be implemented using new gpio-oe and gpio-reset
>> properties.
>
> From my (very) vague memories of it, OE was actually supported by
> using it as spi-gpio's chip select.
>
> So I'd say that only the gpio-reset should be implemented.

I've tracked how spi_bitbang_transfer_one does work. Long story short i=
t does:
bitbang->chipselect(spi, BITBANG_CS_ACTIVE);
bitbang->txrx_bufs(spi, t);
bitbang->chipselect(spi, BITBANG_CS_INACTIVE);

txrx_bufs is a pointer to one of:
bitbang_txrx_be_cpha0
bitbang_txrx_be_cpha1


Now, in cpha[01] for every register bit we call:
1) setmosi - to set data, so it's serial (SER)
2) setsck - to shift bits, so it's shift register clock (SRCLK)

Then in spi_gpio_chipselect we call:
1) cs_gpios[chip], so it's register clock (RCLK)


As you can see, we don't call OE in spi_gpio_chipselect. So currently
both input signals and unhandled: OE and SRCLR. Luckily for me, it
appears my bootloader puts them in a wanted state, but this still
should be handled somehow.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
