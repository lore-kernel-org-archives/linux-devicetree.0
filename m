From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 10:24:47 -0500
Message-ID: <54E751BF.3000604@hurleysoftware.com>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com> <54E61DD2.3060002@gmail.com> <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com> <54E742F2.80506@hurleysoftware.com> <20150220143533.GA29908@odux.rfo.atmel.com> <54E74BF6.208@hurleysoftware.com> <F2A28070-4A8D-4869-8E2A-6AA744EECCCE@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F2A28070-4A8D-4869-8E2A-6AA744EECCCE@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: frowand.list@gmail.com, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On 02/20/2015 10:02 AM, Pantelis Antoniou wrote:
> Hi Peter,
>=20
>> On Feb 20, 2015, at 17:00 , Peter Hurley <peter@hurleysoftware.com> =
wrote:
>>
>> On 02/20/2015 09:35 AM, Ludovic Desroches wrote:
>>> On Fri, Feb 20, 2015 at 09:21:38AM -0500, Peter Hurley wrote:
>>>> On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
>>>>>
>>>>>> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list@gmail.com=
> wrote:
>>>>>>
>>>>>> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>>>>>>> Hi Frank,
>>>>>>>
>>>>>>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list@gmail.c=
om> wrote:
>>>>>>>>
>>>>>>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>>>>>>>>> Hi Mark,
>>>>>>>>>
>>>>>>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.c=
om> wrote:
>>>>>>>>>>
>>>>>>>>>>>>> +While this may in theory work, in practice it is very cu=
mbersome
>>>>>>>>>>>>> +for the following reasons:
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +1. The act of selecting a different boot device tree blo=
b requires
>>>>>>>>>>>>> +a reasonably advanced bootloader with some kind of confi=
guration or
>>>>>>>>>>>>> +scripting capabilities. Sadly this is not the case many =
times, the
>>>>>>>>>>>>> +bootloader is extremely dumb and can only use a single d=
t blob.
>>>>>>>>>>>>
>>>>>>>>>>>> You can have several bootloader builds, or even a single b=
uild with
>>>>>>>>>>>> something like appended DTB to get an appropriate DTB if t=
he same binary
>>>>>>>>>>>> will otherwise work across all variants of a board.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> No, the same DTB will not work across all the variants of a=
 board.
>>>>>>>>>>
>>>>>>>>>> I wasn't on about the DTB. I was on about the loader binary,=
 in the case
>>>>>>>>>> the FW/bootloader could be common even if the DTB couldn't.
>>>>>>>>>>
>>>>>>>>>> To some extent there must be a DTB that will work across all=
 variants
>>>>>>>>>> (albeit with limited utility) or the quirk approach wouldn't=
 work=E2=80=A6
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> That=E2=80=99s not correct; the only part of the DTB that nee=
ds to be common
>>>>>>>>> is the model property that would allow the quirk detection lo=
gic to fire.
>>>>>>>>>
>>>>>>>>> So, there is a base DTB that will work on all variants, but t=
hat only means
>>>>>>>>> that it will work only up to the point that the quirk detecto=
r method
>>>>>>>>> can work. So while in recommended practice there are common s=
ubsets
>>>>>>>>> of the DTB that might work, they might be unsafe.
>>>>>>>>>
>>>>>>>>> For instance on the beaglebone the regulator configuration is=
 different
>>>>>>>>> between white and black, it is imperative you get them right =
otherwise
>>>>>>>>> you risk board damage.
>>>>>>>>>
>>>>>>>>>>>> So it's not necessarily true that you need a complex bootl=
oader.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>> +2. On many instances boot time is extremely critical; in=
 some cases
>>>>>>>>>>>>> +there are hard requirements like having working video fe=
eds in under
>>>>>>>>>>>>> +2 seconds from power-up. This leaves an extremely small =
time budget for
>>>>>>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way=
 to get there
>>>>>>>>>>>>> +is by removing the standard bootloader from the normal b=
oot sequence
>>>>>>>>>>>>> +altogether by having a very small boot shim that loads t=
he kernel and
>>>>>>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-=
boot does.
>>>>>>>>>>>>
>>>>>>>>>>>> Given my previous comments above I don't see why this is r=
elevant.
>>>>>>>>>>>> You're already passing _some_ DTB here, so if you can orga=
nise for the
>>>>>>>>>>>> board to statically provide a sane DTB that's fine, or you=
 can resort to
>>>>>>>>>>>> appended DTB if it's not possible to update the board conf=
iguration.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the s=
ame DTB for each revision of the
>>>>>>>>>>> board. Each board is similar but it=E2=80=99s not identical=
=2E
>>>>>>>>>>
>>>>>>>>>> I think you've misunderstood my point. If you program the bo=
ard with the
>>>>>>>>>> relevant DTB, or use appended DTB, then you will pass the co=
rrect DTB to
>>>>>>>>>> the kernel without need for quirks.
>>>>>>>>>>
>>>>>>>>>> I understand that each variant is somewhat incompatible (and=
 hence needs
>>>>>>>>>> its own DTB).
>>>>>>>>>
>>>>>>>>> In theory it might work, in practice this does not. Ludovic m=
entioned that they
>>>>>>>>> have 27 different DTBs in use at the moment. At a relatively =
common 60k per DTB
>>>>>>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be inst=
alled.
>>>>>>>>
>>>>>>>> < snip >
>>>>>>>>
>>>>>>>> Or you can install the correct DTB on the board.  You trust yo=
ur manufacturing line
>>>>>>>> to install the correct resistors.  You trust your manufacturin=
g line to install the
>>>>>>>> correct kernel version (eg an updated version to resolve a sec=
urity issue).
>>>>>>>>
>>>>>>>> I thought the DT blob was supposed to follow the same standard=
 that other OS's or
>>>>>>>> bootloaders understood.  Are you willing to break that?  (This=
 is one of those
>>>>>>>> ripples I mentioned in my other emails.)
>>>>>>>>
>>>>>>>
>>>>>>> Trust no-one.
>>>>>>>
>>>>>>> This is one of those things that the kernel community doesn=E2=80=
=99t understand which makes people
>>>>>>> who push product quite mad.
>>>>>>>
>>>>>>> Engineering a product is not only about meeting customer spec, =
in order to turn a profit
>>>>>>> the whole endeavor must be engineered as well for manufacturabi=
lity.
>>>>>>>
>>>>>>> Yes, you can always manually install files in the bootloader. F=
or 1 board no problem.
>>>>>>> For 10 doable. For 100 I guess you can hire an extra guy. For 1=
 million? Guess what,
>>>>>>> instead of turning a profit you=E2=80=99re losing money if you =
only have a few cents of profit
>>>>>>> per unit.
>>>>>>
>>>>>> I'm not installing physical components manually.  Why would I be=
 installing software
>>>>>> manually?  (rhetorical question)
>>>>>>
>>>>>
>>>>> Because on high volume product runs the flash comes preprogrammed=
 and is soldered as is.
>>>>>
>>>>> Having a single binary to flash to every revision of the board ma=
kes logistics considerably
>>>>> easier.
>>>>>
>>>>> Having to boot and tweak the bootloader settings to select the co=
rrect dtb (even if it=E2=80=99s present
>>>>> on the flash medium) takes time and is error-prone.
>>>>>
>>>>> Factory time =3D=3D money, errors =3D=3D money.
>>>>>
>>>>>>>
>>>>>>> No knobs to tweak means no knobs to break. And a broken knob ca=
n have pretty bad consequences
>>>>>>> for a few million units.=20
>>>>>>
>>>>>> And you produce a few million units before testing that the firs=
t one off the line works?
>>>>>>
>>>>>
>>>>> The first one off the line works. The rest will get some burn in =
and functional testing if you=E2=80=99re
>>>>> lucky. In many cases where the product is very cheap it might mak=
e financial sense to just ship
>>>>> as is and deal with recalls, if you=E2=80=99re reasonably happy a=
fter a little bit of statistical sampling.
>>>>>
>>>>> Hardware is hard :)
>>>>
>>>> I'm failing to see how this series improves your manufacturing pro=
cess at all.
>>>>
>>>> 1. Won't you have to provide the factory with different eeprom ima=
ges for the
>>>>   White and Black?  You _trust_ them to get that right, or more li=
kely, you
>>>>   have process control procedures in place so that you don't get 1=
 million Blacks
>>>>   flashed with the White eeprom image.
>>>>
>>>> 2. The White and Black use different memory technology so it's not=
 as if the
>>>>   eMMC from the Black will end up on the White SMT line (or vice v=
ersa).
>>>>
>>>> 3  For that matter, why wouldn't you worry that all the microSD ca=
rds intended
>>>>   for the White were accidentally assembled with the first 50,000 =
Blacks; at
>>>>   that point you're losing a lot more than a few cents of profit. =
And that has
>>>>   nothing to do with what image you provided.
>>>>
>>>
>>> As you said, we can imagine many reasons to have a failure during t=
he
>>> production, having several DTB files will increase the risk.
>>
>> It's interesting that you don't see the added complexity of open-cod=
ing
>> the i2c driver or mixing DTS fragments for different designs as incr=
eased risk
>> (for us all).
>>
>>
>=20
> You don=E2=80=99t have to use it.

> diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makef=
ile
> index 5d27dfd..02129e7 100644
> --- a/arch/arm/mach-omap2/Makefile
> +++ b/arch/arm/mach-omap2/Makefile
> @@ -259,6 +259,11 @@ obj-$(CONFIG_MACH_CRANEBOARD)		+=3D board-am3517=
crane.o
> =20
>  obj-$(CONFIG_MACH_SBC3530)		+=3D board-omap3stalker.o
> =20
> +# DT quirks
> +ifneq ($(CONFIG_OF_DYNAMIC),)
> +obj-$(CONFIG_SOC_AM33XX)		+=3D am33xx-dt-quirks.o
> +endif

Won't this automatically be included on my Black that supports DT overl=
ays?


> Some people really do though. As for increased risk
> I expect to see arguments instead of a statement.

No one is wasting your time with random arguments. Please keep your ton=
e civil.

Regards,
Peter Hurley


>>>> 3. The factory is just as likely to use some other customer's imag=
e by accident,
>>>>   so you're just as likely to have the same failure rate if you ha=
ve no test
>>>>   process at the factory.
>>>>
>>>> 4. If you're using offline programming, the image has to be tested=
 after
>>>>   reflow anyway.
>>>>
>>>> IOW, your QA process will not change at all =3D=3D same cost.
>>>>
>>>> Regards,
>>>> Peter Hurley
>>
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
