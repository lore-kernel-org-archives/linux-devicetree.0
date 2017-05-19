From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 8/9] arm64: allwinner: a64: enable AXP803
 regulators for Pine64
Date: Fri, 19 May 2017 11:10:36 +0800
Message-ID: <CAGb2v66utRHYXDoG4UPgbrebgHdKne7FZcA+b4M+Ns1rEGN24g@mail.gmail.com>
References: <20170518071653.36561-1-icenowy@aosc.io> <20170518071653.36561-9-icenowy@aosc.io>
 <CAGb2v646i-zonDa+o-E_9k8i2_dqbEzQCNrEPw-+w-EEuat6nw@mail.gmail.com> <8610FFF7-148D-4582-8AAC-6A1BB771C9F7@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRGE7HEAKGQEOIS42RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8610FFF7-148D-4582-8AAC-6A1BB771C9F7-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 11:00 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
10:54:21, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>>Hi,
>>
>>On Thu, May 18, 2017 at 3:16 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>> Add support of AXP803 regulators in the Pine64 device tree, in order
>>to
>>> enable many future functionalities, e.g. Wi-Fi.
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>> Changes in v6:
>>> - Rebased on next-20170517.
>>>
>>>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109
>>+++++++++++++++++++++
>>>  1 file changed, 109 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>> index 36001884ed33..40921bacb39c 100644
>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>> @@ -118,6 +118,115 @@
>>>         };
>>>  };
>>>
>>> +#include "axp803.dtsi"
>>> +
>>> +&reg_aldo1 {
>>> +       regulator-min-microvolt =3D <2800000>;
>>> +       regulator-max-microvolt =3D <2800000>;
>>> +       regulator-name =3D "vcc-csi";
>>
>>"csi-afvdd-dovdd"
>>
>>This regulator provides power for the camera module's Auto Focus, if
>>available,
>>and Digital i/O parts of the sensor module. Hence the names of the
>>rails.
>>
>>> +};
>>> +
>>> +&reg_aldo2 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <1800000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-pl";
>>> +};
>>> +
>>> +&reg_aldo3 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <2700000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-pll-avcc";
>>> +};
>>> +
>>> +&reg_dc1sw {
>>> +       regulator-name =3D "vcc-phy";
>>> +};
>>> +
>>> +&reg_dcdc1 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <3300000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-3v3";
>>> +};
>>> +
>>> +&reg_dcdc2 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <1000000>;
>>> +       regulator-max-microvolt =3D <1300000>;
>>> +       regulator-name =3D "vdd-cpux";
>>> +};
>>> +
>>> +/* DCDC3 is polyphased with DCDC2 */
>>> +
>>> +&reg_dcdc5 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <1500000>;
>>> +       regulator-max-microvolt =3D <1500000>;
>>> +       regulator-name =3D "vcc-dram";
>>> +};
>>> +
>>> +&reg_dcdc6 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <1100000>;
>>> +       regulator-max-microvolt =3D <1100000>;
>>> +       regulator-name =3D "vdd-sys";
>>> +};
>>> +
>>> +&reg_dldo1 {
>>> +       regulator-min-microvolt =3D <3300000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-hdmi";
>>> +};
>>
>>This should probably be "vcc-hdmi-dsi".
>
> oh yes...
>
>>
>>> +
>>> +&reg_dldo2 {
>>> +       regulator-min-microvolt =3D <3300000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-mipi";
>>> +};
>>
>>On the MIPI-LCD page of the schematics, it says this is connected to
>>VDD18, so it should be 1.8V.
>
> Rename it to "vcc-dsi-1v8"?

The name is OK. I'm just worried about the voltage. We don't want
users frying their display panel. They probably cost more than the
board itself.

For most of these SBCs, they are designed to work with the panels
they provide. Could you reach out to TL Lim and ask about the voltage
used? Or maybe dig it out of the FEX files?

Thanks
ChenYu

>>
>>> +
>>> +&reg_dldo3 {
>>> +       regulator-min-microvolt =3D <3300000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "avdd-csi";
>>> +};
>>
>>2.8V for this one.
>>
>
> Thanks!
>
>>ChenYu
>>
>>> +
>>> +&reg_dldo4 {
>>> +       regulator-min-microvolt =3D <3300000>;
>>> +       regulator-max-microvolt =3D <3300000>;
>>> +       regulator-name =3D "vcc-wifi";
>>> +};
>>> +
>>> +&reg_eldo1 {
>>> +       regulator-min-microvolt =3D <1800000>;
>>> +       regulator-max-microvolt =3D <1800000>;
>>> +       regulator-name =3D "cpvdd";
>>> +};
>>> +
>>> +&reg_eldo3 {
>>> +       regulator-min-microvolt =3D <1800000>;
>>> +       regulator-max-microvolt =3D <1800000>;
>>> +       regulator-name =3D "vdd-1v8-csi";
>>> +};
>>> +
>>> +&reg_fldo1 {
>>> +       regulator-min-microvolt =3D <1200000>;
>>> +       regulator-max-microvolt =3D <1200000>;
>>> +       regulator-name =3D "vcc-1v2-hsic";
>>> +};
>>> +
>>> +&reg_fldo2 {
>>> +       regulator-always-on;
>>> +       regulator-min-microvolt =3D <1100000>;
>>> +       regulator-max-microvolt =3D <1100000>;
>>> +       regulator-name =3D "vdd-cpus";
>>> +};
>>> +
>>> +&reg_rtc_ldo {
>>> +       regulator-name =3D "vcc-rtc";
>>> +};
>>> +
>>>  /* On Exp and Euler connectors */
>>>  &uart0 {
>>>         pinctrl-names =3D "default";
>>> --
>>> 2.12.2
>>>
>>> --
>>> You received this message because you are subscribed to the Google
>>Groups "linux-sunxi" group.
>>> To unsubscribe from this group and stop receiving emails from it,
>>send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
