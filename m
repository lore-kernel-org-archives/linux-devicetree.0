From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 21 Sep 2015 15:36:47 +0300
Message-ID: <324F27EC-FC71-4C50-926A-08AAF2A1114C@konsulko.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com> <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Sep 21, 2015, at 15:35 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Wed, Sep 16, 2015 at 6:11 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Changesets are very powerful, but the lack of a helper API
>> makes using them cumbersome. Introduce a simple copy based
>> API that makes things considerably easier.
>>=20
>> To wit, adding a property using the raw API.
>>=20
>>        struct property *prop;
>>        prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>        prop->name =3D kstrdup("compatible");
>>        prop->value =3D kstrdup("foo,bar");
>>        prop->length =3D strlen(prop->value) + 1;
>>        of_changeset_add_property(ocs, np, prop);
>>=20
>> while using the helper API
>>=20
>>        of_changeset_add_property_string(ocs, np, "compatible",
>>                        "foo,bar");
>=20
> What about removing properties?
>=20

Once upon a time there was that capability. It was removed after we did=
n=E2=80=99t have
a good use for them yet. Do you have any? I=E2=80=99d be happy to re-ad=
d it :)


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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
