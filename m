From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Wed, 2 Mar 2016 00:31:23 +0100
Message-ID: <56D6264B.2090507@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-8-git-send-email-afaerber@suse.de>
 <56D57673.8030702@arm.com> <56D57A7F.5020806@suse.de>
 <56D58E88.2080700@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D58E88.2080700-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 01.03.2016 um 13:43 schrieb Andre Przywara:
> On 01/03/16 11:18, Andreas F=C3=A4rber wrote:
>> Am 01.03.2016 um 12:01 schrieb Andre Przywara:
>>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/ar=
m64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> index 0ae089bd1806..5088ae3ff653 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>>>> @@ -117,7 +117,9 @@
>>>>  		gic: interrupt-controller@c4301000 {
>>>>  			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>>
>>> I think "arm,gic-400" is the name to use here these days, especiall=
y for
>>> arm64.
>>
>> I took what /proc/device-tree showed on Android and verified that th=
is
>> compatible is in use in mainline.
>=20
> Some vendor Android kernel is not a good reference for mainline work =
;-)
> Better look at other DTs in arch/arm64/boot/dts.

Yes, that's what "in use in mainline" refers to:

$ git grep "cortex-a15-gic" -- arch/arm64/boot/dts/ | grep -v gic-400
arch/arm64/boot/dts/apm/apm-shadowcat.dtsi: compatible =3D
"arm,cortex-a15-gic";
arch/arm64/boot/dts/apm/apm-storm.dtsi: compatible =3D "arm,cortex-a15-=
gic";
arch/arm64/boot/dts/arm/foundation-v8.dts: compatible =3D
"arm,cortex-a15-gic", "arm,cortex-a9-gic";
arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts: compatible =3D
"arm,cortex-a15-gic", "arm,cortex-a9-gic";
arch/arm64/boot/dts/nvidia/tegra132.dtsi: compatible =3D "arm,cortex-a1=
5-gic";

> You could keep "arm,cortex-a15-gic" in there if you care about
> compatibility with older (vendor) kernels, but I guess there are othe=
r
> issues which prevent this anyway, so you could drop this as well.

Yeah, I don't care about backwards compatibility with downstream
kernels, they use weird compatible strings with spaces anyway.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
