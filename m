From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 11:09:20 +0300
Message-ID: <67E0CBA3-C499-4A98-9F23-E228E334546D@konsulko.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com> <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com> <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com> <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84@konsulko.com> <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michal,

> On May 7, 2015, at 11:07 , Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> Hello,
>=20
> On 7 May 2015 at 09:28, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Geert,
>>=20
>>> On May 7, 2015, at 10:17 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org=
> wrote:
>>>=20
>>> On Tue, May 5, 2015 at 6:51 PM, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>> On 5 May 2015 at 17:18, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>>>>> where is a device tree compiler that can compile an overlay?
>>>>>=20
>>>>> The compiler at git://git.kernel.org/pub/scm/utils/dtc/dtc.git sh=
rieks
>>>>> there is a syntax error as soon as the /plugin/ tag is present.
>>>>=20
>>>> ok, so I found a dtc patch here https://lkml.org/lkml/2013/1/4/295
>>>>=20
>>>> This does not apply cleanly to current DTC but the parts that fail=
 are
>>>> due to cosmetic changes in the code so I went ahead and applied it=
=2E
>>>=20
>>> Thanks for the link! That patch indeed requires some manual rework.
>>>=20
>>>> However, the created blob is not what the kernel can accept into
>>>> of_overlay_create so what do I do with the blob to load it?
>>>=20
>>> Use "OF: DT-Overlay configfs interface" from Pantelis?
>>>=20
>>> That depends on "configfs: Implement binary attributes", also from =
Pantelis,
>>> which requires reverting commit 28444a2bde8d1695i ("configfs_add_fi=
le:
>>> fold into its sole caller").
>>>=20
>>> All of the above require manual fixups to apply.
>>>=20
>>> Still have to try the actual loading, new to the overlay game on ma=
inline
>>> kernels (I did use it on boneblack with its original kernel and its=
 overlay
>>> manager).
>>>=20
>>=20
>> Posted the patches recently, but for your convenience here=E2=80=99s=
 the git tree.
>>=20
>> https://github.com/pantoniou/dtc/tree/dt-overlays5
>>=20
>> FWIW, I=E2=80=99ll post the capemgr patch today too.
>>=20
>=20
> I did not find those so tried loading the overlay by hand. FWIW like
> the half dozen patches of this https://github.com/hramrach/linux-sunx=
i
> are the overlay loading atm.
>=20
> I can cat the overlay blob to sysfs and it creates a device so I gues=
s
> it basically works.
>=20
> What I need to investigate is exporting some useful information about
> the overlays in sysfs.
>=20

If you were to share some details of what you=E2=80=99re trying to achi=
eve I might be able to help.

I have no clue what you guys are trying to do :)

> Thanks
>=20
> Michal

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
