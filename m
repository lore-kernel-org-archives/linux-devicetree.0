From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sun8i: a83t: Add device tree for
 Sinovoip Bananapi BPI-M3
Date: Thu, 17 Aug 2017 17:08:19 +0800
Message-ID: <CAGb2v64WqSR+xp2Qrrx5hWhHCi9yZwoOackzRXx1VRah=8O4-A@mail.gmail.com>
References: <20170817034048.11601-1-wens@csie.org> <0dbfd9d8f83ac53c1538e86c4e02883e@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHF22XGAKGQEONAN5RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0dbfd9d8f83ac53c1538e86c4e02883e-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 1:11 PM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2017-08-17 11:40=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> The BPI-M3 is an Allwinner A83T based SBC in the Bananapi/Bpi family.
>> It is roughly the same form factor as the BPI-M1+, with roughly the
>> same peripherals and connectors:
>>
>>   - 2GB LPDDR3 DRAM
>>   - 8GB eMMC
>>   - Micro-SD card slot
>>   - HDMI output
>>   - Headset (stereo + mic) jack
>>   - Onboard mic
>>   - Gigabit Ethernet with RTL8211E transceiver
>>   - Ampak AP6212 WiFi + BT
>>   - USB OTG connector
>>   - USB-to-SATA bridge connected through a USB 2.0 hub
>>   - Consumer IR receiver
>>   - MIPI DSI LCD panel connector
>>   - Camera interface (parallel and MIPI CSI) connector
>>   - 3 LEDs (Red, Green, Blue), of which 2 are controllable (GB)
>>   - Raspberry Pi 2 compatible GPIO header
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>
>> Note that the file name follows the convention of most of the other
>> bananapi boards, that is the vendor "sinovoip" is not included in
>> the name. This deviates from what is already in U-boot.
>>
>> This applies on top of my A83t USB patches.
>>
>> ---
>>  arch/arm/boot/dts/Makefile                   |   1 +
>>  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 148
>> +++++++++++++++++++++++++++
>>  2 files changed, 149 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index e0d77ab79f5f..791fecc0774a 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -903,6 +903,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>>         sun8i-a33-q8-tablet.dtb \
>>         sun8i-a33-sinlinx-sina33.dtb \
>>         sun8i-a83t-allwinner-h8homlet-v2.dtb \
>> +       sun8i-a83t-bananapi-m3.dtb \
>>         sun8i-a83t-cubietruck-plus.dtb \
>>         sun8i-h2-plus-orangepi-zero.dtb \
>>         sun8i-h3-bananapi-m2-plus.dtb \
>> diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>> b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>> new file mode 100644
>> index 000000000000..2bafd7e99ef7
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
>> @@ -0,0 +1,148 @@
>> +/*
>> + * Copyright 2017 Chen-Yu Tsai
>> + *
>> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License as
>> + *     published by the Free Software Foundation; either version 2 of t=
he
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentation
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom the
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall be
>> + *     included in all copies or substantial portions of the Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include "sun8i-a83t.dtsi"
>> +#include "sunxi-common-regulators.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +       model =3D "Banana Pi BPI-M3";
>> +       compatible =3D "sinovoip,bpi-m3", "allwinner,sun8i-a83t";
>
>
> Should we continue to use sinovoip,bpi-mx-xxx or use bananapi,mx-xxx
> instead?

The vendor listed for "bananapi" is "BIPAI KEJI LIMITED", which you and
I know is probably the Chinese pronunciation of "BPi Technologies".
However I can't seem to find any trademark registrations.

The dispute around the Banana Pi brand was confusing. I'd hate to see
it again. I'll make some inquiries about this first.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
