From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 10:48:50 +0300
Message-ID: <DEA751C5-5535-4EF8-B853-FB9DEEB56723@konsulko.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com> <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com> <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Oh, and since I forgot to include that earlier, there=E2=80=99s a git t=
ree against=20
mainline that I update regularly:

https://github.com/pantoniou/linux-beagle-track-mainline/tree/bbb-overl=
ays

Regards

=E2=80=94 Pantelis

> On May 7, 2015, at 10:17 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> =
wrote:
>=20
> On Tue, May 5, 2015 at 6:51 PM, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> On 5 May 2015 at 17:18, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> where is a device tree compiler that can compile an overlay?
>>>=20
>>> The compiler at git://git.kernel.org/pub/scm/utils/dtc/dtc.git shri=
eks
>>> there is a syntax error as soon as the /plugin/ tag is present.
>>=20
>> ok, so I found a dtc patch here https://lkml.org/lkml/2013/1/4/295
>>=20
>> This does not apply cleanly to current DTC but the parts that fail a=
re
>> due to cosmetic changes in the code so I went ahead and applied it.
>=20
> Thanks for the link! That patch indeed requires some manual rework.
>=20
>> However, the created blob is not what the kernel can accept into
>> of_overlay_create so what do I do with the blob to load it?
>=20
> Use "OF: DT-Overlay configfs interface" from Pantelis?
>=20
> That depends on "configfs: Implement binary attributes", also from Pa=
ntelis,
> which requires reverting commit 28444a2bde8d1695i ("configfs_add_file=
:
> fold into its sole caller").
>=20
> All of the above require manual fixups to apply.
>=20
> Still have to try the actual loading, new to the overlay game on main=
line
> kernels (I did use it on boneblack with its original kernel and its o=
verlay
> manager).
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
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
