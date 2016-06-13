From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Mon, 13 Jun 2016 08:48:45 +0200
Message-ID: <CACRpkdb-movUA67=8WrCcYTO5WyAjUcur44R=vQ0iaBp-tMSmg@mail.gmail.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ@mail.gmail.com> <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 3:41 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> Devices that use interrupts usually convert the GPIO to an interrupt =
and use it.
> Since the xlat op will return the real GPIO spec the interrupt conver=
sion will work.
>
> Bare interrupt lines are sort-of out of fashion nowadays I think. I=E2=
=80=99m eager to be
> proven wrong though with a recent portable expansion board that uses =
them.

No. We have established since several years back that gpiochip and inte=
rrupt
chip use cases are orthogonal, and there is absolutely *NO* requirement=
 that
a consumer call .to_irq() on a GPIO line before using it as an interrup=
t, if the
driver exposes an interrupt chip.

It is true that external interrupt lines are out-of-fashion and usually=
 replaced
with GPIOs that can trigger IRQs. However the latter have two interface=
s
independent of each other.

A practical usecase is the SMSC911x ethernet drivers that have their IR=
Q
wired to both external interrupt lines and GPIO lines used as IRQ in di=
fferent
use cases. It should not need to know whether the interrupt provider is=
 a
"real" IRQ line or a GPIO line providing an IRQ. It just wants "some IR=
Q",
and this should be hidden from the driver and the hardware's DT binding=
s.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
