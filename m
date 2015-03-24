From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Tue, 24 Mar 2015 10:56:44 -0700
Message-ID: <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com> <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com> <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>=
 wrote:
>=20
> Hi Pantelis, Grant,
>=20
> On Fri, Mar 20, 2015 at 12:39 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org=
> wrote:
>>>=20
>>> On Tue, 16 Dec 2014 14:11:31 +0200
>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> wrote:
>>>> A nice side-effect of the changes in DTC for supporting overlays
>>>> is that it is now possible to do dependency tracking of platform
>>>> devices automatically.
>>>>=20
>>>> This patch implements dependency aware probe order for users
>>>> of of_platform_populate.
>>>>=20
>>>> There are no changes in the syntax of the DTS bindings, the
>>>> dependency is generated automatically by the use of phandle
>>>> references.
>>>=20
>>> Do you have measurements showing improvement? Conceptually, I don't=
 have
>>> a problem with having a small scale solution like this, but I want =
proof
>>> that it actively makes things better, and is worth the extra comple=
xity.
>>> It's not an easy block of code to understand.
>>>=20
>>=20
>> I will be the first to admit that the code it=E2=80=99s a bit hard t=
o follow, but
>> that=E2=80=99s the nature of trees and recursion.
>>=20
>> FWIW I=E2=80=99ve been booting with this applied for a month with no=
 adverse effects,
>> besides the fact that there dependency cycles which I would file as =
a bug.
>=20
> IIUC, this would fix the issue I worked around in "ARM: shmobile: r8a=
73a4:
> Move pfc node to work around probe ordering bug"?
> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/commit=
/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52cec1=
00414d2f178440efc91
>=20

A victim^Wtester! Yeah, it=E2=80=99s supposed to do that, but no guaran=
tees, this is an RFC.

I would be happy to know if it solves your problem or not, please keep =
me in the loop.

> I'll give it a try when I'm back from ELC...
>=20
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
