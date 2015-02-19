From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 19:00:18 +0200
Message-ID: <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54E613E7.2020405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>=20
> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>> Hi Mark,
>>=20
>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wro=
te:
>>>=20
>>>>>> +While this may in theory work, in practice it is very cumbersom=
e
>>>>>> +for the following reasons:
>>>>>> +
>>>>>> +1. The act of selecting a different boot device tree blob requi=
res
>>>>>> +a reasonably advanced bootloader with some kind of configuratio=
n or
>>>>>> +scripting capabilities. Sadly this is not the case many times, =
the
>>>>>> +bootloader is extremely dumb and can only use a single dt blob.
>>>>>=20
>>>>> You can have several bootloader builds, or even a single build wi=
th
>>>>> something like appended DTB to get an appropriate DTB if the same=
 binary
>>>>> will otherwise work across all variants of a board.
>>>>>=20
>>>>=20
>>>> No, the same DTB will not work across all the variants of a board.
>>>=20
>>> I wasn't on about the DTB. I was on about the loader binary, in the=
 case
>>> the FW/bootloader could be common even if the DTB couldn't.
>>>=20
>>> To some extent there must be a DTB that will work across all varian=
ts
>>> (albeit with limited utility) or the quirk approach wouldn't work=E2=
=80=A6
>>>=20
>>=20
>> That=E2=80=99s not correct; the only part of the DTB that needs to b=
e common
>> is the model property that would allow the quirk detection logic to =
fire.
>>=20
>> So, there is a base DTB that will work on all variants, but that onl=
y means
>> that it will work only up to the point that the quirk detector metho=
d
>> can work. So while in recommended practice there are common subsets
>> of the DTB that might work, they might be unsafe.
>>=20
>> For instance on the beaglebone the regulator configuration is differ=
ent
>> between white and black, it is imperative you get them right otherwi=
se
>> you risk board damage.
>>=20
>>>>> So it's not necessarily true that you need a complex bootloader.
>>>>>=20
>>>>=20
>>>>>> +2. On many instances boot time is extremely critical; in some c=
ases
>>>>>> +there are hard requirements like having working video feeds in =
under
>>>>>> +2 seconds from power-up. This leaves an extremely small time bu=
dget for
>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way to get=
 there
>>>>>> +is by removing the standard bootloader from the normal boot seq=
uence
>>>>>> +altogether by having a very small boot shim that loads the kern=
el and
>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-boot do=
es.
>>>>>=20
>>>>> Given my previous comments above I don't see why this is relevant=
=2E
>>>>> You're already passing _some_ DTB here, so if you can organise fo=
r the
>>>>> board to statically provide a sane DTB that's fine, or you can re=
sort to
>>>>> appended DTB if it's not possible to update the board configurati=
on.
>>>>>=20
>>>>=20
>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the same DTB=
 for each revision of the
>>>> board. Each board is similar but it=E2=80=99s not identical.
>>>=20
>>> I think you've misunderstood my point. If you program the board wit=
h the
>>> relevant DTB, or use appended DTB, then you will pass the correct D=
TB to
>>> the kernel without need for quirks.
>>>=20
>>> I understand that each variant is somewhat incompatible (and hence =
needs
>>> its own DTB).
>>=20
>> In theory it might work, in practice this does not. Ludovic mentione=
d that they
>> have 27 different DTBs in use at the moment. At a relatively common =
60k per DTB
>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be installed.
>=20
> < snip >
>=20
> Or you can install the correct DTB on the board.  You trust your manu=
facturing line
> to install the correct resistors.  You trust your manufacturing line =
to install the
> correct kernel version (eg an updated version to resolve a security i=
ssue).
>=20
> I thought the DT blob was supposed to follow the same standard that o=
ther OS's or
> bootloaders understood.  Are you willing to break that?  (This is one=
 of those
> ripples I mentioned in my other emails.)
>=20

Trust no-one.

This is one of those things that the kernel community doesn=E2=80=99t u=
nderstand which makes people
who push product quite mad.

Engineering a product is not only about meeting customer spec, in order=
 to turn a profit
the whole endeavor must be engineered as well for manufacturability.

Yes, you can always manually install files in the bootloader. For 1 boa=
rd no problem.
=46or 10 doable. For 100 I guess you can hire an extra guy. For 1 milli=
on? Guess what,
instead of turning a profit you=E2=80=99re losing money if you only hav=
e a few cents of profit
per unit.

No knobs to tweak means no knobs to break. And a broken knob can have p=
retty bad consequences
for a few million units.=20

And frankly I don=E2=80=99t care what other OSes do. If you were to tak=
e a look at the sorry DT support
they have you=E2=80=99d be amazed.

I would be very surprised if there=E2=80=99s another OS out there that =
can boot with a late Linux DTB.
=20
> -Frank

Regards

=E2=80=94 Pantelis

PS. For a real use case please take a look at the answer Guenter gave o=
n this thread a little
while back.--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
