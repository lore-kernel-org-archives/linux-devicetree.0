From: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Subject: Re: Re: [PATCH v3 -next 2/2] ARM: dts: sunxi: add
 support for Orange Pi Zero board
Date: Wed, 14 Dec 2016 10:49:57 +1100
Message-ID: <dc3d5e9e-ac9c-5ad1-7daf-39ed6ff7d84e@ozlabs.ru>
References: <20161207100132.1Qp0ZxGD@smtp3o.mail.yandex.net>
Reply-To: aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD5JHS4X5YBBBL4SYLBAKGQEIR2KTBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161207100132.1Qp0ZxGD-/icbEWb855g0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/12/16 18:01, Icenowy Zheng wrote:
>=20
> 2016=E5=B9=B412=E6=9C=887=E6=97=A5 05:52=E4=BA=8E Alexey Kardashevskiy <a=
ik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 06/12/16 18:43, Icenowy Zheng wrote:=20
>>>
>>> 2016=E5=B9=B412=E6=9C=886=E6=97=A5 09:51=E4=BA=8E Alexey Kardashevskiy =
<aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A=20
>>>>
>>>> On 03/12/16 02:05, Icenowy Zheng wrote:=20
>>>>> Orange Pi Zero is a board that came with the new Allwinner H2+ SoC an=
d a=20
>>>>> SDIO Wi-Fi chip by Allwinner (XR819).=20
>>>>>
>>>>> Add a device tree file for it.=20
>>>>>
>>>>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
>>>>> ---=20
>>>>> Changes since v2:=20
>>>>> - Merged SDIO Wi-Fi patch into it.=20
>>>>> - SDIO Wi-Fi: add a ethernet1 alias to it, as it has no internal NVRA=
M.=20
>>>>> - SDIO Wi-Fi: changed pinctrl binding to generic pinconf=20
>>>>> - removed all gpio pinctrl nodes=20
>>>>> - changed h2plus to h2-plus=20
>>>>> Changes since v1:=20
>>>>> - Convert to generic pinconf bindings.=20
>>>>> - SDIO Wi-Fi: add patch.=20
>>>>>
>>>>> Some notes:=20
>>>>> - The uart1 and uart2 is available on the unsoldered gpio header.=20
>>>>> - The onboard USB connector has its Vbus directly connected to DCIN-5=
V (the=20
>>>>>     power jack)=20
>>>>>
>>>>>    arch/arm/boot/dts/Makefile                        |   1 +=20
>>>>>    arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 159 ++++++++++=
++++++++++++=20
>>>>>    2 files changed, 160 insertions(+)=20
>>>>>    create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.d=
ts=20
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=
=20
>>>>> index 6447abc..59f6e86 100644=20
>>>>> --- a/arch/arm/boot/dts/Makefile=20
>>>>> +++ b/arch/arm/boot/dts/Makefile=20
>>>>> @@ -844,6 +844,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \=20
>>>>>    sun8i-a33-sinlinx-sina33.dtb \=20
>>>>>    sun8i-a83t-allwinner-h8homlet-v2.dtb \=20
>>>>>    sun8i-a83t-cubietruck-plus.dtb \=20
>>>>> + sun8i-h2-plus-orangepi-zero.dtb \=20
>>>>>    sun8i-h3-bananapi-m2-plus.dtb \=20
>>>>>    sun8i-h3-nanopi-neo.dtb \=20
>>>>>    sun8i-h3-orangepi-2.dtb \=20
>>>>> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch=
/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
>>>>> new file mode 100644=20
>>>>> index 0000000..d18807f=20
>>>>> --- /dev/null=20
>>>>> +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
>>>>> @@ -0,0 +1,159 @@=20
>>>>> +/*=20
>>>>> + * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
>>>>> + *=20
>>>>> + * Based on sun8i-h3-orangepi-one.dts, which is:=20
>>>>> + *   Copyright (C) 2016 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=20
>>>>> + *=20
>>>>> + * This file is dual-licensed: you can use it either under the terms=
=20
>>>>> + * of the GPL or the X11 license, at your option. Note that this dua=
l=20
>>>>> + * licensing only applies to this file, and not this project as a=20
>>>>> + * whole.=20
>>>>> + *=20
>>>>> + *  a) This file is free software; you can redistribute it and/or=20
>>>>> + *     modify it under the terms of the GNU General Public License a=
s=20
>>>>> + *     published by the Free Software Foundation; either version 2 o=
f the=20
>>>>> + *     License, or (at your option) any later version.=20
>>>>> + *=20
>>>>> + *     This file is distributed in the hope that it will be useful,=
=20
>>>>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f=20
>>>>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
=20
>>>>> + *     GNU General Public License for more details.=20
>>>>> + *=20
>>>>> + * Or, alternatively,=20
>>>>> + *=20
>>>>> + *  b) Permission is hereby granted, free of charge, to any person=
=20
>>>>> + *     obtaining a copy of this software and associated documentatio=
n=20
>>>>> + *     files (the "Software"), to deal in the Software without=20
>>>>> + *     restriction, including without limitation the rights to use,=
=20
>>>>> + *     copy, modify, merge, publish, distribute, sublicense, and/or=
=20
>>>>> + *     sell copies of the Software, and to permit persons to whom th=
e=20
>>>>> + *     Software is furnished to do so, subject to the following=20
>>>>> + *     conditions:=20
>>>>> + *=20
>>>>> + *     The above copyright notice and this permission notice shall b=
e=20
>>>>> + *     included in all copies or substantial portions of the Softwar=
e.=20
>>>>> + *=20
>>>>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,=20
>>>>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES=20
>>>>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND=20
>>>>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT=
=20
>>>>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,=
=20
>>>>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
=20
>>>>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
=20
>>>>> + *     OTHER DEALINGS IN THE SOFTWARE.=20
>>>>> + */=20
>>>>> +=20
>>>>> +/dts-v1/;=20
>>>>> +#include "sun8i-h3.dtsi"=20
>>>>> +#include "sunxi-common-regulators.dtsi"=20
>>>>> +=20
>>>>> +#include <dt-bindings/gpio/gpio.h>=20
>>>>> +#include <dt-bindings/input/input.h>=20
>>>>> +#include <dt-bindings/pinctrl/sun4i-a10.h>=20
>>>>> +=20
>>>>> +/ {=20
>>>>> + model =3D "Xunlong Orange Pi Zero";=20
>>>>> + compatible =3D "xunlong,orangepi-zero", "allwinner,sun8i-h2-plus";=
=20
>>>>> +=20
>>>>> + aliases {=20
>>>>> + serial0 =3D &uart0;=20
>>>>> + /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */=20
>>>>
>>>>
>>>> It is not defined there as for:=20
>>>>
>>>> cef87e9 (tag: next-20161205) 20 hours ago Stephen Rothwell Add linux-n=
ext=20
>>>> specific files for 20161205=20
>>>
>>> The driver of H3's obfuscated DesignWare MAC is not yet mainlined, so t=
here won't be one ethernet0 now.=20
>>>
>>> But it's reserved for the onboard Ethernet.=20
>>
>>
>> Could you please elaborate how you tested this patch (ideally some tree=
=20
>> somewhere on github)? This patch added RX819, it assumes EMAC support is=
=20
>> there, neither is there nor there is a way to test this... Thanks.=20
>=20
> It do not assume EMAC is there.=20
> It only assume EMAC will be there someday :-)
>=20
> For tree... wait for my push :-)

Has it happened yet? :)



--=20
Alexey

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
