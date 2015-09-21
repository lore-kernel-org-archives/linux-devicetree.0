From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 21 Sep 2015 14:47:15 +0200
Message-ID: <CAMuHMdUDXZFun7+y3axnz6HKiNaeJnPkVG6Qhq6y4=mcCpPL2w@mail.gmail.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com>
	<CAMuHMdXWwZ4BZsR8qqpM1Z6hVj9e3Z0Z4bypm42PFZ_C6KX+tg@mail.gmail.com>
	<324F27EC-FC71-4C50-926A-08AAF2A1114C@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <324F27EC-FC71-4C50-926A-08AAF2A1114C-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Mon, Sep 21, 2015 at 2:36 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On Sep 21, 2015, at 15:35 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org=
> wrote:
>> On Wed, Sep 16, 2015 at 6:11 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Changesets are very powerful, but the lack of a helper API
>>> makes using them cumbersome. Introduce a simple copy based
>>> API that makes things considerably easier.
>>>
>>> To wit, adding a property using the raw API.
>>>
>>>        struct property *prop;
>>>        prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>>        prop->name =3D kstrdup("compatible");
>>>        prop->value =3D kstrdup("foo,bar");
>>>        prop->length =3D strlen(prop->value) + 1;
>>>        of_changeset_add_property(ocs, np, prop);
>>>
>>> while using the helper API
>>>
>>>        of_changeset_add_property_string(ocs, np, "compatible",
>>>                        "foo,bar");
>>
>> What about removing properties?
>
> Once upon a time there was that capability. It was removed after we d=
idn=E2=80=99t have
> a good use for them yet. Do you have any? I=E2=80=99d be happy to re-=
add it :)

Aliases?

If an overlay removes e.g. a serial port, it should remove its alias, t=
oo.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
