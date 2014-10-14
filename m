From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: rk3288: add VOP iommu nodes
Date: Tue, 14 Oct 2014 15:23:54 +0800
Message-ID: <CAGS+omB5tuDHFgUGvypaSfxBW-3fhVtTOyWuve-dopeEF3Em6A@mail.gmail.com>
References: <1412965848-18663-1-git-send-email-djkurtz@chromium.org>
 <1412965848-18663-4-git-send-email-djkurtz@chromium.org> <4094180.e6s5oT6HgP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4094180.e6s5oT6HgP@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Grant Grundler <grundler@chromium.org>, Simon Xue <xxm@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 14, 2014 at 6:33 AM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Hi Daniel,
>
> Am Samstag, 11. Oktober 2014, 02:30:48 schrieb Daniel Kurtz:
>> Add device nodes for the VOP iommus.
>> Device nodes for other iommus will be added in later patches.
>>
>> The iommu nodes use the #iommu-cells property as described in:
>>   Documentation/devicetree/bindings/iommu/iommu.txt
>>
>> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
>> Signed-off-by: Simon Xue <xxm@rock-chips.com>
>> ---
>>  arch/arm/boot/dts/rk3288.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk328=
8.dtsi
>> index 5950b0a..cbc92fa 100644
>> --- a/arch/arm/boot/dts/rk3288.dtsi
>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>> @@ -271,6 +271,24 @@
>>               status =3D "disabled";
>>       };
>>
>> +     vopb_mmu: iommu@0xff930300 {
>
> please use the address without the 0x here ... iommu@ff930300

I've been doing it wrong for a while and no one else noticed :-).  Than=
ks!
I will resend.

> Thanks
> Heiko
>
>> +             compatible =3D "rockchip,iommu";
>> +             reg =3D <0xff930300 0x100>;
>> +             interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>> +             interrupt-names =3D "vopb_mmu";
>> +             #iommu-cells =3D <0>;
>> +             status =3D "disabled";
>> +     };
>> +
>> +     vopl_mmu: iommu@0xff940300 {
>> +             compatible =3D "rockchip,iommu";
>> +             reg =3D <0xff940300 0x100>;
>> +             interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +             interrupt-names =3D "vopl_mmu";
>> +             #iommu-cells =3D <0>;
>> +             status =3D "disabled";
>> +     };
>> +
>>       gic: interrupt-controller@ffc01000 {
>>               compatible =3D "arm,gic-400";
>>               interrupt-controller;
>
