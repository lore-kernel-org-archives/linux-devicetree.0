From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Duplicated device tree and Dynamic symbols
Date: Fri, 17 Jul 2015 13:19:56 +0300
Message-ID: <891F3666-9DC9-493D-8D87-AE0E7813E197@konsulko.com>
References: <CAPybu_3CQ0vD=uj_gKwdcsQ_W7u-SRKzKDWOYaXvU83V8iYOqw@mail.gmail.com> <9E8352D3-3925-4362-95D0-F2284993FB0F@konsulko.com> <CAPybu_23vDtL5xxnUCUoNxwGTwVFGsNcGiS5Mg2M+u4jaQF1Sg@mail.gmail.com> <F843F38C-8990-40DD-AF7B-879213FA865C@konsulko.com> <CAPybu_1LX6swWfd4cgfRxeS00uOEvoZWV3cb1Ppz=XQs69JbUw@mail.gmail.com> <CAPybu_2N3tek5vHoZ768pwEeLj5cPfEVQh0pHXAaZzveTtoo1g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_2N3tek5vHoZ768pwEeLj5cPfEVQh0pHXAaZzveTtoo1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ricardo,

> On Jul 16, 2015, at 23:11 , Ricardo Ribalda Delgado <ricardo.ribalda@=
gmail.com> wrote:
>=20
> Ping?
>=20

On vacations, but take a look at:

https://github.com/pantoniou/dtc

Regards

=E2=80=94 Pantelis

> On Fri, Jun 12, 2015 at 11:53 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Pantelis
>>=20
>> Thanks for your patches, I will try to test it during the next week.
>> Just one question.
>>=20
>> Where can I find the dtc with support for __fixup__ and __local_fixu=
ps__ ?
>>=20
>> Seems that is its not part of /scripts/dtc or
>> https://git.kernel.org/cgit/utils/dtc/dtc.git/log/
>>=20
>> Thanks!
>>=20
>> On Fri, Jun 12, 2015 at 10:06 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi Ricardo,
>>>=20
>>>> On Jun 8, 2015, at 23:14 , Ricardo Ribalda Delgado <ricardo.ribald=
a@gmail.com> wrote:
>>>>=20
>>>> Hello Pantelis
>>>>=20
>>>> Any progress here?
>>>>=20
>>>=20
>>> I just posted a bunch of patches that make possible using PCI with =
device tree.
>>> Perhaps you=E2=80=99d like to take a look.
>>>=20
>>>> Thanks
>>>>=20
>>>=20
>>> Regards
>>>=20
>>> =E2=80=94 Pantelis
>>>=20
>>>> On Tue, Apr 28, 2015 at 10:36 AM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> Hi Ricardo,
>>>>>=20
>>>>>> On Apr 28, 2015, at 11:16 , Ricardo Ribalda Delgado <ricardo.rib=
alda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>=20
>>>>>> Hello
>>>>>>=20
>>>>>> I have an X86 platform with device tree support. It has multiple=
 pci
>>>>>> slots with a custom board that is described with a device tree.
>>>>>>=20
>>>>>> When the pci device is probed, the driver fetches a device tree =
from
>>>>>> the firmware infrastructure, patches the range property based on=
 the
>>>>>> bar address and adds the device to the main device tree.
>>>>>>=20
>>>>>> This works perfectly fine with only one card, but when the secon=
d card
>>>>>> is connected: Here be dragons :)
>>>>>>=20
>>>>>> The main issue is that of_find_node_by_phandle always resolves t=
o the
>>>>>> first connected card. I fixed this by creating a new function.
>>>>>> of_find_node_by_phandle_family() that chooses the closest phandl=
e on
>>>>>> the tree, not just the first one.
>>>>>>=20
>>>>>> By reading the "Dynamic Symbols support and fixup support"
>>>>>> here:
>>>>>> http://events.linuxfoundation.org/sites/events/files/slides/dyna=
mic-dt-elce14.pdf
>>>>>> and here
>>>>>> https://lwn.net/Articles/616859/
>>>>>>=20
>>>>>> It seemed that the patch would fix my issue and it would be alre=
ady
>>>>>> merged, but I cannot find the patch here
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
>>>>>> or here
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git
>>>>>>=20
>>>>>> So I am wondering some stuff:
>>>>>>=20
>>>>>> Would a patch adding my of_find_node_by_phandle_family() would b=
e accepted.?
>>>>>>=20
>>>>>> Will Dynamic symbols fix my issue?
>>>>>>=20
>>>>>> What is the status of Dynamic symbol support?
>>>>>>=20
>>>>>> Thanks!
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>> You=E2=80=99ll find it hard to believe but there=E2=80=99s someon=
e using something similar.
>>>>>=20
>>>>> I=E2=80=99m trying to figure out how to make it work; hang on to =
your horses. I=E2=80=99ll CC you
>>>>> when I post the patches.
>>>>>=20
>>>>>=20
>>>>>> --
>>>>>> Ricardo Ribalda
>>>>>=20
>>>>> Regards
>>>>>=20
>>>>> =E2=80=94 Pantelis
>>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>> --
>>>> Ricardo Ribalda
>>>=20
>>=20
>>=20
>>=20
>> --
>> Ricardo Ribalda
>=20
>=20
>=20
> --=20
> Ricardo Ribalda
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
