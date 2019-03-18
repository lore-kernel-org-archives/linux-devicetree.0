From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] [PATCH 11/14] ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
Date: Mon, 18 Mar 2019 23:15:18 +0800
Message-ID: <86A3A1C2-323E-439D-9615-530E2AD9E199@aosc.io>
References: <20190312152256.35574-1-icenowy@aosc.io> <20190312152256.35574-12-icenowy@aosc.io> <ea4f86798466bd9680f064f663a50450452509bc.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ea4f86798466bd9680f064f663a50450452509bc.camel@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



于 2019年3月18日 GMT+08:00 下午8:41:32, Paul Kocialkowski <paul.kocialkowski@bootlin.com> 写到:
>Hi,
>
>Le mardi 12 mars 2019 à 23:22 +0800, Icenowy Zheng a écrit :
>> The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
>> but with more GPIO wired out of the package.
>> 
>> Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
>> pinctrl compatible string, and the S3/S3L DTSI files just include the
>V3
>> DTSI file.
>
>Note that the V3 has a NMI controller at 1c000d0, that is required for
>handling the AXP209 interrupts IIRQ. I have no idea whether it's also
>the case on the V3s/S3/S3L though but it would be good to know.

It's not mentioned on the datasheet.

If it's present, please send a patch.

BTW all V3 series chip share the same die (sun8iw8).

Thanks

>
>Note that I can totally add support for it when adding support for my
>V3 device that uses the AXP209 this way.
>
>Also, could we get proper compatibles and config options for these new
>SoCs, since they are distinct from the V3S?
>
>Cheers,
>
>Paul
>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>>  arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
>>  arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
>>  arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
>>  3 files changed, 26 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
>>  create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
>>  create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi
>> 
>> diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi
>b/arch/arm/boot/dts/sun8i-s3.dtsi
>> new file mode 100644
>> index 000000000000..0f41a25ecb30
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3.dtsi
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3.dtsi"
>> diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi
>b/arch/arm/boot/dts/sun8i-s3l.dtsi
>> new file mode 100644
>> index 000000000000..0f41a25ecb30
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3l.dtsi
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3.dtsi"
>> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi
>b/arch/arm/boot/dts/sun8i-v3.dtsi
>> new file mode 100644
>> index 000000000000..6ae8645ade50
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-v3.dtsi
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3s.dtsi"
>> +
>> +&ccu {
>> +	compatible = "allwinner,sun8i-v3-ccu";
>> +};
>> +
>> +&pio {
>> +	compatible = "allwinner,sun8i-v3-pinctrl";
>> +};
>> -- 
>> 2.18.1
>> 
>-- 
>Paul Kocialkowski, Bootlin
>Embedded Linux and kernel engineering
>https://bootlin.com
>
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
使用 K-9 Mail 发送自我的Android设备。
