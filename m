From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 8 Dec 2014 17:31:45 +0100
Message-ID: <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
	<CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
	<2176453.HD1opzG9Wg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <2176453.HD1opzG9Wg@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

On 8 December 2014 at 16:41, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 08 December 2014 16:23:01 Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>> > Hi Rafa=C5=82,
>> >
>> > On Mon, Dec 8, 2014 at 3:47 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gm=
ail.com> wrote:
>> >> On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
>> >>> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@=
gmail.com> wrote:
>> >>>> SN54HC595 and SN74HC595 are devices based on shift registers co=
ntrolled
>> >>>> with 5 input signals (serial-in) and providing 8 outputs (paral=
lel-out).
>> >>>>
>> >>>> They are present on some Broadcom home router boards where manu=
facturer
>> >>>> needed few extra GPIOs.
>> >>>>
>> >>>> This driver simply uses specified GPIOs to control shift regist=
ers and
>> >>>> registers another GPIO chip. So you can call it a GPIO extender=
=2E
>> >>>>
>> >>>> Due to the hardware design only output direction is supported. =
Reading
>> >>>> values is handled using tiny internal cache.
>> >>>>
>> >>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> >>>> ---
>> >>>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
>> >>>>  drivers/gpio/Kconfig                               |  11 ++
>> >>>>  drivers/gpio/Makefile                              |   1 +
>> >>>>  drivers/gpio/gpio-sn54hc595.c                      | 219 +++++=
++++++++++++++++
>> >>>
>> >>> The '595 is already handled by drivers/gpio/gpio-74x164.c.
>> >>
>> >> gpio-74x164.c seems to be tight closely to the SPI. In my case it=
's
>> >> GPIO-controller '595.
>> >
>> > Right. gpio-74x164.c uses the SPI framework, so it will work with =
any SPI
>> > master controller, while your driver contains a very simple varian=
t (without any
>> > timing constraints) of spi-gpio.c, and is limited to connecting to=
 GPIO pins.
>> >
>> >> Do you have any other idea how we could handle this?
>> >
>> > Your driver does provide OE support, which gpio-74x164 doesn't sup=
port.
>> > Perhaps that can be added to gpio-74x164 instead?
>>
>> It's not the missing OE support in gpio-74x164 that worries me, but
>> the whole rest.
>>
>> I would need to modify gpio-74x164 to:
>> 1) Use another OF table with different entry
>> 2) Use different probe function that doesn't take spi_device paramet=
er
>> and doesn't do spi setup
>> 3) Extend struct gen_74x164_chip to include GPIOs
>> 4) Use totally different __gen_74x164_write_config
>
> I think the suggestion was to use the spi-gpio driver in combination
> with gpio-74x164.

Oh, OK, I've obviously missed that.

I don't know... I'm somehow not really convinced to that, because
AFAIK there isn't any SPI master device between GPIOs and 'HC595. I
don't know if pretending there is some extra hardware (just to use
another Linux driver/layer) is a good idea. This would:
1) Not match hardware design
2) Involve some extra code.

I'm not even sure if this would work out-of-the box (without some
extra changes) at all. From early look at spi-gpio.c I can't see it
implementing everything I need for GPIO-connected 'HC595.
I think that implementing support for this extra SPI layer will
actually require more code/tricks than a separated driver.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
