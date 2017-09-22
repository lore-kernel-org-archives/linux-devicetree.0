From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: enable gpio for pin groups
Date: Fri, 22 Sep 2017 15:23:05 +0200
Message-ID: <CACRpkdacz+oC_8J5VHSsKXHGqxn96ETziu+ifUp4XHHrwcqbtA@mail.gmail.com>
References: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 8:28 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> on an i.MX25 machine on my desk a UART RX line is guarded by a transistor
> like this:
>
>         ,------------------------.
>         | ,---------.            |
>         | |  imx25  o--RX----=E2=97=81---o---
>         | |         o--GPIO--'   |
>         | `---------'            |
>         `------------------------'

This is inside the SoC, right, not outside it?

In the rest of my answer I assume this.

If this is on the board, using enable-gpios is proper.

> My first idea was to make this a property of the UART and added a
> enable-gpios property for it[1]. But now I wonder if this is better
> abstracted as an enable-gpios property in the pinctrl node. Something
> like:
>
>         pinctrl_uart5: uart5 {
>                 fsl,pins =3D <
>                         MX25_PAD_ECB__UART5_TXD                 0x0000208=
0 /* TXD */
>                         MX25_PAD_LBA__UART5_RXD                 0x0000000=
0 /* RXD */
>                         MX25_PAD_CS4__UART5_CTS                 0x0000200=
1 /* RTS */
>                         MX25_PAD_CS5__GPIO_3_21                 0x0000200=
1 /* #RXD_EN */
>                 >;
>                 enable-gpios =3D <&gpio3 21 GPIO_ACTIVE_LOW>;
>         };
>
> Would this make sense? Maybe with a more intuitive name?

I would point to "GPIO mode pitfalls" in
Documentation/driver-api/pinctl.rst

If the construction above is inside the SoC, this line is just called
"GPIO" out of habit.

Think about it: is it really "general purpose input/output"?
It looks more like "special purpose, output-only, RX-enable line".

The only reason it is called "GPIO" is because the bit activating
it happens to be inside some silicon block that the hardware
engineer calls "GPIO", but it is not GPIO.

I would definately try to set it up as part of the pin control state
in the device tree like you illustrate, and not use the enable-gpios
at all.

Possibly, if this bit also appears in a generic GPIO block with a bunch
of other GPIOs you need to mask off this GPIO from generic use
if you want to be pedantic about things. But generally we just leave
that kind of things open for the developer so they can freely
shoot themselves in the foot with it.

Yours,
Linus Walleij
