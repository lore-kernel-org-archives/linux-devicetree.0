From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v2 5/7] ARM: at91/defconfig: sama5: add PIO4 controller
 support
Date: Wed, 23 Sep 2015 16:44:13 +0200
Message-ID: <5602BABD.7060308@atmel.com>
References: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
 <1442417823-15850-6-git-send-email-ludovic.desroches@atmel.com>
 <CACRpkdY0iV+_xyfBSuUPuaRuZLfYYtpLHp5W7a-EYxxKrfEcVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY0iV+_xyfBSuUPuaRuZLfYYtpLHp5W7a-EYxxKrfEcVA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Le 21/09/2015 20:25, Linus Walleij a =C3=A9crit :
> On Wed, Sep 16, 2015 at 8:37 AM, Ludovic Desroches
> <ludovic.desroches@atmel.com> wrote:
>=20
>> SAMA5D2 chip family has a new PIO controller.
>>
>> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Please merge this through Nicolas' AT91 tree.

Added in the at91-4.4-defconfig branch.

Thanks.

Paul,

This symbol will appear in Linus W.'s tree and is selected in mine. So
you may find that the symbol appear unused before the two trees are
merged in Linux-next or mainline.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
