From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Wed, 2 Mar 2016 01:07:29 +0100
Message-ID: <56D62EC1.7040100@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-8-git-send-email-afaerber@suse.de>
 <56D57673.8030702@arm.com> <56D57A7F.5020806@suse.de>
 <56D58E88.2080700@arm.com> <56D6264B.2090507@suse.de>
 <56D62DB8.2080301@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56D62DB8.2080301@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>, linux-meson@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Matthias Brugger <mbrugger@suse.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 02.03.2016 um 01:03 schrieb Andr=C3=A9 Przywara:
> On 01/03/16 23:31, Andreas F=C3=A4rber wrote:
>> Am 01.03.2016 um 13:43 schrieb Andre Przywara:
>>> On 01/03/16 11:18, Andreas F=C3=A4rber wrote:
>>>> Am 01.03.2016 um 12:01 schrieb Andre Przywara:
>>>>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/=
arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>>> index 0ae089bd1806..5088ae3ff653 100644
>>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>>> @@ -117,7 +117,9 @@
>>>>>>  		gic: interrupt-controller@c4301000 {
>>>>>>  			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>>>
>>>>> I think "arm,gic-400" is the name to use here these days, especia=
lly for
>>>>> arm64.
>>>>
>>>> I took what /proc/device-tree showed on Android and verified that =
this
>>>> compatible is in use in mainline.
>>>
>>> Some vendor Android kernel is not a good reference for mainline wor=
k ;-)
>>> Better look at other DTs in arch/arm64/boot/dts.
>>
>> Yes, that's what "in use in mainline" refers to:
>>
>> $ git grep "cortex-a15-gic" -- arch/arm64/boot/dts/ | grep -v gic-40=
0
>> arch/arm64/boot/dts/apm/apm-shadowcat.dtsi: compatible =3D
>> "arm,cortex-a15-gic";
>> arch/arm64/boot/dts/apm/apm-storm.dtsi: compatible =3D "arm,cortex-a=
15-gic";
>> arch/arm64/boot/dts/arm/foundation-v8.dts: compatible =3D
>> "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts: compatible =3D
>> "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> arch/arm64/boot/dts/nvidia/tegra132.dtsi: compatible =3D "arm,cortex=
-a15-gic";
>=20
> Which is mainly because those DTs predate the introduction of
> "arm,gic-400". Other DTs kept the cortex strings in additionally to s=
tay
> compatible with older kernels.

Sure, but shouldn't we update them to have arm,gic-400 first then?

>>> You could keep "arm,cortex-a15-gic" in there if you care about
>>> compatibility with older (vendor) kernels, but I guess there are ot=
her
>>> issues which prevent this anyway, so you could drop this as well.
>>
>> Yeah, I don't care about backwards compatibility with downstream
>> kernels, they use weird compatible strings with spaces anyway.
>=20
> So please drop it and use only "arm,gic-400" to be in line with all t=
he
> other more recent SoCs.

Already done, still inserting cbus/aobus nodes and moving uart nodes,
then need to re-test.

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
