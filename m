From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Tue, 1 Mar 2016 12:18:23 +0100
Message-ID: <56D57A7F.5020806@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-8-git-send-email-afaerber@suse.de>
 <56D57673.8030702@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D57673.8030702-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andre,

Am 01.03.2016 um 12:01 schrieb Andre Przywara:
> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>> Add GICH and GICV resources for HYP mode - guess based on other vend=
ors.
>=20
> Do you know if the firmware allows the kernel to be entered in EL2
> (which is the arm64 name for HYP)?
> So can we run kvm?
> If you have a booted kernel, can you grep for "EL2" and "kvm" in the =
dmesg?

I do not have a rootfs yet (MMC v5 patches by Carlo are still waiting
for review), but with this change the KVM driver initializes okay - the
purpose of this patch!

> Also you should merge this patch into 3/8, same for 8/8.

If people confirm this is generally or specifically for this SoC correc=
t
then sure. So far 3/8 seems a safe subset for lack of public documentat=
ion.

>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm6=
4/boot/dts/amlogic/meson-gxbb.dtsi
>> index 0ae089bd1806..5088ae3ff653 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> @@ -117,7 +117,9 @@
>>  		gic: interrupt-controller@c4301000 {
>>  			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>=20
> I think "arm,gic-400" is the name to use here these days, especially =
for
> arm64.

I took what /proc/device-tree showed on Android and verified that this
compatible is in use in mainline.

>>  			reg =3D <0x0 0xc4301000 0 0x1000>,
>> -			      <0x0 0xc4302000 0 0x0100>;
>> +			      <0x0 0xc4302000 0 0x0100>,
>=20
> Please use 0x2000 for the size here. I guess this is really the GIC-4=
00
> from ARM, and in this case this is the right size, [1] is the referen=
ce
> here. This will enable EOI mode 1 for KVM.

Will test later.

Is there any easy way to find out whether or not this is that GIC-400?

Thanks,
Andreas

> [1]
> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi0471=
b/CHDIFAEE.html
>=20
>> +			      <0x0 0xc4304000 0 0x2000>,
>> +			      <0x0 0xc4306000 0 0x2000>;
>>  			interrupt-controller;
>>  			interrupts =3D <GIC_PPI 9
>>  				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
