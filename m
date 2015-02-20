From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 09:21:38 -0500
Message-ID: <54E742F2.80506@hurleysoftware.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com> <54E61DD2.3060002@gmail.com> <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, frowand.list@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
>=20
>> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list@gmail.com> wr=
ote:
>>
>> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>>> Hi Frank,
>>>
>>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list@gmail.com> =
wrote:
>>>>
>>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>>>>> Hi Mark,
>>>>>
>>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.com> =
wrote:
>>>>>>
>>>>>>>>> +While this may in theory work, in practice it is very cumber=
some
>>>>>>>>> +for the following reasons:
>>>>>>>>> +
>>>>>>>>> +1. The act of selecting a different boot device tree blob re=
quires
>>>>>>>>> +a reasonably advanced bootloader with some kind of configura=
tion or
>>>>>>>>> +scripting capabilities. Sadly this is not the case many time=
s, the
>>>>>>>>> +bootloader is extremely dumb and can only use a single dt bl=
ob.
>>>>>>>>
>>>>>>>> You can have several bootloader builds, or even a single build=
 with
>>>>>>>> something like appended DTB to get an appropriate DTB if the s=
ame binary
>>>>>>>> will otherwise work across all variants of a board.
>>>>>>>>
>>>>>>>
>>>>>>> No, the same DTB will not work across all the variants of a boa=
rd.
>>>>>>
>>>>>> I wasn't on about the DTB. I was on about the loader binary, in =
the case
>>>>>> the FW/bootloader could be common even if the DTB couldn't.
>>>>>>
>>>>>> To some extent there must be a DTB that will work across all var=
iants
>>>>>> (albeit with limited utility) or the quirk approach wouldn't wor=
k=E2=80=A6
>>>>>>
>>>>>
>>>>> That=E2=80=99s not correct; the only part of the DTB that needs t=
o be common
>>>>> is the model property that would allow the quirk detection logic =
to fire.
>>>>>
>>>>> So, there is a base DTB that will work on all variants, but that =
only means
>>>>> that it will work only up to the point that the quirk detector me=
thod
>>>>> can work. So while in recommended practice there are common subse=
ts
>>>>> of the DTB that might work, they might be unsafe.
>>>>>
>>>>> For instance on the beaglebone the regulator configuration is dif=
ferent
>>>>> between white and black, it is imperative you get them right othe=
rwise
>>>>> you risk board damage.
>>>>>
>>>>>>>> So it's not necessarily true that you need a complex bootloade=
r.
>>>>>>>>
>>>>>>>
>>>>>>>>> +2. On many instances boot time is extremely critical; in som=
e cases
>>>>>>>>> +there are hard requirements like having working video feeds =
in under
>>>>>>>>> +2 seconds from power-up. This leaves an extremely small time=
 budget for
>>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way to =
get there
>>>>>>>>> +is by removing the standard bootloader from the normal boot =
sequence
>>>>>>>>> +altogether by having a very small boot shim that loads the k=
ernel and
>>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-boot=
 does.
>>>>>>>>
>>>>>>>> Given my previous comments above I don't see why this is relev=
ant.
>>>>>>>> You're already passing _some_ DTB here, so if you can organise=
 for the
>>>>>>>> board to statically provide a sane DTB that's fine, or you can=
 resort to
>>>>>>>> appended DTB if it's not possible to update the board configur=
ation.
>>>>>>>>
>>>>>>>
>>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the same =
DTB for each revision of the
>>>>>>> board. Each board is similar but it=E2=80=99s not identical.
>>>>>>
>>>>>> I think you've misunderstood my point. If you program the board =
with the
>>>>>> relevant DTB, or use appended DTB, then you will pass the correc=
t DTB to
>>>>>> the kernel without need for quirks.
>>>>>>
>>>>>> I understand that each variant is somewhat incompatible (and hen=
ce needs
>>>>>> its own DTB).
>>>>>
>>>>> In theory it might work, in practice this does not. Ludovic menti=
oned that they
>>>>> have 27 different DTBs in use at the moment. At a relatively comm=
on 60k per DTB
>>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be installe=
d.
>>>>
>>>> < snip >
>>>>
>>>> Or you can install the correct DTB on the board.  You trust your m=
anufacturing line
>>>> to install the correct resistors.  You trust your manufacturing li=
ne to install the
>>>> correct kernel version (eg an updated version to resolve a securit=
y issue).
>>>>
>>>> I thought the DT blob was supposed to follow the same standard tha=
t other OS's or
>>>> bootloaders understood.  Are you willing to break that?  (This is =
one of those
>>>> ripples I mentioned in my other emails.)
>>>>
>>>
>>> Trust no-one.
>>>
>>> This is one of those things that the kernel community doesn=E2=80=99=
t understand which makes people
>>> who push product quite mad.
>>>
>>> Engineering a product is not only about meeting customer spec, in o=
rder to turn a profit
>>> the whole endeavor must be engineered as well for manufacturability=
=2E
>>>
>>> Yes, you can always manually install files in the bootloader. For 1=
 board no problem.
>>> For 10 doable. For 100 I guess you can hire an extra guy. For 1 mil=
lion? Guess what,
>>> instead of turning a profit you=E2=80=99re losing money if you only=
 have a few cents of profit
>>> per unit.
>>
>> I'm not installing physical components manually.  Why would I be ins=
talling software
>> manually?  (rhetorical question)
>>
>=20
> Because on high volume product runs the flash comes preprogrammed and=
 is soldered as is.
>=20
> Having a single binary to flash to every revision of the board makes =
logistics considerably
> easier.
>=20
> Having to boot and tweak the bootloader settings to select the correc=
t dtb (even if it=E2=80=99s present
> on the flash medium) takes time and is error-prone.
>=20
> Factory time =3D=3D money, errors =3D=3D money.
>=20
>>>
>>> No knobs to tweak means no knobs to break. And a broken knob can ha=
ve pretty bad consequences
>>> for a few million units.=20
>>
>> And you produce a few million units before testing that the first on=
e off the line works?
>>
>=20
> The first one off the line works. The rest will get some burn in and =
functional testing if you=E2=80=99re
> lucky. In many cases where the product is very cheap it might make fi=
nancial sense to just ship
> as is and deal with recalls, if you=E2=80=99re reasonably happy after=
 a little bit of statistical sampling.
>=20
> Hardware is hard :)

I'm failing to see how this series improves your manufacturing process =
at all.

1. Won't you have to provide the factory with different eeprom images f=
or the
   White and Black?  You _trust_ them to get that right, or more likely=
, you
   have process control procedures in place so that you don't get 1 mil=
lion Blacks
   flashed with the White eeprom image.

2. The White and Black use different memory technology so it's not as i=
f the
   eMMC from the Black will end up on the White SMT line (or vice versa=
).

3  For that matter, why wouldn't you worry that all the microSD cards i=
ntended
   for the White were accidentally assembled with the first 50,000 Blac=
ks; at
   that point you're losing a lot more than a few cents of profit. And =
that has
   nothing to do with what image you provided.

3. The factory is just as likely to use some other customer's image by =
accident,
   so you're just as likely to have the same failure rate if you have n=
o test
   process at the factory.

4. If you're using offline programming, the image has to be tested afte=
r
   reflow anyway.

IOW, your QA process will not change at all =3D=3D same cost.

Regards,
Peter Hurley
