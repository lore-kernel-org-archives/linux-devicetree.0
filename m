From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Fri, 3 Jul 2015 14:30:12 +0100
Message-ID: <A32F9C0A-E306-44CE-A556-281FFF64865C@smart-africa.com>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de> <5594E9F6.7040701@linutronix.de> <20150702142601.GB9349@localhost.localdomain> <55954B17.3020303@linutronix.de> <20150702152147.GA10111@localhost.localdomain> <55955EB5.4090400@linutronix.de> <038289C9-2848-4545-B450-7D4EA074CD26@smart-africa.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <038289C9-2848-4545-B450-7D4EA074CD26@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alan Tull <atull@altera.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org


> On 02 Jul 2015, at 5:02 PM, Michael van der Westhuizen <michael@smart=
-africa.com> wrote:
>=20
>=20
>> On 02 Jul 2015, at 4:54 PM, Sebastian Andrzej Siewior <bigeasy@linut=
ronix.de> wrote:
>>=20
>> On 07/02/2015 05:21 PM, Richard Cochran wrote:
>>> On Thu, Jul 02, 2015 at 04:30:47PM +0200, Sebastian Andrzej Siewior=
 wrote:
>>>> On 07/02/2015 04:26 PM, Richard Cochran wrote:
>>>>> On Thu, Jul 02, 2015 at 09:36:22AM +0200, Sebastian Andrzej Siewi=
or wrote:
>>>>>> If you are in a specific SoC you could do
>>>>>> 	base =3D of_alias_get_id(np, "gpio") * num_of_gpio_per_chip
>>>>>> and get consistent numbers / sane.
>>>>>=20
>>>>> And what about /sys/class/gpio ?
>>>>=20
>>>> What about it?
>>>=20
>>> The poor users of that interface cannot use "of_alias_get_id" as yo=
u suggest.
>>=20
>> You do that in the driver. The only problem with that is that the
>> synopsys controller can have between one and four banks and a bank c=
an
>> have 1-32 GPIOs if I remember correctly. That means you can't have a
>> static number of GPIOs like others do.
>=20
> This is correct.
>=20
>> Therefore I think a starting property is the only way and I would
>> prefer a generic one.
>=20
> I would prefer a generic property too.  I was rather surprised that o=
ne did not exist.

=E2=80=A6 looking into this more closely, by the time we get into gpioc=
hip_add there=E2=80=99s no notion
of the DT node that is associated to the gpiochip being added (and the =
gpiochip->dev
points to the parent device, which is the generally the parent DT node)=
, so this can=E2=80=99t be
done generically without at least some churn in the individual drivers.

Michael--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
