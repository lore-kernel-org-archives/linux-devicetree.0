From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 16 Jul 2015 10:18:38 +0200
Message-ID: <C83A636F-4C5C-4C11-A3CA-B4C4624B5375@smart-africa.com>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de> <267A46E7-C5C5-4696-90CC-D44F4130B3EF@smart-africa.com> <20150702142058.GA9349@localhost.localdomain> <CACRpkdb_3B8749X-p_XEPGvZPEQ56-gMdLBcPrgjXkqWCiz1PQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb_3B8749X-p_XEPGvZPEQ56-gMdLBcPrgjXkqWCiz1PQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Cochran <richardcochran@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alan Tull <atull@altera.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org


> On 16 Jul 2015, at 9:57 AM, Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> On Thu, Jul 2, 2015 at 4:20 PM, Richard Cochran
> <richardcochran@gmail.com> wrote:
>> On Thu, Jul 02, 2015 at 08:05:26AM +0100, Michael van der Westhuizen=
 wrote:
>=20
>> Anyhow, the whole point is, when the data sheet says that the SoC ha=
s
>> GPIO0 to GPION, then those numbers should be exposed to user space.
>=20
> The gpio_chip has this:
>=20
> struct gpio_chip {
>        const char              *label;
>        struct device           *dev;
> (...)
>        const char              *const *names;
> (...)
>=20
> If you want to help the users, provide string names for all the GPIO =
lines
> and suggest them to do code in userspace that use these names instead
> of GPIO numbers.
>=20
> Also the string names "gpio0", "gpio1" etc are much better than just =
using
> the Linux-specific numbers.
>=20
> So what about making a patch to drivers/gpio/gpio-dwapb.c that adds t=
he
> .names property to its GPIO chip?

That would meet my needs.  I=E2=80=99ll start putting something togethe=
r.

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
