From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] gpio:pca953x: add mechanism to simulate open drain outputs
Date: Fri, 25 Sep 2015 08:49:51 +0200
Message-ID: <FEB50554-2A45-4B3C-A896-EBF723AB3572@goldelico.com>
References: <cover.1443031678.git.hns@goldelico.com> <1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com> <CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYYGn71Z_pgtBpk5nwknDZ1VyRam9Fj=JDkNyt4KCWFmQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, eric miao <eric.miao@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marek Belisko <marek@goldelico.com>, Grazvydas Ignotas <notaz@openpandora.org>
List-Id: devicetree@vger.kernel.org


Am 25.09.2015 um 00:11 schrieb Linus Walleij <linus.walleij@linaro.org>=
:

> On Wed, Sep 23, 2015 at 11:13 AM, H. Nikolaus Schaller
> <hns@goldelico.com> wrote:
>=20
>> 1. add a DT property to specify the list of GPIO pins that are to be=
come
>>   "open drain"
>> 2. if a pin is configured as "open drain", set value by either outpu=
tting a
>>   "0" (low level) or switching to input (high impedance)
>>=20
>> Tested on OMAP5 uEVM with TCA6424 and some LEDs connected to 5V.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> I understand the approach, but this is the wrong way to do it.
> Instead of indicating that a pin on the pin controller should be
> open drain, the *consumer* specifying its gpios =3D <....> should
> do this.

On a second thought I am no longer sure if that is the right approach.

A gpio is for input and output of =930=94 and =931=94 values. And a gpi=
o consumer
can control if the output should be active or inactive and input.

How the output is physically represented (totem-pole or single-ended,
high power, low power etc.) is not a property of the gpio itself and
there is IMHO no need for the consumer to be able to define (or change)
it.

On SoC with integrated gpio controllers it is very common to have
pinmux definitions completely separated from the gpio controller
properties. But the gpio consumer can connect to pinctrl settings
to describe that the pin should have certain physical properties.

There, it is common to be able to enable/disable pull-up/downs as
well.

So turning a totem-pole output (as it is available in the tca6424)
into an open-drain output is sort of turning off the pull-up transistor=
=2E
I.e. comparable to a pinmux setting.

So such controllers should get the option to define pinctrl.

Some chips might have special control registers for doing that
while others need the trick to switch between input and output
mode but that is driver implementation detail.

But I am not sure if this has other implications.

>=20
> I just sent a patch adding the bindings because Tony Lindgren
> and Grygorii Strashko approached me similar problems so let's
> begin with the bindings.
>=20
> Implementing it in the kernel requires some elaboration and it's
> going to be more complicated than this local approach, but it
> will be more generic and reusable so that is what we need to do.
>=20
> Yours,
> Linus Walleij

BR,
Nikolaus Schaller--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
