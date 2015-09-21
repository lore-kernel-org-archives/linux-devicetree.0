From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 21 Sep 2015 15:49:07 +0300
Message-ID: <EA80A53C-430B-450D-B843-21DFF0FB01D8@konsulko.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com> <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg@mail.gmail.com> <324F27EC-FC71-4C50-926A-08AAF2A1114C@konsulko.com> <CAMuHMdUDXZFun7+y3axnz6HKiNaeJnPkVG6Qhq6y4=mcCpPL2w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUDXZFun7+y3axnz6HKiNaeJnPkVG6Qhq6y4=mcCpPL2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Sep 21, 2015, at 15:47 , Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Mon, Sep 21, 2015 at 2:36 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>>> On Sep 21, 2015, at 15:35 , Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>> On Wed, Sep 16, 2015 at 6:11 PM, Pantelis Antoniou
>>> <pantelis.antoniou@konsulko.com> wrote:
>>>> Changesets are very powerful, but the lack of a helper API
>>>> makes using them cumbersome. Introduce a simple copy based
>>>> API that makes things considerably easier.
>>>>=20
>>>> To wit, adding a property using the raw API.
>>>>=20
>>>>       struct property *prop;
>>>>       prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>>>       prop->name =3D kstrdup("compatible");
>>>>       prop->value =3D kstrdup("foo,bar");
>>>>       prop->length =3D strlen(prop->value) + 1;
>>>>       of_changeset_add_property(ocs, np, prop);
>>>>=20
>>>> while using the helper API
>>>>=20
>>>>       of_changeset_add_property_string(ocs, np, "compatible",
>>>>                       "foo,bar");
>>>=20
>>> What about removing properties?
>>=20
>> Once upon a time there was that capability. It was removed after we =
didn=E2=80=99t have
>> a good use for them yet. Do you have any? I=E2=80=99d be happy to re=
-add it :)
>=20
> Aliases?
>=20
> If an overlay removes e.g. a serial port, it should remove its alias,=
 too.
>=20

Well, that case is handled. Addition of a property results in removal o=
f a property when
the overlay is reverted.

This is an accessor API that makes things simpler than what=E2=80=99s i=
nternally used at
overlays.

We=E2=80=99re talking about removal of a property/node as part of appli=
cation.

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
