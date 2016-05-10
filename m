From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Support hashtable lookups for phandles
Date: Tue, 10 May 2016 16:45:20 +0300
Message-ID: <B0B8EAD0-838D-43BF-9B54-B8F7E30FF226@konsulko.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-3-git-send-email-pantelis.antoniou@konsulko.com> <CAMuHMdXBnxTaKB4io4j4jbbUh+QU0b_Fj8zYi_K_7NZSE33YpQ@mail.gmail.com> <CAL_JsqLsztrWr8mQwCHzA+qkrRev0Kfr--BkMiPVRVycZp0A=Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLsztrWr8mQwCHzA+qkrRev0Kfr--BkMiPVRVycZp0A=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 10, 2016, at 00:11 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Mon, May 9, 2016 at 3:38 PM, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>> Hi Pantelis,
>>=20
>> On Mon, May 9, 2016 at 8:11 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>=20
>>> @@ -1073,9 +1097,14 @@ struct device_node *of_find_node_by_phandle(=
phandle handle)
>>>                return NULL;
>>>=20
>>>        raw_spin_lock_irqsave(&devtree_lock, flags);
>>> -       for_each_of_allnodes(np)
>>> -               if (np->phandle =3D=3D handle)
>>> -                       break;
>>> +       /* when we're ready use the hash table */
>>> +       if (of_phandle_ht_available() && !in_interrupt())
>>=20
>> I guess the !in_interrupt() test is because of the locking inside
>> rhashtable_lookup_fast()?
>=20
> Not a use we should support. Just warn for anyone parsing DT in
> interrupt context.
>=20

That=E2=80=99s not about users calling in interrupt context. It=E2=80=99=
s when we=E2=80=99re
very early in the boot sequence we=E2=80=99re under interrupt context a=
nd
calls to the hash methods cannot be made.

> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
