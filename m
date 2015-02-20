From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 17:38:19 +0200
Message-ID: <9EDB5290-5C9F-42C1-826A-B38CC8C01F9B@konsulko.com>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com> <54E61DD2.3060002@gmail.com> <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com> <54E742F2.80506@hurleysoftware.com> <20150220143533.GA29908@odux.rfo.atmel.com> <54E74BF6.208@hurleysoftware.com> <F2A28070-4A8D-4869-8E2A-6AA744EECCCE@konsulko.com> <54E751BF.3000604@hurleysoftware.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E751BF.3000604@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: frowand.list@gmail.com, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Hi Peter,

> On Feb 20, 2015, at 17:24 , Peter Hurley <peter@hurleysoftware.com> w=
rote:
>=20
> On 02/20/2015 10:02 AM, Pantelis Antoniou wrote:
>> Hi Peter,
>>=20
>>> On Feb 20, 2015, at 17:00 , Peter Hurley <peter@hurleysoftware.com>=
 wrote:
>>>=20
>>> On 02/20/2015 09:35 AM, Ludovic Desroches wrote:
>>>> On Fri, Feb 20, 2015 at 09:21:38AM -0500, Peter Hurley wrote:
>>>>> On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
>>>>>>=20
>>>>>>> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list@gmail.co=
m> wrote:
>>>>>>>=20
>>>>>>> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>>>>>>>> Hi Frank,
>>>>>>>>=20
>>>>>>>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list@gmail.=
com> wrote:
>>>>>>>>>=20
>>>>>>>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>>>>>>>>>> Hi Mark,
>>>>>>>>>>=20
>>>>>>>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.=
com> wrote:
>>>>>>>>>>>=20
>>>>>>>>>>>>>> +While this may in theory work, in practice it is very c=
umbersome
>>>>>>>>>>>>>> +for the following reasons:
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +1. The act of selecting a different boot device tree bl=
ob requires
>>>>>>>>>>>>>> +a reasonably advanced bootloader with some kind of conf=
iguration or
>>>>>>>>>>>>>> +scripting capabilities. Sadly this is not the case many=
 times, the
>>>>>>>>>>>>>> +bootloader is extremely dumb and can only use a single =
dt blob.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> You can have several bootloader builds, or even a single =
build with
>>>>>>>>>>>>> something like appended DTB to get an appropriate DTB if =
the same binary
>>>>>>>>>>>>> will otherwise work across all variants of a board.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>>>>> No, the same DTB will not work across all the variants of =
a board.
>>>>>>>>>>>=20
>>>>>>>>>>> I wasn't on about the DTB. I was on about the loader binary=
, in the case
>>>>>>>>>>> the FW/bootloader could be common even if the DTB couldn't.
>>>>>>>>>>>=20
>>>>>>>>>>> To some extent there must be a DTB that will work across al=
l variants
>>>>>>>>>>> (albeit with limited utility) or the quirk approach wouldn'=
t work=E2=80=A6
>>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>> That=E2=80=99s not correct; the only part of the DTB that ne=
eds to be common
>>>>>>>>>> is the model property that would allow the quirk detection l=
ogic to fire.
>>>>>>>>>>=20
>>>>>>>>>> So, there is a base DTB that will work on all variants, but =
that only means
>>>>>>>>>> that it will work only up to the point that the quirk detect=
or method
>>>>>>>>>> can work. So while in recommended practice there are common =
subsets
>>>>>>>>>> of the DTB that might work, they might be unsafe.
>>>>>>>>>>=20
>>>>>>>>>> For instance on the beaglebone the regulator configuration i=
s different
>>>>>>>>>> between white and black, it is imperative you get them right=
 otherwise
>>>>>>>>>> you risk board damage.
>>>>>>>>>>=20
>>>>>>>>>>>>> So it's not necessarily true that you need a complex boot=
loader.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>>>>>>> +2. On many instances boot time is extremely critical; i=
n some cases
>>>>>>>>>>>>>> +there are hard requirements like having working video f=
eeds in under
>>>>>>>>>>>>>> +2 seconds from power-up. This leaves an extremely small=
 time budget for
>>>>>>>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest wa=
y to get there
>>>>>>>>>>>>>> +is by removing the standard bootloader from the normal =
boot sequence
>>>>>>>>>>>>>> +altogether by having a very small boot shim that loads =
the kernel and
>>>>>>>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u=
-boot does.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> Given my previous comments above I don't see why this is =
relevant.
>>>>>>>>>>>>> You're already passing _some_ DTB here, so if you can org=
anise for the
>>>>>>>>>>>>> board to statically provide a sane DTB that's fine, or yo=
u can resort to
>>>>>>>>>>>>> appended DTB if it's not possible to update the board con=
figuration.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the =
same DTB for each revision of the
>>>>>>>>>>>> board. Each board is similar but it=E2=80=99s not identica=
l.
>>>>>>>>>>>=20
>>>>>>>>>>> I think you've misunderstood my point. If you program the b=
oard with the
>>>>>>>>>>> relevant DTB, or use appended DTB, then you will pass the c=
orrect DTB to
>>>>>>>>>>> the kernel without need for quirks.
>>>>>>>>>>>=20
>>>>>>>>>>> I understand that each variant is somewhat incompatible (an=
d hence needs
>>>>>>>>>>> its own DTB).
>>>>>>>>>>=20
>>>>>>>>>> In theory it might work, in practice this does not. Ludovic =
mentioned that they
>>>>>>>>>> have 27 different DTBs in use at the moment. At a relatively=
 common 60k per DTB
>>>>>>>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be ins=
talled.
>>>>>>>>>=20
>>>>>>>>> < snip >
>>>>>>>>>=20
>>>>>>>>> Or you can install the correct DTB on the board.  You trust y=
our manufacturing line
>>>>>>>>> to install the correct resistors.  You trust your manufacturi=
ng line to install the
>>>>>>>>> correct kernel version (eg an updated version to resolve a se=
curity issue).
>>>>>>>>>=20
>>>>>>>>> I thought the DT blob was supposed to follow the same standar=
d that other OS's or
>>>>>>>>> bootloaders understood.  Are you willing to break that?  (Thi=
s is one of those
>>>>>>>>> ripples I mentioned in my other emails.)
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> Trust no-one.
>>>>>>>>=20
>>>>>>>> This is one of those things that the kernel community doesn=E2=
=80=99t understand which makes people
>>>>>>>> who push product quite mad.
>>>>>>>>=20
>>>>>>>> Engineering a product is not only about meeting customer spec,=
 in order to turn a profit
>>>>>>>> the whole endeavor must be engineered as well for manufacturab=
ility.
>>>>>>>>=20
>>>>>>>> Yes, you can always manually install files in the bootloader. =
=46or 1 board no problem.
>>>>>>>> For 10 doable. For 100 I guess you can hire an extra guy. For =
1 million? Guess what,
>>>>>>>> instead of turning a profit you=E2=80=99re losing money if you=
 only have a few cents of profit
>>>>>>>> per unit.
>>>>>>>=20
>>>>>>> I'm not installing physical components manually.  Why would I b=
e installing software
>>>>>>> manually?  (rhetorical question)
>>>>>>>=20
>>>>>>=20
>>>>>> Because on high volume product runs the flash comes preprogramme=
d and is soldered as is.
>>>>>>=20
>>>>>> Having a single binary to flash to every revision of the board m=
akes logistics considerably
>>>>>> easier.
>>>>>>=20
>>>>>> Having to boot and tweak the bootloader settings to select the c=
orrect dtb (even if it=E2=80=99s present
>>>>>> on the flash medium) takes time and is error-prone.
>>>>>>=20
>>>>>> Factory time =3D=3D money, errors =3D=3D money.
>>>>>>=20
>>>>>>>>=20
>>>>>>>> No knobs to tweak means no knobs to break. And a broken knob c=
an have pretty bad consequences
>>>>>>>> for a few million units.=20
>>>>>>>=20
>>>>>>> And you produce a few million units before testing that the fir=
st one off the line works?
>>>>>>>=20
>>>>>>=20
>>>>>> The first one off the line works. The rest will get some burn in=
 and functional testing if you=E2=80=99re
>>>>>> lucky. In many cases where the product is very cheap it might ma=
ke financial sense to just ship
>>>>>> as is and deal with recalls, if you=E2=80=99re reasonably happy =
after a little bit of statistical sampling.
>>>>>>=20
>>>>>> Hardware is hard :)
>>>>>=20
>>>>> I'm failing to see how this series improves your manufacturing pr=
ocess at all.
>>>>>=20
>>>>> 1. Won't you have to provide the factory with different eeprom im=
ages for the
>>>>>  White and Black?  You _trust_ them to get that right, or more li=
kely, you
>>>>>  have process control procedures in place so that you don't get 1=
 million Blacks
>>>>>  flashed with the White eeprom image.
>>>>>=20
>>>>> 2. The White and Black use different memory technology so it's no=
t as if the
>>>>>  eMMC from the Black will end up on the White SMT line (or vice v=
ersa).
>>>>>=20
>>>>> 3  For that matter, why wouldn't you worry that all the microSD c=
ards intended
>>>>>  for the White were accidentally assembled with the first 50,000 =
Blacks; at
>>>>>  that point you're losing a lot more than a few cents of profit. =
And that has
>>>>>  nothing to do with what image you provided.
>>>>>=20
>>>>=20
>>>> As you said, we can imagine many reasons to have a failure during =
the
>>>> production, having several DTB files will increase the risk.
>>>=20
>>> It's interesting that you don't see the added complexity of open-co=
ding
>>> the i2c driver or mixing DTS fragments for different designs as inc=
reased risk
>>> (for us all).
>>>=20
>>>=20
>>=20
>> You don=E2=80=99t have to use it.
>=20
>> diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Make=
file
>> index 5d27dfd..02129e7 100644
>> --- a/arch/arm/mach-omap2/Makefile
>> +++ b/arch/arm/mach-omap2/Makefile
>> @@ -259,6 +259,11 @@ obj-$(CONFIG_MACH_CRANEBOARD)		+=3D board-am351=
7crane.o
>>=20
>> obj-$(CONFIG_MACH_SBC3530)		+=3D board-omap3stalker.o
>>=20
>> +# DT quirks
>> +ifneq ($(CONFIG_OF_DYNAMIC),)
>> +obj-$(CONFIG_SOC_AM33XX)		+=3D am33xx-dt-quirks.o
>> +endif
>=20
> Won't this automatically be included on my Black that supports DT ove=
rlays?
>=20

Yes it will. It is a grand total of 498 lines of code, and the total si=
ze of
the code segment is about 2.2K.

You do realize that you=E2=80=99re probably booting a multi-platform ke=
rnel on the=20
black right? Including things for all 2xxx/3xxx and 44xx platforms?
=46or instance:

> ~/ti/kernels/linux-github.git $ wc -l arch/arm/mach-omap2/*44xx*.c
>    443 arch/arm/mach-omap2/clockdomains44xx_data.c
>    526 arch/arm/mach-omap2/cminst44xx.c
>    251 arch/arm/mach-omap2/cpuidle44xx.c
>    250 arch/arm/mach-omap2/dpll44xx.c
>   4864 arch/arm/mach-omap2/omap_hwmod_44xx_data.c
>    295 arch/arm/mach-omap2/pm44xx.c
>    358 arch/arm/mach-omap2/powerdomains44xx_data.c
>     62 arch/arm/mach-omap2/prcm_mpu44xx.c
>    770 arch/arm/mach-omap2/prm44xx.c
>    210 arch/arm/mach-omap2/prminst44xx.c
>    117 arch/arm/mach-omap2/vc44xx_data.c
>    130 arch/arm/mach-omap2/voltagedomains44xx_data.c
>    104 arch/arm/mach-omap2/vp44xx_data.c
>   8380 total

I bet those things are far larger than 2.2K. And I also bet that in the
tradeoff analysis that the board maintainer did things came down to=20
increasing complexity so that he can consolidate the kernels for all th=
e
other platforms he has to support besides the black.

>=20
>> Some people really do though. As for increased risk
>> I expect to see arguments instead of a statement.
>=20
> No one is wasting your time with random arguments. Please keep your t=
one civil.
>=20

A statement like 'increasing risk for all of us' is very open ended. Wh=
at is
the risk? How much of it exists?

If I offended you I=E2=80=99m really sorry though, I meant no such thin=
g.

> Regards,
> Peter Hurley
>=20

Regards

=E2=80=94 Pantelis

>=20
>>>>> 3. The factory is just as likely to use some other customer's ima=
ge by accident,
>>>>>  so you're just as likely to have the same failure rate if you ha=
ve no test
>>>>>  process at the factory.
>>>>>=20
>>>>> 4. If you're using offline programming, the image has to be teste=
d after
>>>>>  reflow anyway.
>>>>>=20
>>>>> IOW, your QA process will not change at all =3D=3D same cost.
>>>>>=20
>>>>> Regards,
>>>>> Peter Hurley
>>>=20
>>=20
>> Regards
>>=20
>> =E2=80=94 Pantelis
