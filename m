From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: enable AXP803
 for Banana Pi M64
Date: Sun, 23 Jul 2017 23:15:04 +0800
Message-ID: <CAGb2v67OjvoSxxGnGbD4mkVaE8sy0cWK-2y7_t-=UoPgOox8bg@mail.gmail.com>
References: <20170720230717.58255-1-icenowy@aosc.io> <20170720230717.58255-2-icenowy@aosc.io>
 <CAGb2v67Ntz_Qr0ek5sb-RRPnb0W-vEjx4_XC+SzHJDcr7ZLrkg@mail.gmail.com>
 <DA3547F4-D0C7-46A9-8C7F-3F1AD7CBCB11@aosc.io> <CAGb2v67EGOacZRktqh6SrO1B5jCt8w41EU11U+PUG6sbXFoDww@mail.gmail.com>
 <a64c561e8b4acef7e7fb07561b3b8e78@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBEP32LFQKGQEULH5TNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <a64c561e8b4acef7e7fb07561b3b8e78-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 21, 2017 at 7:38 PM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2017-07-21 15:49=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Fri, Jul 21, 2017 at 3:44 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>>
>>>
>>>
>>> =E4=BA=8E 2017=E5=B9=B47=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=883:42:07, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>>>>
>>>> On Fri, Jul 21, 2017 at 7:07 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote=
:
>>>>>
>>>>> Banana Pi M64 board uses an AXP803 PMIC.
>>>>>
>>>>> Enable the PMIC and its regulators.
>>>>>
>>>>> As we have now proper regulators support, missing or dummy regulators
>>>>> are changed to the correct ones.
>>>>>
>>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>>> ---
>>>>>  .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 116
>>>>
>>>> +++++++++++++++++++--
>>>>>
>>>>>  1 file changed, 106 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git
>>>>
>>>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
>>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
>>>>>
>>>>> index 829922d077fb..51d67c0a0edf 100644
>>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
>>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
>>>>> @@ -58,13 +58,6 @@
>>>>>         chosen {
>>>>>                 stdout-path =3D "serial0:115200n8";
>>>>>         };
>>>>> -
>>>>> -       reg_vcc3v3: vcc3v3 {
>>>>> -               compatible =3D "regulator-fixed";
>>>>> -               regulator-name =3D "vcc3v3";
>>>>> -               regulator-min-microvolt =3D <3300000>;
>>>>> -               regulator-max-microvolt =3D <3300000>;
>>>>> -       };
>>>>>  };
>>>>>
>>>>>  &ehci1 {
>>>>> @@ -76,6 +69,7 @@
>>>>>         pinctrl-0 =3D <&rgmii_pins>;
>>>>>         phy-mode =3D "rgmii";
>>>>>         phy-handle =3D <&ext_rgmii_phy>;
>>>>> +       phy-supply =3D <&reg_dc1sw>;
>>>>>         status =3D "okay";
>>>>>  };
>>>>>
>>>>> @@ -99,7 +93,7 @@
>>>>>  &mmc0 {
>>>>>         pinctrl-names =3D "default";
>>>>>         pinctrl-0 =3D <&mmc0_pins>;
>>>>> -       vmmc-supply =3D <&reg_vcc3v3>;
>>>>> +       vmmc-supply =3D <&reg_dcdc1>;
>>>>>         cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
>>>>>         cd-inverted;
>>>>>         disable-wp;
>>>>> @@ -110,7 +104,8 @@
>>>>>  &mmc1 {
>>>>>         pinctrl-names =3D "default";
>>>>>         pinctrl-0 =3D <&mmc1_pins>;
>>>>> -       vmmc-supply =3D <&reg_vcc3v3>;
>>>>> +       vmmc-supply =3D <&reg_dldo2>;
>>>>> +       vqmmc-supply =3D <&reg_dldo4>;
>>>>>         bus-width =3D <4>;
>>>>>         non-removable;
>>>>>         status =3D "okay";
>>>>> @@ -119,7 +114,7 @@
>>>>>  &mmc2 {
>>>>>         pinctrl-names =3D "default";
>>>>>         pinctrl-0 =3D <&mmc2_pins>;
>>>>> -       vmmc-supply =3D <&reg_vcc3v3>;
>>>>> +       vmmc-supply =3D <&reg_dcdc1>;
>>>>>         bus-width =3D <8>;
>>>>>         non-removable;
>>>>>         cap-mmc-hw-reset;
>>>>> @@ -130,6 +125,107 @@
>>>>>         status =3D "okay";
>>>>>  };
>>>>>
>>>>> +&r_rsb {
>>>>> +       status =3D "okay";
>>>>> +
>>>>> +       axp803: pmic@3a3 {
>>>>> +               compatible =3D "x-powers,axp803";
>>>>> +               reg =3D <0x3a3>;
>>>>> +               interrupt-parent =3D <&r_intc>;
>>>>> +               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
>>>>> +       };
>>>>> +};
>>>>> +
>>>>> +#include "axp803.dtsi"
>>>>> +
>>>>> +&reg_aldo2 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <1800000>;
>>>>> +       regulator-max-microvolt =3D <3300000>;
>>>>> +       regulator-name =3D "vcc-pl";
>>>>> +};
>>>>> +
>>>>> +&reg_aldo3 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <3000000>;
>>>>> +       regulator-max-microvolt =3D <3000000>;
>>>>> +       regulator-name =3D "vcc-pll-avcc";
>>>>> +};
>>>>> +
>>>>> +&reg_dc1sw {
>>>>> +       regulator-name =3D "vcc-phy";
>>>>> +};
>>>>> +
>>>>> +&reg_dcdc1 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <3300000>;
>>>>> +       regulator-max-microvolt =3D <3300000>;
>>>>> +       regulator-name =3D "vcc-3v3";
>>>>> +};
>>>>> +
>>>>> +&reg_dcdc2 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <1000000>;
>>>>
>>>>
>>>> The datasheet says the minimum voltage is 1.04V.
>>>
>>>
>>> A64 datasheet?
>>
>>
>> Yes. V1.1.
>>
>>>
>>> Maybe I need to fix all A64 AXP patches.
>>>
>>>>
>>>>> +       regulator-max-microvolt =3D <1300000>;
>>>>> +       regulator-name =3D "vdd-cpux";
>>>>> +};
>>>>> +
>>>>> +/* DCDC3 is polyphased with DCDC2 */
>>>>> +
>>>>> +&reg_dcdc5 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <1500000>;
>>>>> +       regulator-max-microvolt =3D <1500000>;
>>>>> +       regulator-name =3D "vcc-dram";
>>>>> +};
>>>>> +
>>>>> +&reg_dcdc6 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <1100000>;
>>>>> +       regulator-max-microvolt =3D <1100000>;
>>>>> +       regulator-name =3D "vdd-sys";
>>>>> +};
>>>>> +
>>>>> +&reg_dldo1 {
>>>>> +       regulator-min-microvolt =3D <3300000>;
>>>>> +       regulator-max-microvolt =3D <3300000>;
>>>>> +       regulator-name =3D "vcc-hdmi-dsi";
>>>>> +};
>>>>> +
>>>>> +&reg_dldo2 {
>>>>> +       regulator-min-microvolt =3D <3300000>;
>>>>> +       regulator-max-microvolt =3D <3300000>;
>>>>> +       regulator-name =3D "vcc-wifi";
>>>>> +};
>>>>> +
>>>>> +&reg_dldo4 {
>>>>> +       regulator-min-microvolt =3D <1800000>;
>>>>> +       regulator-max-microvolt =3D <3300000>;
>>>>> +       regulator-name =3D "vcc-wifi-io";
>>>>> +};
>>>>> +
>>>>> +&reg_eldo1 {
>>>>> +       regulator-min-microvolt =3D <1800000>;
>>>>> +       regulator-max-microvolt =3D <1800000>;
>>>>> +       regulator-name =3D "cpvdd";
>>>>> +};
>>>>> +
>>>>
>>>>
>>>> It looks like you are missing a few regulators? I assume you
>>>> would add them once the peripherals that use them are added?
>>>
>>>
>>> Yes.
>>>
>>> I mainly dropped CSI part, as it seems so complicate.
>>
>>
>> HSIC is also missing. I know the board doesn't use the feature,
>> but the regulator is hooked up. It would be better to set the
>> name and constraints.
>
>
> OK.
>
> I think maybe Pine64 and SoPine w/ baseborad also need the HSIC
> regulator set up, right? (They're also not used but hooked)
>

Correct. If they are wired up, then they have constraints that
need to be adhered to.

ChenYu

>>
>> ChenYu
>>
>>>
>>>>
>>>> Otherwise this patch looks good.
>>>>
>>>> ChenYu
>>>>
>>>>> +/*
>>>>> + * The A64 chip cannot work without this regulator off, although
>>>>> + * it seems to be only driving the AR100 core.
>>>>> + * Maybe we don't still know well about CPUs domain.
>>>>> + */
>>>>> +&reg_fldo2 {
>>>>> +       regulator-always-on;
>>>>> +       regulator-min-microvolt =3D <1100000>;
>>>>> +       regulator-max-microvolt =3D <1100000>;
>>>>> +       regulator-name =3D "vdd-cpus";
>>>>> +};
>>>>> +
>>>>> +&reg_rtc_ldo {
>>>>> +       regulator-name =3D "vcc-rtc";
>>>>> +};
>>>>> +
>>>>>  &uart0 {
>>>>>         pinctrl-names =3D "default";
>>>>>         pinctrl-0 =3D <&uart0_pins_a>;
>>>>> --
>>>>> 2.13.0
>>>>>
>>>>> --
>>>>> You received this message because you are subscribed to the Google
>>>>
>>>> Groups "linux-sunxi" group.
>>>>>
>>>>> To unsubscribe from this group and stop receiving emails from it,
>>>>
>>>> send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>>>>
>>>>> For more options, visit https://groups.google.com/d/optout.
>>>
>>>
>>> --
>>> You received this message because you are subscribed to the Google Grou=
ps
>>> "linux-sunxi" group.
>>> To unsubscribe from this group and stop receiving emails from it, send =
an
>>> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>> For more options, visit https://groups.google.com/d/optout.
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
