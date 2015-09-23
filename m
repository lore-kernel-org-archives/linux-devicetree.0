From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v2 0/7] New Atmel PIO4 pinctrl/gpio driver
Date: Wed, 23 Sep 2015 16:46:31 +0200
Message-ID: <5602BB47.4040401@atmel.com>
References: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
 <CACRpkdYLbifY9VJK0FFf7xXdMJWstdGP=h5ApBMRyRXZHPDUaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYLbifY9VJK0FFf7xXdMJWstdGP=h5ApBMRyRXZHPDUaw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le 21/09/2015 20:50, Linus Walleij a =C3=A9crit :
> On Wed, Sep 16, 2015 at 8:36 AM, Ludovic Desroches
> <ludovic.desroches@atmel.com> wrote:
>=20
>> The Atmel PIO4 controller has been introduced with SAMA5D2 chip fami=
ly. This
>> drivers manages both pinmux/pinconf and gpio stuff. It is inspired b=
y Mediatek
>> pinctrl driver.
>>
>> Changes from v1:
>> - remove some unneeded gpio specific ops (gpio_request, gpio_free,
>>   gpio_request_enable, gpio_disable_free and gpio_set_direction).
>> - code styling fixes.
>> - add sama5d2 pin description and device pin muxing.
>=20
> Looks Good To Me, and has Sascha's ACKs, so merged patches
> 1, 2, 3, 4 to the pinctrl tree. Please merge the AT91 DT things into
> the AT91 tree.

Great!

So patch 5 is included in at91-4.4-defconfig branch.
patches 6 and 7 queued in at91-4.4-dt branch.
They are included in at91-next that is merged in linux-next and will
both take the arm-soc path later in the cycle.

Thanks, bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
