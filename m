From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 08:48:39 -0800
Message-ID: <54E613E7.2020405@gmail.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
> Hi Mark,
>=20
>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.com> wrot=
e:
>>
>>>>> +While this may in theory work, in practice it is very cumbersome
>>>>> +for the following reasons:
>>>>> +
>>>>> +1. The act of selecting a different boot device tree blob requir=
es
>>>>> +a reasonably advanced bootloader with some kind of configuration=
 or
>>>>> +scripting capabilities. Sadly this is not the case many times, t=
he
>>>>> +bootloader is extremely dumb and can only use a single dt blob.
>>>>
>>>> You can have several bootloader builds, or even a single build wit=
h
>>>> something like appended DTB to get an appropriate DTB if the same =
binary
>>>> will otherwise work across all variants of a board.
>>>>
>>>
>>> No, the same DTB will not work across all the variants of a board.
>>
>> I wasn't on about the DTB. I was on about the loader binary, in the =
case
>> the FW/bootloader could be common even if the DTB couldn't.
>>
>> To some extent there must be a DTB that will work across all variant=
s
>> (albeit with limited utility) or the quirk approach wouldn't work=E2=
=80=A6
>>
>=20
> That=E2=80=99s not correct; the only part of the DTB that needs to be=
 common
> is the model property that would allow the quirk detection logic to f=
ire.
>=20
> So, there is a base DTB that will work on all variants, but that only=
 means
> that it will work only up to the point that the quirk detector method
> can work. So while in recommended practice there are common subsets
> of the DTB that might work, they might be unsafe.
>=20
> For instance on the beaglebone the regulator configuration is differe=
nt
> between white and black, it is imperative you get them right otherwis=
e
> you risk board damage.
>=20
>>>> So it's not necessarily true that you need a complex bootloader.
>>>>
>>>
>>>>> +2. On many instances boot time is extremely critical; in some ca=
ses
>>>>> +there are hard requirements like having working video feeds in u=
nder
>>>>> +2 seconds from power-up. This leaves an extremely small time bud=
get for
>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way to get =
there
>>>>> +is by removing the standard bootloader from the normal boot sequ=
ence
>>>>> +altogether by having a very small boot shim that loads the kerne=
l and
>>>>> +immediately jumps to kernel, like falcon-boot mode in u-boot doe=
s.
>>>>
>>>> Given my previous comments above I don't see why this is relevant.
>>>> You're already passing _some_ DTB here, so if you can organise for=
 the
>>>> board to statically provide a sane DTB that's fine, or you can res=
ort to
>>>> appended DTB if it's not possible to update the board configuratio=
n.
>>>>
>>>
>>> You=E2=80=99re missing the point. I can=E2=80=99t use the same DTB =
for each revision of the
>>> board. Each board is similar but it=E2=80=99s not identical.
>>
>> I think you've misunderstood my point. If you program the board with=
 the
>> relevant DTB, or use appended DTB, then you will pass the correct DT=
B to
>> the kernel without need for quirks.
>>
>> I understand that each variant is somewhat incompatible (and hence n=
eeds
>> its own DTB).
>=20
> In theory it might work, in practice this does not. Ludovic mentioned=
 that they
> have 27 different DTBs in use at the moment. At a relatively common 6=
0k per DTB
> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be installed.

< snip >

Or you can install the correct DTB on the board.  You trust your manufa=
cturing line
to install the correct resistors.  You trust your manufacturing line to=
 install the
correct kernel version (eg an updated version to resolve a security iss=
ue).

I thought the DT blob was supposed to follow the same standard that oth=
er OS's or
bootloaders understood.  Are you willing to break that?  (This is one o=
f those
ripples I mentioned in my other emails.)

-Frank
