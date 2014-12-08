From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] gpio: sn54hc595: new driver for GPIO shift registers chipsets
Date: Mon, 8 Dec 2014 15:47:21 +0100
Message-ID: <CACna6rxdub-PvCOKZzKKkiWOEuPsq4=QrJSNv_j4K+7QHKd=PQ@mail.gmail.com>
References: <1418048833-27658-1-git-send-email-zajec5@gmail.com>
	<CAMuHMdUMDCeAt5oXtbJSRrw2ES36Szj5KuXEyyeMRS26i1Y97w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUMDCeAt5oXtbJSRrw2ES36Szj5KuXEyyeMRS26i1Y97w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8 December 2014 at 15:41, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> Hi Rafa=C5=82,
>
> On Mon, Dec 8, 2014 at 3:27 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail=
=2Ecom> wrote:
>> SN54HC595 and SN74HC595 are devices based on shift registers control=
led
>> with 5 input signals (serial-in) and providing 8 outputs (parallel-o=
ut).
>>
>> They are present on some Broadcom home router boards where manufactu=
rer
>> needed few extra GPIOs.
>>
>> This driver simply uses specified GPIOs to control shift registers a=
nd
>> registers another GPIO chip. So you can call it a GPIO extender.
>>
>> Due to the hardware design only output direction is supported. Readi=
ng
>> values is handled using tiny internal cache.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-sn54hc595.txt    |  35 ++++
>>  drivers/gpio/Kconfig                               |  11 ++
>>  drivers/gpio/Makefile                              |   1 +
>>  drivers/gpio/gpio-sn54hc595.c                      | 219 ++++++++++=
+++++++++++
>
> The '595 is already handled by drivers/gpio/gpio-74x164.c.

gpio-74x164.c seems to be tight closely to the SPI. In my case it's
GPIO-controller '595.

Do you have any other idea how we could handle this?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
