From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Wed, 2 Mar 2016 00:03:04 +0000
Message-ID: <56D62DB8.2080301@arm.com>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-8-git-send-email-afaerber@suse.de>
 <56D57673.8030702@arm.com> <56D57A7F.5020806@suse.de>
 <56D58E88.2080700@arm.com> <56D6264B.2090507@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56D6264B.2090507@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-meson@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Matthias Brugger <mbrugger@suse.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/03/16 23:31, Andreas F=C3=A4rber wrote:
> Hi,
>=20
> Am 01.03.2016 um 13:43 schrieb Andre Przywara:
>> On 01/03/16 11:18, Andreas F=C3=A4rber wrote:
>>> Am 01.03.2016 um 12:01 schrieb Andre Przywara:
>>>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/a=
rm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>> index 0ae089bd1806..5088ae3ff653 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>>> @@ -117,7 +117,9 @@
>>>>>  		gic: interrupt-controller@c4301000 {
>>>>>  			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>>
>>>> I think "arm,gic-400" is the name to use here these days, especial=
ly for
>>>> arm64.
>>>
>>> I took what /proc/device-tree showed on Android and verified that t=
his
>>> compatible is in use in mainline.
>>
>> Some vendor Android kernel is not a good reference for mainline work=
 ;-)
>> Better look at other DTs in arch/arm64/boot/dts.
>=20
> Yes, that's what "in use in mainline" refers to:
>=20
> $ git grep "cortex-a15-gic" -- arch/arm64/boot/dts/ | grep -v gic-400
> arch/arm64/boot/dts/apm/apm-shadowcat.dtsi: compatible =3D
> "arm,cortex-a15-gic";
> arch/arm64/boot/dts/apm/apm-storm.dtsi: compatible =3D "arm,cortex-a1=
5-gic";
> arch/arm64/boot/dts/arm/foundation-v8.dts: compatible =3D
> "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts: compatible =3D
> "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> arch/arm64/boot/dts/nvidia/tegra132.dtsi: compatible =3D "arm,cortex-=
a15-gic";

Which is mainly because those DTs predate the introduction of
"arm,gic-400". Other DTs kept the cortex strings in additionally to sta=
y
compatible with older kernels.

>> You could keep "arm,cortex-a15-gic" in there if you care about
>> compatibility with older (vendor) kernels, but I guess there are oth=
er
>> issues which prevent this anyway, so you could drop this as well.
>=20
> Yeah, I don't care about backwards compatibility with downstream
> kernels, they use weird compatible strings with spaces anyway.

So please drop it and use only "arm,gic-400" to be in line with all the
other more recent SoCs.

Thanks!
Andre
