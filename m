From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 19:38:52 +0200
Message-ID: <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com> <54E61DD2.3060002@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E61DD2.3060002@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org


> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list@gmail.com> wro=
te:
>=20
> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>> Hi Frank,
>>=20
>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list@gmail.com> w=
rote:
>>>=20
>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>>>> Hi Mark,
>>>>=20
>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.com> w=
rote:
>>>>>=20
>>>>>>>> +While this may in theory work, in practice it is very cumbers=
ome
>>>>>>>> +for the following reasons:
>>>>>>>> +
>>>>>>>> +1. The act of selecting a different boot device tree blob req=
uires
>>>>>>>> +a reasonably advanced bootloader with some kind of configurat=
ion or
>>>>>>>> +scripting capabilities. Sadly this is not the case many times=
, the
>>>>>>>> +bootloader is extremely dumb and can only use a single dt blo=
b.
>>>>>>>=20
>>>>>>> You can have several bootloader builds, or even a single build =
with
>>>>>>> something like appended DTB to get an appropriate DTB if the sa=
me binary
>>>>>>> will otherwise work across all variants of a board.
>>>>>>>=20
>>>>>>=20
>>>>>> No, the same DTB will not work across all the variants of a boar=
d.
>>>>>=20
>>>>> I wasn't on about the DTB. I was on about the loader binary, in t=
he case
>>>>> the FW/bootloader could be common even if the DTB couldn't.
>>>>>=20
>>>>> To some extent there must be a DTB that will work across all vari=
ants
>>>>> (albeit with limited utility) or the quirk approach wouldn't work=
=E2=80=A6
>>>>>=20
>>>>=20
>>>> That=E2=80=99s not correct; the only part of the DTB that needs to=
 be common
>>>> is the model property that would allow the quirk detection logic t=
o fire.
>>>>=20
>>>> So, there is a base DTB that will work on all variants, but that o=
nly means
>>>> that it will work only up to the point that the quirk detector met=
hod
>>>> can work. So while in recommended practice there are common subset=
s
>>>> of the DTB that might work, they might be unsafe.
>>>>=20
>>>> For instance on the beaglebone the regulator configuration is diff=
erent
>>>> between white and black, it is imperative you get them right other=
wise
>>>> you risk board damage.
>>>>=20
>>>>>>> So it's not necessarily true that you need a complex bootloader=
=2E
>>>>>>>=20
>>>>>>=20
>>>>>>>> +2. On many instances boot time is extremely critical; in some=
 cases
>>>>>>>> +there are hard requirements like having working video feeds i=
n under
>>>>>>>> +2 seconds from power-up. This leaves an extremely small time =
budget for
>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way to g=
et there
>>>>>>>> +is by removing the standard bootloader from the normal boot s=
equence
>>>>>>>> +altogether by having a very small boot shim that loads the ke=
rnel and
>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-boot =
does.
>>>>>>>=20
>>>>>>> Given my previous comments above I don't see why this is releva=
nt.
>>>>>>> You're already passing _some_ DTB here, so if you can organise =
for the
>>>>>>> board to statically provide a sane DTB that's fine, or you can =
resort to
>>>>>>> appended DTB if it's not possible to update the board configura=
tion.
>>>>>>>=20
>>>>>>=20
>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the same D=
TB for each revision of the
>>>>>> board. Each board is similar but it=E2=80=99s not identical.
>>>>>=20
>>>>> I think you've misunderstood my point. If you program the board w=
ith the
>>>>> relevant DTB, or use appended DTB, then you will pass the correct=
 DTB to
>>>>> the kernel without need for quirks.
>>>>>=20
>>>>> I understand that each variant is somewhat incompatible (and henc=
e needs
>>>>> its own DTB).
>>>>=20
>>>> In theory it might work, in practice this does not. Ludovic mentio=
ned that they
>>>> have 27 different DTBs in use at the moment. At a relatively commo=
n 60k per DTB
>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be installed=
=2E
>>>=20
>>> < snip >
>>>=20
>>> Or you can install the correct DTB on the board.  You trust your ma=
nufacturing line
>>> to install the correct resistors.  You trust your manufacturing lin=
e to install the
>>> correct kernel version (eg an updated version to resolve a security=
 issue).
>>>=20
>>> I thought the DT blob was supposed to follow the same standard that=
 other OS's or
>>> bootloaders understood.  Are you willing to break that?  (This is o=
ne of those
>>> ripples I mentioned in my other emails.)
>>>=20
>>=20
>> Trust no-one.
>>=20
>> This is one of those things that the kernel community doesn=E2=80=99=
t understand which makes people
>> who push product quite mad.
>>=20
>> Engineering a product is not only about meeting customer spec, in or=
der to turn a profit
>> the whole endeavor must be engineered as well for manufacturability.
>>=20
>> Yes, you can always manually install files in the bootloader. For 1 =
board no problem.
>> For 10 doable. For 100 I guess you can hire an extra guy. For 1 mill=
ion? Guess what,
>> instead of turning a profit you=E2=80=99re losing money if you only =
have a few cents of profit
>> per unit.
>=20
> I'm not installing physical components manually.  Why would I be inst=
alling software
> manually?  (rhetorical question)
>=20

Because on high volume product runs the flash comes preprogrammed and i=
s soldered as is.

Having a single binary to flash to every revision of the board makes lo=
gistics considerably
easier.

Having to boot and tweak the bootloader settings to select the correct =
dtb (even if it=E2=80=99s present
on the flash medium) takes time and is error-prone.

=46actory time =3D=3D money, errors =3D=3D money.

>>=20
>> No knobs to tweak means no knobs to break. And a broken knob can hav=
e pretty bad consequences
>> for a few million units.=20
>=20
> And you produce a few million units before testing that the first one=
 off the line works?
>=20

The first one off the line works. The rest will get some burn in and fu=
nctional testing if you=E2=80=99re
lucky. In many cases where the product is very cheap it might make fina=
ncial sense to just ship
as is and deal with recalls, if you=E2=80=99re reasonably happy after a=
 little bit of statistical sampling.

Hardware is hard :)

>>=20
>> And frankly I don=E2=80=99t care what other OSes do. If you were to =
take a look at the sorry DT support
>> they have you=E2=80=99d be amazed.
>>=20
>> I would be very surprised if there=E2=80=99s another OS out there th=
at can boot with a late Linux DTB.
>>=20
>>> -Frank
>>=20
>> Regards
>>=20
>> =E2=80=94 Pantelis
>>=20
>> PS. For a real use case please take a look at the answer Guenter gav=
e on this thread a little
>> while back.
>>=20
>=20
> My previous comments were written after reading Guenter's comment.
>=20

OK, sorry for coming off a bit strong there :)

> -Frank
>=20

Regards

=E2=80=94 Pantelis
