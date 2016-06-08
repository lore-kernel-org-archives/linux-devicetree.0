From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Wed, 8 Jun 2016 16:41:12 +0300
Message-ID: <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com> <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jun 8, 2016, at 00:00 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> +Mark R
>=20
> On Fri, Jun 3, 2016 at 3:26 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> In certain cases it makes sense to create cascaded GPIO which
>> are not real GPIOs, merely point to the real backend GPIO chip.
>=20
> In what cases? Make it clear what this is for. Connectors of course,
> but are there any other use cases you have in mind.
>=20

Connectors is one obvious use-case. In fact even when there is no
connector but there is an obvious interface abstraction point you
might want to use it.

=46or instance a SoC package may have a number of different GPIO
controllers (that may or may not use the same IP block). You could
abstract all the gpio controllers away in a single GPIO controller
block.

>> In order to support this, cascaded of_xlate lookup need to be
>> performed.
>>=20
>> For example let's take a connector that we want to abstract
>> having two GPIO pins from different GPIO controllers, connector
>> pin #0 connected to gpioA controller with offset 10 and gpioB
>> with 4.
>=20
> A connector's GPIO number may or may not be related to connector pins=
=2E
>=20

Obviously, this is just an example.

>> In pseudo DT form this is analogous to:
>>=20
>>        gpioA: gpioa@80000 {
>>                compatible =3D "foocorp,gpio";
>>                ...
>>        };
>>=20
>>        gpioB: gpiob@80800 {
>>                compatible =3D "foocorp,gpio";
>>                ....
>>        };
>>=20
>>        gpioC: controller_gpio {
>>                compatible =3D "cascaded-gpio";
>=20
> This compatible is kind of meaningless. I'd expect this to be a
> connector compatible.
>=20

No, because this gpio patch is completely independent of the
existence of a connector.
=20
>>                gpios =3D <&gpioA 10>, <&gpioB 5>;
>=20
> As we discussed at ELC, I think this should be modeled after
> interrupt-map property like this:
>=20
> gpio-map =3D <0 0 &soc_gpio 10 0>, <1 0 &soc_gpio 5 0>;
> gpio-map-mask =3D <0xff 0>;
>=20
> This is more flexible, a known pattern, and allows remapping of flag =
cells.
>=20

It=E2=80=99s just syntactic sugar. It can work either way.

> Also, we will likely have interrupt capable GPIOs, so they are going
> to need interrupt-map anyway.
>=20

Devices that use interrupts usually convert the GPIO to an interrupt an=
d use it.
Since the xlat op will return the real GPIO spec the interrupt conversi=
on will work.

Bare interrupt lines are sort-of out of fashion nowadays I think. I=E2=80=
=99m eager to be
proven wrong though with a recent portable expansion board that uses th=
em.

> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
