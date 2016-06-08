From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Support cascaded GPIO chip lookup for OF
Date: Wed, 8 Jun 2016 18:32:09 +0300
Message-ID: <591EAFD4-F40B-4729-B0E7-EB3AC735FF2E@konsulko.com>
References: <1464985616-11821-1-git-send-email-pantelis.antoniou@konsulko.com> <1464985616-11821-3-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLi4=6v-8B8eF-H1iQGa+3Zh=rzAWbCAJubnLNEitPaLQ@mail.gmail.com> <8F93AE08-B340-481B-A5B3-F42227D9D729@konsulko.com> <CAL_Jsq+Z9NrvkZa0x4ZjC_POn96h1yQxXbrHsrMQ-MtvjWKWzQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+Z9NrvkZa0x4ZjC_POn96h1yQxXbrHsrMQ-MtvjWKWzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jun 8, 2016, at 18:18 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> On Wed, Jun 8, 2016 at 8:41 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Rob,
>>=20
>>> On Jun 8, 2016, at 00:00 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>>=20
>>> +Mark R
>>>=20
>>> On Fri, Jun 3, 2016 at 3:26 PM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> In certain cases it makes sense to create cascaded GPIO which
>>>> are not real GPIOs, merely point to the real backend GPIO chip.
>>>=20
>>> In what cases? Make it clear what this is for. Connectors of course=
,
>>> but are there any other use cases you have in mind.
>>>=20
>>=20
>> Connectors is one obvious use-case. In fact even when there is no
>> connector but there is an obvious interface abstraction point you
>> might want to use it.
>>=20
>> For instance a SoC package may have a number of different GPIO
>> controllers (that may or may not use the same IP block). You could
>> abstract all the gpio controllers away in a single GPIO controller
>> block.
>=20
> There had better be some good reason besides just wanting to make a
> single virtual controller.
>=20

The reason is to forward a gpio reference to a real h/w gpio device
while not having to expose said real gpio device details.=20

>>>> In order to support this, cascaded of_xlate lookup need to be
>>>> performed.
>>>>=20
>>>> For example let's take a connector that we want to abstract
>>>> having two GPIO pins from different GPIO controllers, connector
>>>> pin #0 connected to gpioA controller with offset 10 and gpioB
>>>> with 4.
>>>=20
>>> A connector's GPIO number may or may not be related to connector pi=
ns.
>>>=20
>>=20
>> Obviously, this is just an example.
>>=20
>>>> In pseudo DT form this is analogous to:
>>>>=20
>>>>       gpioA: gpioa@80000 {
>>>>               compatible =3D "foocorp,gpio";
>>>>               ...
>>>>       };
>>>>=20
>>>>       gpioB: gpiob@80800 {
>>>>               compatible =3D "foocorp,gpio";
>>>>               ....
>>>>       };
>>>>=20
>>>>       gpioC: controller_gpio {
>>>>               compatible =3D "cascaded-gpio";
>>>=20
>>> This compatible is kind of meaningless. I'd expect this to be a
>>> connector compatible.
>>>=20
>>=20
>> No, because this gpio patch is completely independent of the
>> existence of a connector.
>=20
> My point is that "cascaded-gpio" is not something used to parse the
> binding and will never be an accepted compatible string. I know it is
> an example, but you should make that obvious like foocorp is.
>=20

It doesn=E2=80=99t parse the binding; the xlate method of a driver does=
=2E =20

>>>>               gpios =3D <&gpioA 10>, <&gpioB 5>;
>>>=20
>>> As we discussed at ELC, I think this should be modeled after
>>> interrupt-map property like this:
>>>=20
>>> gpio-map =3D <0 0 &soc_gpio 10 0>, <1 0 &soc_gpio 5 0>;
>>> gpio-map-mask =3D <0xff 0>;
>>>=20
>>> This is more flexible, a known pattern, and allows remapping of fla=
g cells.
>>>=20
>>=20
>> It=E2=80=99s just syntactic sugar. It can work either way.
>>=20
>>> Also, we will likely have interrupt capable GPIOs, so they are goin=
g
>>> to need interrupt-map anyway.
>>>=20
>>=20
>> Devices that use interrupts usually convert the GPIO to an interrupt=
 and use it.
>> Since the xlat op will return the real GPIO spec the interrupt conve=
rsion will work.
>>=20
>> Bare interrupt lines are sort-of out of fashion nowadays I think. I=E2=
=80=99m eager to be
>> proven wrong though with a recent portable expansion board that uses=
 them.
>=20
> Uh, no! Practically every gpio controller is also an interrupt
> controller (in DT) and devices pretty much always see just an
> interrupt line. Just go look at all the I2C devices with an interrupt
> line. Unless devices have some special needs to control the gpio, we
> always use interrupts. Expansion boards may be dealing with the GPIO
> simply because that is the only option for userspace drivers.
>=20

Looking into a list of 54 capes for the beaglebone I can only find a si=
ngle
one that uses an interrupt instead of a gpio, and that can easily be co=
nverted
to using the gpio.

The IRQ forwarding case is easier than the GPIO one TBH. The IRQ parsin=
g core
can handle complex cases so adding a new one won=E2=80=99t be a big dea=
l.=20

> Rob

Regards

=E2=80=94 Pantelis--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
