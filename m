From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Mon, 30 Mar 2015 20:13:27 +0300
Message-ID: <783D9BFE-44A7-402D-A0FF-F32A2F5068EE@konsulko.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com> <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com> <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com> <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com> <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Mar 30, 2015, at 16:27 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>=20
> Hi Pantelis,
>=20
> On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert-Td1EMuHUCqygBwfqmJ+zsg@public.gmane.org=
g> wrote:
>>> On Fri, Mar 20, 2015 at 12:39 PM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely@secretlab.=
ca> wrote:
>>>>> On Tue, 16 Dec 2014 14:11:31 +0200
>>>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>>> wrote:
>>>>>> A nice side-effect of the changes in DTC for supporting overlays
>>>>>> is that it is now possible to do dependency tracking of platform
>>>>>> devices automatically.
>>>>>>=20
>>>>>> This patch implements dependency aware probe order for users
>>>>>> of of_platform_populate.
>>>>>>=20
>>>>>> There are no changes in the syntax of the DTS bindings, the
>>>>>> dependency is generated automatically by the use of phandle
>>>>>> references.
>>>>>=20
>>>>> Do you have measurements showing improvement? Conceptually, I don=
't have
>>>>> a problem with having a small scale solution like this, but I wan=
t proof
>>>>> that it actively makes things better, and is worth the extra comp=
lexity.
>>>>> It's not an easy block of code to understand.
>>>>=20
>>>> I will be the first to admit that the code it=E2=80=99s a bit hard=
 to follow, but
>>>> that=E2=80=99s the nature of trees and recursion.
>>>>=20
>>>> FWIW I=E2=80=99ve been booting with this applied for a month with =
no adverse effects,
>>>> besides the fact that there dependency cycles which I would file a=
s a bug.
>>>=20
>>> IIUC, this would fix the issue I worked around in "ARM: shmobile: r=
8a73a4:
>>> Move pfc node to work around probe ordering bug"?
>>> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/comm=
it/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52ce=
c100414d2f178440efc91
>>=20
>> A victim^Wtester! Yeah, it=E2=80=99s supposed to do that, but no gua=
rantees, this is an RFC.
>>=20
>> I would be happy to know if it solves your problem or not, please ke=
ep me in the loop.
>>=20
>>> I'll give it a try when I'm back from ELC...
>=20
> And so I did. I
>  1. Moved the pfc node in arch/arm/boot/dts/r8a73a4.dtsi back between=
 dmac
>     and i2c5.
>  2. Applied your patch,
>  3. Disabled the check for "/__local_fixups__" in
>     __of_platform_populate_scan().
>  4. Added support for "interrupts-extended" (gmail-whitespace-damaged=
 patch
>     at the end of this email),
>  5. Enabled DEBUG,
>  6. Uncommented all your debug pr_info() calls (except the one for
>     "interrupts", as it references non-existing variables!).
>=20
> But it didn't make any difference. The debug log below shows that it =
detects
> the dependency of pfc@e6050000 on irqc0 (interrupt-controller@e61c000=
0)
> irqc1 (interrupt-controller@e61c0200), but it doesn't reorder the nod=
es,
> so pfc is still initialized first:
>=20

Interesting. I guess this are indeed more complicated.

It is good that it detects the dependency first, and registers
the devices in the correct order.

The problem is that this is not enough. The probe is initiated when the
drivers are registered afterwards, but not in any particular order.

So we need to do deferred matching for this to work reliably.

Thank you so much for taking the time to send this debug log.
It does help considerably.

Regards

=E2=80=94 Pantelis

[snip]

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
