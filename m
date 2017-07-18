From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 8/9] arm64: allwinner: a64: enable AXP803
 regulators for Pine64
Date: Tue, 18 Jul 2017 10:58:52 +0800
Message-ID: <CAGb2v65Fn4rvyLyZaFHfmUFQNq3ctN0+tG_fg24YhPpi-Vr8hA@mail.gmail.com>
References: <20170518071653.36561-1-icenowy@aosc.io> <20170518071653.36561-9-icenowy@aosc.io>
 <98ae1ea8-ef08-8859-63d8-57c56a6348a6@arm.com> <4B129FD0-4AEB-4DC3-AF33-C279468BD197@aosc.io>
 <77045320-c19a-6c18-ed68-108fa5416c2a@arm.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBPTWXFQKGQEF7IQORY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <77045320-c19a-6c18-ed68-108fa5416c2a-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 4:55 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wr=
ote:
> Hi,
>
> On 19/05/17 09:29, Icenowy Zheng wrote:
>>
>>
>> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=884:27:21, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>>> Hi,
>>>
>>> On 18/05/17 08:16, Icenowy Zheng wrote:
>>>> Add support of AXP803 regulators in the Pine64 device tree, in order
>>> to
>>>> enable many future functionalities, e.g. Wi-Fi.
>>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>> Changes in v6:
>>>> - Rebased on next-20170517.
>>>>
>>>>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109
>>> +++++++++++++++++++++
>>>>  1 file changed, 109 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> index 36001884ed33..40921bacb39c 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> @@ -118,6 +118,115 @@
>>>>     };
>>>>  };
>>>>
>>>> +#include "axp803.dtsi"
>>>> +
>>>> +&reg_aldo1 {
>>>> +   regulator-min-microvolt =3D <2800000>;
>>>> +   regulator-max-microvolt =3D <2800000>;
>>>> +   regulator-name =3D "vcc-csi";
>>>> +};
>>>> +
>>>> +&reg_aldo2 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <1800000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-pl";
>>>> +};
>>>> +
>>>> +&reg_aldo3 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <2700000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-pll-avcc";
>>>> +};
>
> The schematic puts this at a fixed 3.0V, so why the range here? Are we
> expected to tune the voltage of the PLLs?

Normally these would describe the operating limits. We did this
in the past for most boards. I'm fine with fixing it to 3.0V
though.

>
>>>> +
>>>> +&reg_dc1sw {
>>>> +   regulator-name =3D "vcc-phy";
>>>> +};
>>>> +
>>>> +&reg_dcdc1 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <3300000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-3v3";
>>>> +};
>>>> +
>>>> +&reg_dcdc2 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <1000000>;
>>>> +   regulator-max-microvolt =3D <1300000>;
>>>> +   regulator-name =3D "vdd-cpux";
>>>> +};
>>>> +
>>>> +/* DCDC3 is polyphased with DCDC2 */
>>>> +
>>>> +&reg_dcdc5 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <1500000>;
>>>> +   regulator-max-microvolt =3D <1500000>;
>>>> +   regulator-name =3D "vcc-dram";
>>>> +};
>>>
>>> I think I mentioned this before, but the Pine64 has DDR3L DRAM, which
>>> is
>>> specified to run at 1.35V (1.36V with the 20mV granularity of the AXP).
>>> The reset value is even (wrongly?) configured to 1.24V.
>>>
>>> So is there any reason you set the voltage to 1.5V? Is that what the
>>> BSP
>>> does? Or did you see any problems with 1.36V?
>>
>> I just set it based on the schematics.
>
> I wouldn't trust the schematics too much. They are rather generic, see
> the Ethernet page, for instance, showing *different* PHYs, not just the
> ones used.
> For the DRAM the Pine64 schematic does not even tell the DRAM chip used,
> the name under the chip is just describing the package.
>
>> And 1.35v cannot be accurately achieved by dcdc5 and it's a problem whet=
her to use 1.34v or 1.36v ;-)
>
> Well, as I wrote above, 1.36V is the voltage to go with. I think 10mV
> more is well within the tolerance ;-)
>
>>>> +&reg_dcdc6 {
>>>> +   regulator-always-on;
>>>> +   regulator-min-microvolt =3D <1100000>;
>>>> +   regulator-max-microvolt =3D <1100000>;
>>>> +   regulator-name =3D "vdd-sys";
>>>> +};
>>>> +
>>>> +&reg_dldo1 {
>>>> +   regulator-min-microvolt =3D <3300000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-hdmi";
>>>> +};
>>>> +
>>>> +&reg_dldo2 {
>>>> +   regulator-min-microvolt =3D <3300000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-mipi";
>>>> +};
>>>> +
>>>> +&reg_dldo3 {
>>>> +   regulator-min-microvolt =3D <3300000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "avdd-csi";
>>>> +};
>
> If you stick to the schematic, this should be 2.8V.

Agreed. But...

>>>> +
>>>> +&reg_dldo4 {
>>>> +   regulator-min-microvolt =3D <3300000>;
>>>> +   regulator-max-microvolt =3D <3300000>;
>>>> +   regulator-name =3D "vcc-wifi";
>>>> +};
>>>> +
>>>> +&reg_eldo1 {
>>>> +   regulator-min-microvolt =3D <1800000>;
>>>> +   regulator-max-microvolt =3D <1800000>;
>>>> +   regulator-name =3D "cpvdd";
>>>> +};
>>>> +
>>>> +&reg_eldo3 {
>>>> +   regulator-min-microvolt =3D <1800000>;
>>>> +   regulator-max-microvolt =3D <1800000>;
>>>> +   regulator-name =3D "vdd-1v8-csi";
>>>> +};
>
> The schematic lists 1.2V/1.5V/1.8V here, so should we have a range?

This and avdd-csi really depends on the camera module used.
Maybe this should be left to an overlay.

>
>>>> +
>>>> +&reg_fldo1 {
>>>> +   regulator-min-microvolt =3D <1200000>;
>>>> +   regulator-max-microvolt =3D <1200000>;
>>>> +   regulator-name =3D "vcc-1v2-hsic";
>>>> +};
>>>> +
>>>> +&reg_fldo2 {
>>>> +   regulator-always-on;
>
> Why do we need to turn this on? Upstream firmware does not use the
> arisc, so it can stay off.
> Also in general I think Linux should not tinker with the management
> processor at all.

I'm not sure, but I think at least one SoC had failed to work without
this powered on. If that is the case with the A64, then please leave
a comment saying so. Otherwise let it stay off.

ChenYu

> Cheers,
> Andre.
>
>>>> +   regulator-min-microvolt =3D <1100000>;
>>>> +   regulator-max-microvolt =3D <1100000>;
>>>> +   regulator-name =3D "vdd-cpus";
>>>> +};
>>>> +
>>>> +&reg_rtc_ldo {
>>>> +   regulator-name =3D "vcc-rtc";
>>>> +};
>>>> +
>>>>  /* On Exp and Euler connectors */
>>>>  &uart0 {
>>>>     pinctrl-names =3D "default";
>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
