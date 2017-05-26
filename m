From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: Add initial
 Orangepi Win/WinPlus support
Date: Fri, 26 May 2017 17:03:17 +0800
Message-ID: <139FAC04-044D-465F-9450-F524ACD153AE@aosc.io>
References: <1495740382-9061-1-git-send-email-jteki@openedev.com> <5e932649-bab6-7f3e-7519-4d45d3eb8f20@arm.com> <CAGb2v64um5gTP6kDdjZkPUBLrZbsnw+mJgG2260Np7bg8aVd3Q@mail.gmail.com> <4668fc0b-f3bc-04b3-15ff-0e5cd11a77bf@arm.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB2O6T7EQKGQE2YEGRUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4668fc0b-f3bc-04b3-15ff-0e5cd11a77bf-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: andre.przywara-5wv7dgnIgG8@public.gmane.orgAndre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
59:18, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On 26/05/17 04:54, Chen-Yu Tsai wrote:
>> On Fri, May 26, 2017 at 6:30 AM, Andr=C3=A9 Przywara
><andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>>> On 25/05/17 20:26, Jagan Teki wrote:
>>>> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>>>
>>>> Orangepi Win/WinPlus is an open-source single-board computer
>>>> using the Allwinner A64 SOC.
>>>>
>>>> A64 Orangepi Win/WinPlus has
>>>> - A64 Quad-core Cortex-A53 64bit
>>>> - 1GB(Win)/2GB(Win Plus) DDR3 SDRAM
>>>> - Debug TTL UART
>>>> - Four USB 2.0
>>>
>>> I take it those are connected to a hub chip, and the micro-USB
>socket is
>>> connected as a true OTG socket?
>>> So you should enable the usb_otg node, but without the host mode
>>> override we use for the Pine64.
>>=20
>> Agreed. Unless OTG needs PMIC support.
>
>Ah, good point. Quickly looking at the schematics [1] I see that
>something's wrong there - could be me as well ...
>
>The OTG port has a voltage regulator enabled by USB0-DRVVBUS, which
>seems to be connected to GPIO PD7, according to the GPIO assignment
>table.
>Each of the dual-socket host port pairs (connected to the HUB) have a
>separate voltage regulator, ports 3 and 4 seems to be always enabled,
>whereas ports 1 and 2 are controlled by the USB1-DRVVBUS signal.
>Now this signal seems to be connected to PD7 as well, but this time
>directly on the schematic, not in the table.
>
>So either there is only one signal, connected to PD7, or one of the
>lines is connected to another GPIO.
>
>One could try to play around with PD7 in Linux and measure the voltage
>on all the 5 USB connectors to shed some light on this.

Oh I found a problem here -- I seems to forget to enable vbus
detection and drivevbus on AXP803...

Let me add them in further patches.

I have a BPI M64, which has real OTG port.

>
>>>> - HDMI
>>>> - LCD
>>>> - Audio and MIC
>>>> - Wifi + BT
>>>
>>> It looks like Wifi + BT are soldered on the board, so you should at
>>> least enable the proper UART connected to the Bluetooth chip,
>probably
>>> also MMC1 (which is surely connected to the WiFi chip) should be
>>> described as an SDIO node.
>>=20
>> Those probably need regulator support. Having them enabled together
>> might be better.
>
>Good point, seems like DLDO4 and DLDO2 are responsible for this.
>
>>>
>>>> - IR receiver
>>>> - 5V DC power supply
>>>
>>> I guess the board uses the AXP803 as well? You might want to
>coordinate
>>> with Icenowy what to do to describe this as well, given that her
>patches
>>> might go in before.
>>=20
>> Still waiting for NMI driver/bindings to be merged before I merge the
>dts
>> file changes. The mfd and regulator driver changes are already in
>-next.
>>=20
>>>
>>> Cheers,
>>> Andre.
>>>
>>>> http://www.orangepi.org/OrangePiWin_WinPlus/
>>=20
>> The URL is not going to be helpful if it goes offline.
>>=20
>> Can someone provide schematics for this board? Without it there's
>really
>> no verification for what the device tree describes.
>
>Found them here [1].
>
>>>>
>>>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>>> ---
>>>>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>>>>  .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts | 102
>+++++++++++++++++++++
>>>>  2 files changed, 103 insertions(+)
>>>>  create mode 100644
>arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>b/arch/arm64/boot/dts/allwinner/Makefile
>>>> index 244e8b7..4120ce9 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>>>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>>> @@ -1,5 +1,6 @@
>>>>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-bananapi-m64.dtb
>>>>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb
>sun50i-a64-pine64.dtb
>>>> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
>>>>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
>>>>
>>>>  always               :=3D $(dtb-y)
>>>> diff --git
>a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
>b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
>>>> new file mode 100644
>>>> index 0000000..b16e606
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
>>>> @@ -0,0 +1,102 @@
>>>> +/*
>>>> + * Copyright (C) 2017 Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
>>>> + *
>>>> + * This file is dual-licensed: you can use it either under the
>terms
>>>> + * of the GPL or the X11 license, at your option. Note that this
>dual
>>>> + * licensing only applies to this file, and not this project as a
>>>> + * whole.
>>>> + *
>>>> + *  a) This library is free software; you can redistribute it
>and/or
>>>> + *     modify it under the terms of the GNU General Public License
>as
>>>> + *     published by the Free Software Foundation; either version 2
>of the
>>>> + *     License, or (at your option) any later version.
>>>> + *
>>>> + *     This library is distributed in the hope that it will be
>useful,
>>>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty
>of
>>>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>the
>>>> + *     GNU General Public License for more details.
>>>> + *
>>>> + * Or, alternatively,
>>>> + *
>>>> + *  b) Permission is hereby granted, free of charge, to any person
>>>> + *     obtaining a copy of this software and associated
>documentation
>>>> + *     files (the "Software"), to deal in the Software without
>>>> + *     restriction, including without limitation the rights to
>use,
>>>> + *     copy, modify, merge, publish, distribute, sublicense,
>and/or
>>>> + *     sell copies of the Software, and to permit persons to whom
>the
>>>> + *     Software is furnished to do so, subject to the following
>>>> + *     conditions:
>>>> + *
>>>> + *     The above copyright notice and this permission notice shall
>be
>>>> + *     included in all copies or substantial portions of the
>Software.
>>>> + *
>>>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>KIND,
>>>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
>WARRANTIES
>>>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>>>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>>>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY,
>>>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>ARISING
>>>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
>OR
>>>> + *     OTHER DEALINGS IN THE SOFTWARE.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include "sun50i-a64.dtsi"
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +/ {
>>>> +     model =3D "OrangePi Win/Win Plus";
>>>> +     compatible =3D "xunlong,orangepi-win", "allwinner,sun50i-a64";
>>>> +
>>>> +     aliases {
>>>> +             serial0 =3D &uart0;
>>>> +     };
>>>> +
>>>> +     chosen {
>>>> +             stdout-path =3D "serial0:115200n8";
>>>> +     };
>>>> +
>>>> +     soc {
>>>> +             reg_vcc3v3: vcc3v3 {
>>>> +                     compatible =3D "regulator-fixed";
>>>> +                     regulator-name =3D "vcc3v3";
>>>> +                     regulator-min-microvolt =3D <3300000>;
>>>> +                     regulator-max-microvolt =3D <3300000>;
>>>> +             };
>>=20
>> This should be outside of the soc node.
>
>Agreed on that one.
>
>> Furthermore, you should
>> not be doing full path overrides in the dts file. If you need
>> to reference a node, but it doesn't have a label, add the label
>> first.
>
>That shouldn't be needed if it's outside of the /soc node?
>
>>>> +     };
>>>> +};
>>>> +
>>>> +&mmc0 {
>>>> +     pinctrl-names =3D "default";
>>>> +     pinctrl-0 =3D <&mmc0_pins>;
>>>> +     vmmc-supply =3D <&reg_vcc3v3>;
>>>> +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
>>=20
>> Please add a comment after this denoting the pin name.
>>=20
>>>> +     cd-inverted;
>>>> +     status =3D "okay";
>>>> +};
>>>> +
>>>> +&uart0 {
>>>> +     pinctrl-names =3D "default";
>>>> +     pinctrl-0 =3D <&uart0_pins_a>;
>>>> +     status =3D "okay";
>>>> +};
>>>> +
>>>> +&i2c1 {
>>>> +     pinctrl-names =3D "default";
>>>> +     pinctrl-0 =3D <&i2c1_pins>;
>>>> +     status =3D "okay";
>>>> +};
>>>> +
>>>> +&usbphy {
>>>> +       status =3D "okay";
>>=20
>> No VBUS regulator supplies?
>
>The HSIC block in the SoC needs apparently to be driven by FLDO1.
>The voltage regulator for two of the USB host ports is enabled by PD7
>(or not, see above).
>
>> Does the USB hub need a node?
>
>Good question, given that two of the ports have their bus power
>switchable, while the other two are always enabled. Do we express those
>things in the DT?
>
>Cheers,
>Andre.
>
>[1] http://www.orangepi.org/download/ORANGEPI-WIN-V1_1.pdf
>http://www.orangepi.org/download/ORANGEPI-Winplus-V1_3.pdf
>http://www.orangepi.org/downloadresources/
>
>Can someone (without commercial and legal conflict potential) please
>upload them to the sunxi Wiki?
>
>>=20
>> Regards
>> ChenYu
>>=20
>>>> +};
>>>> +
>>>> +&ohci1 {
>>>> +       status =3D "okay";
>>>> +};
>>>> +
>>>> +&ehci1 {
>>>> +       status =3D "okay";
>>>> +};
>>>>
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
