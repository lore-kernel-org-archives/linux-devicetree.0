From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: Add nodes in smdkv310 device tree source
	file
Date: Sun, 17 Jul 2011 09:26:41 +0530
Message-ID: <CAJuYYwSzLzEJ2YuFbmLpJUzg8oQq04GWcXMuSXYdv0Lh=LaUkw@mail.gmail.com>
References: <1310730128-4243-1-git-send-email-thomas.abraham@linaro.org>
	<1310730128-4243-3-git-send-email-thomas.abraham@linaro.org>
	<20110715185744.GF2833@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110715185744.GF2833-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 16 July 2011 00:27, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Fri, Jul 15, 2011 at 05:12:07PM +0530, Thomas Abraham wrote:
>> From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Include device tree nodes for watchdog timer and sdhci instance 0 and 1.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/exynos4-smdkv310.dts | =A0 55 +++++++++++++++++++++=
+++++++++-
>> =A01 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/=
exynos4-smdkv310.dts
>> index dd6c80a..7f27d95 100644
>> --- a/arch/arm/boot/dts/exynos4-smdkv310.dts
>> +++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
>> @@ -1,11 +1,62 @@
>> +/*
>> + * Samsung's Exynos4210 based smdkv310 board device tree source.
>> + *
>> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + * Copyright (c) 2010-2011 Linaro Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 www.linaro.org
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> =A0/dts-v1/;
>> =A0/include/ "skeleton.dtsi"
>>
>> =A0/ {
>> =A0 =A0 =A0 model =3D "Samsung Exynos4 SMDKV310 eval board";
>> - =A0 =A0 compatible =3D "samsung,smdkv310", "samsung,s5pv310";
>> + =A0 =A0 compatible =3D "samsung,smdkv310", "samsung,exynos4210";
>>
>> =A0 =A0 =A0 memory {
>> - =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x40000000 0x08000000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x40000000 0x80000000>;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/mmcblk0p1 rootfstype=
=3Dext3 rootwait console=3DttySAC1,115200";
>> + =A0 =A0 };
>> +
>> + =A0 =A0 soc {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&intc>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 intc:interrupt-controller@10501000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos=
4-gic","arm,cortex-a9-gic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10501000 0x1000>, <=
0x10500100 0x100>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-start =3D <61>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 watchdog@10060000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c241=
0-wdt";
>
> Need documentation.

The watchdog bindings and driver dt support have been submitted in a
seperate patch. So the documentation for watchdog bindings is not
included in this patch.

Thanks,
Thomas


>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10060000 0x400>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <552>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 sdhci@12530000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-sd=
hci";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12530000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <362>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 sdhci@12510000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c-sd=
hci";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12510000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <360>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 };
>> =A0};
>> --
>> 1.7.1
>>
>
