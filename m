From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new Olimex A20 EVB device
Date: Fri, 21 Aug 2015 07:36:01 +0200
Message-ID: <CAEKpxBnQ+kCVYfE8JL5JzH5ZXb3azjwmjfAE5OXULaVm0bj2ew@mail.gmail.com>
References: <1440002596-2611-1-git-send-email-codekipper@gmail.com>
	<20150820154545.GF30520@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11c25f52a74a8d051dcba4dd
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBQXR3KXAKGQEQAWJ6WQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150820154545.GF30520@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a11c25f52a74a8d051dcba4dd
Content-Type: text/plain; charset=UTF-8

On 20 August 2015 at 17:45, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
wrote:

> Hi,
>
> On Wed, Aug 19, 2015 at 06:43:16PM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > The A20-SOM-EVB is a reference design of a 2-layer board for the
> > A20-SOM.
> > It expands the features of A20-SOM by adding VGA connector, HDMI
> > connector, audio In/Out, LCD connector, 2 Mpix camera, gigabit
> > Ethernet, SATA, USB-OTG and 2 USB hosts.
> >
> > This patch adds basic support for the device
> > https://www.olimex.com/Products/SOM/A20/A20-SOM-EVB/
> >
> > More information on the SOM can be found here
> > http://linux-sunxi.org/Olimex_A20-SOM.
> >
> > Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Is there any other SOM planned that could work with that baseboard? Or
> any other baseboard for that SOM?
>
I've seen neither. We could always create a som.dtsi later is one emerges.

>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts | 233
> ++++++++++++++++++++++++++
> >  2 files changed, 234 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts
>
Relooking at their website I can see that the device does not come under
the olinuxino brand so maybe I should rename the dts to
sun7i-a20-olimex-som-evb.dts

> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 6d7cec1..fdbda9b 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -613,6 +613,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
> >       sun7i-a20-olinuxino-lime.dtb \
> >       sun7i-a20-olinuxino-lime2.dtb \
> >       sun7i-a20-olinuxino-micro.dtb \
> > +     sun7i-a20-olinuxino-evb.dtb \
> >       sun7i-a20-orangepi.dtb \
> >       sun7i-a20-orangepi-mini.dtb \
> >       sun7i-a20-pcduino3.dtb \
> > diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts
> b/arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts
> > new file mode 100644
> > index 0000000..a0071fa
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts
> > @@ -0,0 +1,233 @@
> > +/*
> > + * Copyright 2015 - Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of
> the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun7i-a20.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pinctrl/sun4i-a10.h>
> > +
> > +/ {
> > +     model = "Olimex A20-OLinuXino-EVB";
> > +     compatible = "olimex,a20-olinuxino-evb", "allwinner,sun7i-a20";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&led_pins_olinuxinoevb>;
> > +
> > +             green {
> > +                     label = "a20-olinuxino-evb:green:usr";
> > +                     gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
> > +                     default-state = "on";
> > +             };
> > +     };
> > +
> > +     reg_axp_ipsout: axp_ipsout {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "axp-ipsout";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&ahci {
> > +     target-supply = <&reg_ahci_5v>;
> > +     status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ehci1 {
> > +     status = "okay";
> > +};
> > +
> > +&gmac {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&gmac_pins_rgmii_a>;
> > +     phy = <&phy1>;
> > +     phy-mode = "rgmii";
> > +     status = "okay";
> > +
> > +     phy1: ethernet-phy@1 {
> > +             reg = <1>;
> > +     };
> > +};
> > +
> > +&i2c0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&i2c0_pins_a>;
> > +     status = "okay";
> > +
> > +     axp209: pmic@34 {
> > +             compatible = "x-powers,axp209";
> > +             reg = <0x34>;
> > +             interrupt-parent = <&nmi_intc>;
> > +             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             interrupt-controller;
> > +             #interrupt-cells = <1>;
> > +
> > +             acin-supply = <&reg_axp_ipsout>;
> > +             vin2-supply = <&reg_axp_ipsout>;
> > +             vin3-supply = <&reg_axp_ipsout>;
> > +             ldo24in-supply = <&reg_axp_ipsout>;
> > +             ldo3in-supply = <&reg_axp_ipsout>;
>
> Please use the axp209 dtsi.
>
Will do

>
> > +
> > +             regulators {
> > +                     vdd_rtc: ldo1 {
> > +                             regulator-min-microvolt = <1300000>;
> > +                             regulator-max-microvolt = <1300000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     avcc: ldo2 {
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vcc_csi0: ldo3 {
> > +                             regulator-min-microvolt = <700000>;
> > +                             regulator-max-microvolt = <3500000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vcc_csi1: ldo4 {
> > +                             regulator-min-microvolt = <1250000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
>
> the csi regulators are always-on too? What function do they provide?
>
This was a c & p from the lime 2 dts as their fex files are very similar. I
can remove this for now.

>
> > +                     vdd_cpu: dcdc2 {
> > +                             regulator-min-microvolt = <700000>;
> > +                             regulator-max-microvolt = <2275000>;
>
> This is way outside of the CPU operating range. Are you sure of your
> constraints?
>
ditto. I will check on this.


>
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vdd_int: dcdc3 {
> > +                             regulator-min-microvolt = <700000>;
> > +                             regulator-max-microvolt = <3500000>;
> > +                             regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&i2c1_pins_a>;
> > +     status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> > +     vmmc-supply = <&reg_vcc3v3>;
> > +     bus-width = <4>;
> > +     cd-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> > +     cd-inverted;
> > +     status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ohci1 {
> > +     status = "okay";
> > +};
> > +
> > +&pio {
> > +     ahci_pwr_pin_olinuxinoevb: ahci_pwr_pin@1 {
> > +             allwinner,pins = "PC3";
> > +             allwinner,function = "gpio_out";
> > +             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> > +             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> > +     };
> > +
> > +     led_pins_olinuxinoevb: led_pins@0 {
> > +             allwinner,pins = "PH2";
> > +             allwinner,function = "gpio_out";
> > +             allwinner,drive = <SUN4I_PINCTRL_20_MA>;
> > +             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> > +     };
> > +};
> > +
> > +&reg_ahci_5v {
> > +     pinctrl-0 = <&ahci_pwr_pin_olinuxinoevb>;
> > +     gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
> > +     status = "okay";
> > +};
> > +
> > +&reg_usb1_vbus {
> > +     status = "okay";
> > +};
> > +
> > +&reg_usb2_vbus {
> > +     status = "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_pins_a>;
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     usb1_vbus-supply = <&reg_usb1_vbus>;
> > +     usb2_vbus-supply = <&reg_usb2_vbus>;
> > +     status = "okay";
> > +};
> > --
> > 2.5.0
> >
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11c25f52a74a8d051dcba4dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
0 August 2015 at 17:45, Maxime Ripard <span dir=3D"ltr">&lt;<a href=3D"mail=
to:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" target=3D"_blank">maxime.ripard@free-e=
lectrons.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br=
>
<span class=3D""><br>
On Wed, Aug 19, 2015 at 06:43:16PM +0200, <a href=3D"mailto:codekipper@gmai=
l.com">codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:<br>
&gt; From: Marcus Cooper &lt;<a href=3D"mailto:codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">codeki=
pper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; The A20-SOM-EVB is a reference design of a 2-layer board for the<br>
&gt; A20-SOM.<br>
&gt; It expands the features of A20-SOM by adding VGA connector, HDMI<br>
&gt; connector, audio In/Out, LCD connector, 2 Mpix camera, gigabit<br>
&gt; Ethernet, SATA, USB-OTG and 2 USB hosts.<br>
&gt;<br>
&gt; This patch adds basic support for the device<br>
&gt; <a href=3D"https://www.olimex.com/Products/SOM/A20/A20-SOM-EVB/" rel=
=3D"noreferrer" target=3D"_blank">https://www.olimex.com/Products/SOM/A20/A=
20-SOM-EVB/</a><br>
&gt;<br>
&gt; More information on the SOM can be found here<br>
&gt; <a href=3D"http://linux-sunxi.org/Olimex_A20-SOM" rel=3D"noreferrer" t=
arget=3D"_blank">http://linux-sunxi.org/Olimex_A20-SOM</a>.<br>
&gt;<br>
&gt; Signed-off-by: Marcus Cooper &lt;<a href=3D"mailto:codekipper-Re5JQEeQqe8@public.gmane.org=
m">codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
<br>
</span>Is there any other SOM planned that could work with that baseboard? =
Or<br>
any other baseboard for that SOM?<br></blockquote><div>I&#39;ve seen neithe=
r. We could always create a som.dtsi later is one emerges. <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts | 233 ++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 2 files changed, 234 insertions(+)<br>
&gt;=C2=A0 create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts=
<br></div></div></blockquote><div>Relooking at their website I can see that=
 the device does not come under the olinuxino brand so maybe I should renam=
e the dts to sun7i-a20-olimex-som-evb.dts</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div><div class=3D"h5">
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<b=
r>
&gt; index 6d7cec1..fdbda9b 100644<br>
&gt; --- a/arch/arm/boot/dts/Makefile<br>
&gt; +++ b/arch/arm/boot/dts/Makefile<br>
&gt; @@ -613,6 +613,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-olinuxino-lime.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-olinuxino-lime2.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-olinuxino-micro.dtb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sun7i-a20-olinuxino-evb.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-orangepi.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-orangepi-mini.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sun7i-a20-pcduino3.dtb \<br>
&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts b/arch/arm/=
boot/dts/sun7i-a20-olinuxino-evb.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a0071fa<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts<br>
&gt; @@ -0,0 +1,233 @@<br>
&gt; +/*<br>
&gt; + * Copyright 2015 - Marcus Cooper &lt;<a href=3D"mailto:codekipper@gm=
ail.com">codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; + *<br>
&gt; + * This file is dual-licensed: you can use it either under the terms<=
br>
&gt; + * of the GPL or the X11 license, at your option. Note that this dual=
<br>
&gt; + * licensing only applies to this file, and not this project as a<br>
&gt; + * whole.<br>
&gt; + *<br>
&gt; + *=C2=A0 a) This file is free software; you can redistribute it and/o=
r<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0modify it under the terms of the GNU General Pu=
blic License as<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0published by the Free Software Foundation; eith=
er version 2 of the<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0License, or (at your option) any later version.=
<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0This file is distributed in the hope that it wi=
ll be useful,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the impl=
ied warranty of<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE.=C2=A0 See the<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0GNU General Public License for more details.<br=
>
&gt; + *<br>
&gt; + * Or, alternatively,<br>
&gt; + *<br>
&gt; + *=C2=A0 b) Permission is hereby granted, free of charge, to any pers=
on<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0obtaining a copy of this software and associate=
d documentation<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0files (the &quot;Software&quot;), to deal in th=
e Software without<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0restriction, including without limitation the r=
ights to use,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0copy, modify, merge, publish, distribute, subli=
cense, and/or<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0sell copies of the Software, and to permit pers=
ons to whom the<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0Software is furnished to do so, subject to the =
following<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0conditions:<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0The above copyright notice and this permission =
notice shall be<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0included in all copies or substantial portions =
of the Software.<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WIT=
HOUT WARRANTY OF ANY KIND,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED T=
O THE WARRANTIES<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PU=
RPOSE AND<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS =
OR COPYRIGHT<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER LIABILITY,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHER=
WISE, ARISING<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE USE OR<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;sun7i-a20.dtsi&quot;<br>
&gt; +#include &quot;sunxi-common-regulators.dtsi&quot;<br>
&gt; +<br>
&gt; +#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; +#include &lt;dt-bindings/interrupt-controller/irq.h&gt;<br>
&gt; +#include &lt;dt-bindings/pinctrl/sun4i-a10.h&gt;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;Olimex A20-OLinuXino-EVB&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;olimex,a20-olinuxino-evb&quo=
t;, &quot;allwinner,sun7i-a20&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;uart=
0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot=
;serial0:115200n8&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0leds {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
gpio-leds&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &qu=
ot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&am=
p;led_pins_olinuxinoevb&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0green {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;a20-olinuxino-evb:green:usr&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;pio 7 2 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;on&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_axp_ipsout: axp_ipsout {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-fixed&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;axp-ipsout&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;5000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;5000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ahci {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0target-supply =3D &lt;&amp;reg_ahci_5v&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ehci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ehci1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;gmac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;gmac_pins_rgmii_a&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy =3D &lt;&amp;phy1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy1: ethernet-phy@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c0_pins_a&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0axp209: pmic@34 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
x-powers,axp209&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x34&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D =
&lt;&amp;nmi_intc&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;0 =
IRQ_TYPE_LEVEL_LOW&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-controller;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-cells =3D =
&lt;1&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acin-supply =3D &lt;&=
amp;reg_axp_ipsout&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vin2-supply =3D &lt;&=
amp;reg_axp_ipsout&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vin3-supply =3D &lt;&=
amp;reg_axp_ipsout&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldo24in-supply =3D &l=
t;&amp;reg_axp_ipsout&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldo3in-supply =3D &lt=
;&amp;reg_axp_ipsout&gt;;<br>
<br>
</div></div>Please use the axp209 dtsi.<br></blockquote><div>Will do <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulators {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vdd_rtc: ldo1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;1300000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;1300000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0avcc: ldo2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;1800000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vcc_csi0: ldo3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;700000&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3500000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vcc_csi1: ldo4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;1250000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3300000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
<br>
</div></div>the csi regulators are always-on too? What function do they pro=
vide?<br></blockquote><div>This was a c &amp; p from the lime 2 dts as thei=
r fex files are very similar. I can remove this for now. <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vdd_cpu: dcdc2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;700000&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;2275000&=
gt;;<br>
<br>
</span>This is way outside of the CPU operating range. Are you sure of your=
<br>
constraints?<br></blockquote><div>ditto. I will check on this.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vdd_int: dcdc3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D &lt;700000&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D &lt;3500000&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-always-on;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c1_pins_a&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mmc0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt;, &lt;&amp;=
mmc0_cd_pin_reference_design&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vmmc-supply =3D &lt;&amp;reg_vcc3v3&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd-gpios =3D &lt;&amp;pio 7 1 GPIO_ACTIVE_HIGH&gt=
;; /* PH1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd-inverted;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ohci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;ohci1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;pio {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ahci_pwr_pin_olinuxinoevb: ahci_pwr_pin@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pins =3D &q=
uot;PC3&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,function =
=3D &quot;gpio_out&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,drive =3D &=
lt;SUN4I_PINCTRL_10_MA&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pull =3D &l=
t;SUN4I_PINCTRL_NO_PULL&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0led_pins_olinuxinoevb: led_pins@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pins =3D &q=
uot;PH2&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,function =
=3D &quot;gpio_out&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,drive =3D &=
lt;SUN4I_PINCTRL_20_MA&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,pull =3D &l=
t;SUN4I_PINCTRL_NO_PULL&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_ahci_5v {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;ahci_pwr_pin_olinuxinoevb&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio =3D &lt;&amp;pio 2 3 GPIO_ACTIVE_HIGH&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_usb1_vbus {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;reg_usb2_vbus {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;uart0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;uart0_pins_a&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;usbphy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usb1_vbus-supply =3D &lt;&amp;reg_usb1_vbus&gt;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0usb2_vbus-supply =3D &lt;&amp;reg_usb2_vbus&gt;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
<br>
</div></div>Thanks,<br>
Maxime<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Maxime Ripard, Free Electrons<br>
Embedded Linux, Kernel and Android engineering<br>
<a href=3D"http://free-electrons.com" rel=3D"noreferrer" target=3D"_blank">=
http://free-electrons.com</a><br>
</font></span></blockquote></div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11c25f52a74a8d051dcba4dd--
