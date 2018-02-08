From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4] ARM: sun8i: h2+: add support for Banana
 Pi M2 Zero board
Date: Thu, 08 Feb 2018 17:15:35 +0800
Message-ID: <9e77487f83b226ad7700715251178ce8@aosc.io>
References: <20180206131647.41700-1-icenowy@aosc.io>
 <20180208090042.364is5ctofhuao4i@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBO5K6DJQKGQERIY4ANA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180208090042.364is5ctofhuao4i@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-02-08 17:00=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Tue, Feb 06, 2018 at 09:16:47PM +0800, Icenowy Zheng wrote:
>> Banana Pi M2 Zero board is a H2+-based board by Sinovoip, with a form
>> factor and GPIO holes similar to Raspberry Pi Zero.
>>=20
>> It features:
>> - Allwinner H2+ SoC
>> - Single-chip (16-bit) 512MiB DDR3 DRAM
>> - Ampak AP6212 Wi-Fi/Bluetooth module
>> - MicroSD slot
>> - Two MicroUSB Type-B ports (one can only be used to power the board=20
>> and
>>   the other features OTG functionality)
>> - Two keys, a reset and a GPIO-connected key.
>> - HDMI Type-C (miniHDMI) connector connected to the HDMI part of H2+.
>> - CSI connector to connect the camera sensor provided by Sinovoip.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v4:
>> - Use SPDX license identifier.
>>=20
>> Changes in v3:
>> - Add comments about Vbus problem in &usbphy node.
>>=20
>> Changes in v2:
>> - Use high active SD card detect on the production batch.
>>=20
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 126=20
>> +++++++++++++++++++++
>>  2 files changed, 127 insertions(+)
>>  create mode 100644=20
>> arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>>=20
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index ade7a38543dc..d5a17e6e8b0f 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -974,6 +974,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>>  	sun8i-a83t-cubietruck-plus.dtb \
>>  	sun8i-a83t-tbs-a711.dtb \
>>  	sun8i-h2-plus-orangepi-r1.dtb \
>> +	sun8i-h2-plus-bananapi-m2-zero.dtb \
>>  	sun8i-h2-plus-orangepi-zero.dtb \
>>  	sun8i-h3-bananapi-m2-plus.dtb \
>>  	sun8i-h3-beelink-x2.dtb \
>> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts=20
>> b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> new file mode 100644
>> index 000000000000..e2ee65a5bf92
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> @@ -0,0 +1,126 @@
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + *
>> + * Based on sun8i-h3-bananapi-m2-plus.dts, which is:
>> + *   Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>=20
> Sorry to be a bit picky about this, but this should be your very first
> line, see arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts for=20
> example.

I think it's also OK here, see=20
arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts.

>=20
> Thanks!
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
