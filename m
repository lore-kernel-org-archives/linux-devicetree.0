From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 21 Sep 2015 16:11:19 +0300
Message-ID: <F6E3C79C-50D7-4092-A38A-25E97D6F50A9@konsulko.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com> <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg@mail.gmail.com> <324F27EC-FC71-4C50-926A-08AAF2A1114C@konsulko.com> <CAMuHMdUDXZFun7+y3axnz6HKiNaeJnPkVG6Qhq6y4=mcCpPL2w@mail.gmail.com> <EA80A53C-430B-450D-B843-21DFF0FB01D8@konsulko.com> <CAMuHMdXEzZxu8Hg6Z6u1ZEe0ondU+S0ffBvxYGzid38sXAksDw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXEzZxu8Hg6Z6u1ZEe0ondU+S0ffBvxYGzid38sXAksDw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Sep 21, 2015, at 16:07 , Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Mon, Sep 21, 2015 at 2:49 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>>> On Sep 21, 2015, at 15:47 , Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>> On Mon, Sep 21, 2015 at 2:36 PM, Pantelis Antoniou
>>> <pantelis.antoniou@konsulko.com> wrote:
>>>>> On Sep 21, 2015, at 15:35 , Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>>>>> On Wed, Sep 16, 2015 at 6:11 PM, Pantelis Antoniou
>>>>> <pantelis.antoniou@konsulko.com> wrote:
>>>>>> Changesets are very powerful, but the lack of a helper API
>>>>>> makes using them cumbersome. Introduce a simple copy based
>>>>>> API that makes things considerably easier.
>>>>>>=20
>>>>>> To wit, adding a property using the raw API.
>>>>>>=20
>>>>>>      struct property *prop;
>>>>>>      prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>>>>>      prop->name =3D kstrdup("compatible");
>>>>>>      prop->value =3D kstrdup("foo,bar");
>>>>>>      prop->length =3D strlen(prop->value) + 1;
>>>>>>      of_changeset_add_property(ocs, np, prop);
>>>>>>=20
>>>>>> while using the helper API
>>>>>>=20
>>>>>>      of_changeset_add_property_string(ocs, np, "compatible",
>>>>>>                      "foo,bar");
>>>>>=20
>>>>> What about removing properties?
>>>>=20
>>>> Once upon a time there was that capability. It was removed after w=
e didn=E2=80=99t have
>>>> a good use for them yet. Do you have any? I=E2=80=99d be happy to =
re-add it :)
>>>=20
>>> Aliases?
>>>=20
>>> If an overlay removes e.g. a serial port, it should remove its alia=
s, too.
>>=20
>> Well, that case is handled. Addition of a property results in remova=
l of a property when
>> the overlay is reverted.
>=20
> Actually what I meant is the other way around: _adding_ the overlay w=
ould
> _remove_ the alias.
>=20
> I have a board with an SDHI connector, and an expansion connector.
> SDHI and serial on the expansion connector share the same pins.
> By default, SDHI is enabled in the DTS.
>=20
> To add a serial port to the expansion connector, I disable the SDHI d=
evice,
> add the alias, and add the serial device.
> (dtsi in http://www.spinics.net/lists/devicetree/msg79438.html)
>=20
> Now imagine doing the opposite: having the serial device enabled by d=
efault.
> Then the overlay should disable the serial device, remove the alias, =
and add
> the SDHI device.
>=20

Excellent; this is the use-case I was looking for :)

> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20

Regards

=E2=80=94 Pantelis

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds
