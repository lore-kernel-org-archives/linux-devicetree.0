From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 8 Dec 2014 17:59:11 +0100
Message-ID: <CAMuHMdVvK1CTB1SKiNgD8zB9qorV=sQwRO66Dbm5zy=jhw82RA@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdWf_Cw7DTqhut6Mcic1FmcJjHdXWuXkNZM2z0Zx9wjCxw@mail.gmail.com>
	<CACna6rwRR7FpS97Znyk3ewVW58dn5yYTj8OjCstsuzzX8Prg5Q@mail.gmail.com>
	<2176453.HD1opzG9Wg@wuerfel>
	<CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACna6rydKTDO+tBTdNNUDvQCXytE6VnEPjLSGs0yMee8Jz8FGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>, Miguel Gaio <miguel.gaio@efixo.com>
List-Id: devicetree@vger.kernel.org

Hi Rafa=C5=82,

On Mon, Dec 8, 2014 at 5:31 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
> On 8 December 2014 at 16:41, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Monday 08 December 2014 16:23:01 Rafa=C5=82 Mi=C5=82ecki wrote:
>>> On 8 December 2014 at 16:03, Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
>>> > On Mon, Dec 8, 2014 at 3:47 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@g=
mail.com> wrote:
>>> >> On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>>> >>> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5=
@gmail.com> wrote:
>>> >>>> SN54HC595 and SN74HC595 are devices based on shift registers c=
ontrolled
>>> >>>> with 5 input signals (serial-in) and providing 8 outputs (para=
llel-out).
>>> >>>>
>>> >>>> They are present on some Broadcom home router boards where man=
ufacturer
>>> >>>> needed few extra GPIOs.
>>> >>>>
>>> >>>> This driver simply uses specified GPIOs to control shift regis=
ters and
>>> >>>> registers another GPIO chip. So you can call it a GPIO extende=
r.
>>> >>>>
>>> >>>> Due to the hardware design only output direction is supported.=
 Reading
>>> >>>> values is handled using tiny internal cache.
>>> >>>>
>>> >>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>> >>>> ---
>>> >>>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
>>> >>>>  drivers/gpio/Kconfig                               |  11 ++
>>> >>>>  drivers/gpio/Makefile                              |   1 +
>>> >>>>  drivers/gpio/gpio-sn54hc595.c                      | 219 ++++=
+++++++++++++++++
>>> >>>
>>> >>> The '595 is already handled by drivers/gpio/gpio-74x164.c.
>>> >>
>>> >> gpio-74x164.c seems to be tight closely to the SPI. In my case i=
t's
>>> >> GPIO-controller '595.
>>> >
>>> > Right. gpio-74x164.c uses the SPI framework, so it will work with=
 any SPI
>>> > master controller, while your driver contains a very simple varia=
nt (without any
>>> > timing constraints) of spi-gpio.c, and is limited to connecting t=
o GPIO pins.
>>> >
>>> >> Do you have any other idea how we could handle this?
>>> >
>>> > Your driver does provide OE support, which gpio-74x164 doesn't su=
pport.
>>> > Perhaps that can be added to gpio-74x164 instead?
>>>
>>> It's not the missing OE support in gpio-74x164 that worries me, but
>>> the whole rest.
>>>
>>> I would need to modify gpio-74x164 to:
>>> 1) Use another OF table with different entry
>>> 2) Use different probe function that doesn't take spi_device parame=
ter
>>> and doesn't do spi setup
>>> 3) Extend struct gen_74x164_chip to include GPIOs
>>> 4) Use totally different __gen_74x164_write_config
>>
>> I think the suggestion was to use the spi-gpio driver in combination
>> with gpio-74x164.
>
> Oh, OK, I've obviously missed that.
>
> I don't know... I'm somehow not really convinced to that, because
> AFAIK there isn't any SPI master device between GPIOs and 'HC595. I

There is: you implement SPI using bitbang on GPIOs.

> don't know if pretending there is some extra hardware (just to use
> another Linux driver/layer) is a good idea. This would:
> 1) Not match hardware design
> 2) Involve some extra code.
>
> I'm not even sure if this would work out-of-the box (without some
> extra changes) at all. From early look at spi-gpio.c I can't see it
> implementing everything I need for GPIO-connected 'HC595.

It should. Plenty of people have connected '595s to SPI buses (I did so
myself, too). Hint: connect chip select to the register clock.

> I think that implementing support for this extra SPI layer will
> actually require more code/tricks than a separated driver.

Yes, it will require more code, as spi-gpio is more generic than your s=
imple
implementation.  But the end result is more flexible and reusable.

The only thing missing is the programmable OE and reset pins,
which are assumed hardwired by the gpio-74x164 driver.
These could be implemented using new gpio-oe and gpio-reset
properties.

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
