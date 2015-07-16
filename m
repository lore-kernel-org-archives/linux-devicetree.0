From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Duplicated device tree and Dynamic symbols
Date: Thu, 16 Jul 2015 22:11:14 +0200
Message-ID: <CAPybu_2N3tek5vHoZ768pwEeLj5cPfEVQh0pHXAaZzveTtoo1g@mail.gmail.com>
References: <CAPybu_3CQ0vD=uj_gKwdcsQ_W7u-SRKzKDWOYaXvU83V8iYOqw@mail.gmail.com>
 <9E8352D3-3925-4362-95D0-F2284993FB0F@konsulko.com> <CAPybu_23vDtL5xxnUCUoNxwGTwVFGsNcGiS5Mg2M+u4jaQF1Sg@mail.gmail.com>
 <F843F38C-8990-40DD-AF7B-879213FA865C@konsulko.com> <CAPybu_1LX6swWfd4cgfRxeS00uOEvoZWV3cb1Ppz=XQs69JbUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_1LX6swWfd4cgfRxeS00uOEvoZWV3cb1Ppz=XQs69JbUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ping?

On Fri, Jun 12, 2015 at 11:53 PM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Pantelis
>
> Thanks for your patches, I will try to test it during the next week.
> Just one question.
>
> Where can I find the dtc with support for __fixup__ and __local_fixup=
s__ ?
>
> Seems that is its not part of /scripts/dtc or
> https://git.kernel.org/cgit/utils/dtc/dtc.git/log/
>
> Thanks!
>
> On Fri, Jun 12, 2015 at 10:06 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Ricardo,
>>
>>> On Jun 8, 2015, at 23:14 , Ricardo Ribalda Delgado <ricardo.ribalda=
@gmail.com> wrote:
>>>
>>> Hello Pantelis
>>>
>>> Any progress here?
>>>
>>
>> I just posted a bunch of patches that make possible using PCI with d=
evice tree.
>> Perhaps you=E2=80=99d like to take a look.
>>
>>> Thanks
>>>
>>
>> Regards
>>
>> =E2=80=94 Pantelis
>>
>>> On Tue, Apr 28, 2015 at 10:36 AM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hi Ricardo,
>>>>
>>>>> On Apr 28, 2015, at 11:16 , Ricardo Ribalda Delgado <ricardo.riba=
lda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>
>>>>> Hello
>>>>>
>>>>> I have an X86 platform with device tree support. It has multiple =
pci
>>>>> slots with a custom board that is described with a device tree.
>>>>>
>>>>> When the pci device is probed, the driver fetches a device tree f=
rom
>>>>> the firmware infrastructure, patches the range property based on =
the
>>>>> bar address and adds the device to the main device tree.
>>>>>
>>>>> This works perfectly fine with only one card, but when the second=
 card
>>>>> is connected: Here be dragons :)
>>>>>
>>>>> The main issue is that of_find_node_by_phandle always resolves to=
 the
>>>>> first connected card. I fixed this by creating a new function.
>>>>> of_find_node_by_phandle_family() that chooses the closest phandle=
 on
>>>>> the tree, not just the first one.
>>>>>
>>>>> By reading the "Dynamic Symbols support and fixup support"
>>>>> here:
>>>>> http://events.linuxfoundation.org/sites/events/files/slides/dynam=
ic-dt-elce14.pdf
>>>>> and here
>>>>> https://lwn.net/Articles/616859/
>>>>>
>>>>> It seemed that the patch would fix my issue and it would be alrea=
dy
>>>>> merged, but I cannot find the patch here
>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
>>>>> or here
>>>>> https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git
>>>>>
>>>>> So I am wondering some stuff:
>>>>>
>>>>> Would a patch adding my of_find_node_by_phandle_family() would be=
 accepted.?
>>>>>
>>>>> Will Dynamic symbols fix my issue?
>>>>>
>>>>> What is the status of Dynamic symbol support?
>>>>>
>>>>> Thanks!
>>>>>
>>>>>
>>>>
>>>> You=E2=80=99ll find it hard to believe but there=E2=80=99s someone=
 using something similar.
>>>>
>>>> I=E2=80=99m trying to figure out how to make it work; hang on to y=
our horses. I=E2=80=99ll CC you
>>>> when I post the patches.
>>>>
>>>>
>>>>> --
>>>>> Ricardo Ribalda
>>>>
>>>> Regards
>>>>
>>>> =E2=80=94 Pantelis
>>>>
>>>
>>>
>>>
>>> --
>>> Ricardo Ribalda
>>
>
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
