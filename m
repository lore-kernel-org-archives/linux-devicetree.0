From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Tue, 1 Mar 2016 13:53:42 +0100
Message-ID: <CAOQ7t2aev5fycZxNEkChWkYYVAV3pn9qnsXnO56V6J7Z3Mi-Rg@mail.gmail.com>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
	<1456789465-2962-8-git-send-email-afaerber@suse.de>
	<56D57673.8030702@arm.com>
	<56D57A7F.5020806@suse.de>
	<56D58E88.2080700@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D58E88.2080700-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 1, 2016 at 1:43 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>=
 wrote:
> Hi,
>
> On 01/03/16 11:18, Andreas F=C3=A4rber wrote:
>> Hi Andre,
>>
>> Am 01.03.2016 um 12:01 schrieb Andre Przywara:
>>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>>> Add GICH and GICV resources for HYP mode - guess based on other ve=
ndors.
>>>
>>> Do you know if the firmware allows the kernel to be entered in EL2
>>> (which is the arm64 name for HYP)?
>>> So can we run kvm?
>>> If you have a booted kernel, can you grep for "EL2" and "kvm" in th=
e dmesg?
>>
>> I do not have a rootfs yet (MMC v5 patches by Carlo are still waitin=
g
>> for review), but with this change the KVM driver initializes okay - =
the
>> purpose of this patch!
>>
>>> Also you should merge this patch into 3/8, same for 8/8.
>>
>> If people confirm this is generally or specifically for this SoC cor=
rect
>> then sure. So far 3/8 seems a safe subset for lack of public documen=
tation.
>
> The GIC is an integral part of the SoC, so this clearly belongs in th=
ere.
>
>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>>> ---
>>>>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 +++-
>
> In general I was wondering if this naming is correct?
> Shouldn't it be something with "s905" in it? Because this the SoC tha=
t
> is driving all those hardware and the peripherals that you describe i=
n
> there are clearly within the SoC.
> So something like meson-s905.dtsi or the like?

When I first submitted support for the meson8 and meson8b I picked up
the names according to the Amlogic SDK.
In the latest Amlogic drop this SoC is identified as meson-gxbb so
probably we should stick to this name.

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
