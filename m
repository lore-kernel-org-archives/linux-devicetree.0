From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] Revert "ARM: dts: sunxi: Add regulators for
 Sinovoip BPI-M2"
Date: Tue, 13 Feb 2018 18:36:24 +0800
Message-ID: <CAGb2v66BDbLgNVAp=D0QXH4WEMZpa+rCWYk+uLXexme2qgjeBg@mail.gmail.com>
References: <20180203112353.13497-1-icenowy@aosc.io> <20180205095558.2e713c24cdb7c3232943db52@bidouilliste.com>
 <207CD143-6535-42C9-BEF3-9D2614336482@aosc.io> <c59ee4bd3246172ec62705967bb8f751@megadrive.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQH7RLKAKGQEKQ52AWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <c59ee4bd3246172ec62705967bb8f751-/Q/jCV+WVIbNLxjTenLetw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 10, 2018 at 5:20 AM, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> wro=
te:
> On 2018-02-05 10:05, Icenowy Zheng wrote:
>>
>> =E4=BA=8E 2018=E5=B9=B42=E6=9C=885=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
4:55:58, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
>> =E5=86=99=E5=88=B0:
>>>
>>>
>>> Hello,
>>>
>>> On Sat,  3 Feb 2018 19:23:53 +0800
>>> Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>>
>>>> This reverts commit 7daa213700758b5b08fc0daab09bb139dd334165.
>>>>
>>>> The original commit has several problems:
>>>>
>>>> - vdd-cpus and aldo3 (AVCC of the SoC) are not set to always-on,
>>>
>>> which
>>>>
>>>> leads to system hang when disabling unused regulators.
>>>
>>>
>>> Indeed I should have make those always-on.
>>>
>>>> - GMAC (which uses dldo1 and aldo2) and Wi-Fi (which uses aldo1) are
>>>
>>> not
>>>>
>>>> considered, and will fail to work after adding this commit.
>>>
>>>
>>> While I understand the problem with vdd-cpus and aldo3 I don't see why
>>> when you don't declare regulator the code should do something with it.
>>> DT is supposed to describe the hardware and the code should not use
>>> hardware not described right ?
>>> The gmac node doesn't declare any regulators and the mmc2 uses
>>> reg_vcc3v0 (haven't checked on the schematics yet if it is correct).
>>
>>
>> It's because the regulator support isn't present before
>> this commit. However these parts really need special
>> regulators. I don't have M2 schematics at hand, so you'd
>> check it by yourself.
>
>
>  Yes but why does the PMIC should disable regulators not defined in the D=
TS
> ? That the part I don't understand and want to know where it is
> described/documented.

They are defined. See axp22x.dtsi, which you included in your patch.

Now the system is free to do whatever it wants under the constraints
of the device tree. Since you do not reference the regulator, the
kernel is free to turn it off to save power.

>
>> P.S. a proper device tree with AXP shouldn't use
>> reg_vcc3v0/3v3/1v8/etc. They're dummy
>> regulator nodes for
>> not implemented or not controllable regulators.
>>
>>>
>>>> This indicates that this patch should be not tested at all.
>>>
>>>
>>> This have indeed not been tested with linux.
>>> I think that this commit should not be reverted, I'll send a proper
>>> patch tonight or tomorow night max.
>>
>>
>> Please test patches sent to Linux on Linux :-)
>
>
>  If my patches adhere to the bindings I don't see why.

It adheres to the bindings, but does not accurately describe the
hardware constraints.

ChenYu

>
>
>>>
>>> P.S.: Also as I'm the original sender I think I should have been in CC
>>> no ?
>>
>>
>> get_maintainer.pl didn't mention you and I forgot... sorry.
>>
>>>
>>> Cheers,
>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 57
>>>
>>> ------------------------
>>>>
>>>>  1 file changed, 57 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>>>
>>> b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>>>>
>>>> index 51e6f1d21c32..a565316eb340 100644
>>>> --- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>>>> +++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
>>>> @@ -86,10 +86,6 @@
>>>>         };
>>>>  };
>>>>
>>>> -&cpu0 {
>>>> -       cpu-supply =3D <&reg_dcdc3>;
>>>> -};
>>>> -
>>>>  &ehci0 {
>>>>         status =3D "okay";
>>>>  };
>>>> @@ -155,17 +151,6 @@
>>>>         status =3D "okay";
>>>>  };
>>>>
>>>> -&p2wi {
>>>> -       status =3D "okay";
>>>> -
>>>> -       axp22x: pmic@68 {
>>>> -               compatible =3D "x-powers,axp221";
>>>> -               reg =3D <0x68>;
>>>> -               interrupt-parent =3D <&nmi_intc>;
>>>> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
>>>> -       };
>>>> -};
>>>> -
>>>>  &pio {
>>>>         gmac_phy_reset_pin_bpi_m2: gmac_phy_reset_pin@0 {
>>>>                 pins =3D "PA21";
>>>> @@ -191,48 +176,6 @@
>>>>         };
>>>>  };
>>>>
>>>> -#include "axp22x.dtsi"
>>>> -
>>>> -&reg_dc5ldo {
>>>> -       regulator-min-microvolt =3D <700000>;
>>>> -       regulator-max-microvolt =3D <1320000>;
>>>> -       regulator-name =3D "vdd-cpus";
>>>> -};
>>>> -
>>>> -&reg_dcdc1 {
>>>> -       regulator-always-on;
>>>> -       regulator-min-microvolt =3D <3000000>;
>>>> -       regulator-max-microvolt =3D <3000000>;
>>>> -       regulator-name =3D "vdd-3v0";
>>>> -};
>>>> -
>>>> -&reg_dcdc2 {
>>>> -       regulator-min-microvolt =3D <700000>;
>>>> -       regulator-max-microvolt =3D <1320000>;
>>>> -       regulator-name =3D "vdd-gpu";
>>>> -};
>>>> -
>>>> -&reg_dcdc3 {
>>>> -       regulator-always-on;
>>>> -       regulator-min-microvolt =3D <700000>;
>>>> -       regulator-max-microvolt =3D <1320000>;
>>>> -       regulator-name =3D "vdd-cpu";
>>>> -};
>>>> -
>>>> -&reg_dcdc4 {
>>>> -       regulator-always-on;
>>>> -       regulator-min-microvolt =3D <700000>;
>>>> -       regulator-max-microvolt =3D <1320000>;
>>>> -       regulator-name =3D "vdd-sys-dll";
>>>> -};
>>>> -
>>>> -&reg_dcdc5 {
>>>> -       regulator-always-on;
>>>> -       regulator-min-microvolt =3D <1500000>;
>>>> -       regulator-max-microvolt =3D <1500000>;
>>>> -       regulator-name =3D "vcc-dram";
>>>> -};
>>>> -
>>>>  &uart0 {
>>>>         pinctrl-names =3D "default";
>>>>         pinctrl-0 =3D <&uart0_pins_a>;
>>>> --
>>>> 2.15.1
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
> --
> Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
