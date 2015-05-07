From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 10:07:17 +0200
Message-ID: <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew@mail.gmail.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com>
 <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com>
 <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com> <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 7 May 2015 at 09:28, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Geert,
>
>> On May 7, 2015, at 10:17 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>>
>> On Tue, May 5, 2015 at 6:51 PM, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>>> On 5 May 2015 at 17:18, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> where is a device tree compiler that can compile an overlay?
>>>>
>>>> The compiler at git://git.kernel.org/pub/scm/utils/dtc/dtc.git shr=
ieks
>>>> there is a syntax error as soon as the /plugin/ tag is present.
>>>
>>> ok, so I found a dtc patch here https://lkml.org/lkml/2013/1/4/295
>>>
>>> This does not apply cleanly to current DTC but the parts that fail =
are
>>> due to cosmetic changes in the code so I went ahead and applied it.
>>
>> Thanks for the link! That patch indeed requires some manual rework.
>>
>>> However, the created blob is not what the kernel can accept into
>>> of_overlay_create so what do I do with the blob to load it?
>>
>> Use "OF: DT-Overlay configfs interface" from Pantelis?
>>
>> That depends on "configfs: Implement binary attributes", also from P=
antelis,
>> which requires reverting commit 28444a2bde8d1695i ("configfs_add_fil=
e:
>> fold into its sole caller").
>>
>> All of the above require manual fixups to apply.
>>
>> Still have to try the actual loading, new to the overlay game on mai=
nline
>> kernels (I did use it on boneblack with its original kernel and its =
overlay
>> manager).
>>
>
> Posted the patches recently, but for your convenience here=E2=80=99s =
the git tree.
>
> https://github.com/pantoniou/dtc/tree/dt-overlays5
>
> FWIW, I=E2=80=99ll post the capemgr patch today too.
>

I did not find those so tried loading the overlay by hand. FWIW like
the half dozen patches of this https://github.com/hramrach/linux-sunxi
are the overlay loading atm.

I can cat the overlay blob to sysfs and it creates a device so I guess
it basically works.

What I need to investigate is exporting some useful information about
the overlays in sysfs.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
