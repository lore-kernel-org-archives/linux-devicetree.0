From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 10/11] arm64: allwinner: a64: enable
 AXP803 regulators for Pine64
Date: Wed, 5 Apr 2017 16:25:02 +0800
Message-ID: <7858d4bc-aec9-e4e9-9d3c-5742267c324e@aosc.io>
References: <20170405061552.C15201033DF@relay.mailchannels.net>
 <20170405080857.hetsjgatyh6hbsoh@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB5OTSLDQKGQERXWDUPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170405080857.hetsjgatyh6hbsoh@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2017=E5=B9=B404=E6=9C=8805=E6=97=A5 16:08, Maxime Ripard =E5=86=
=99=E9=81=93:
> On Wed, Apr 05, 2017 at 02:15:43PM +0800, Icenowy Zheng wrote:
>>
>> 2017=E5=B9=B44=E6=9C=885=E6=97=A5 14:13=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>>>
>>> On Wed, Apr 05, 2017 at 02:01:44AM +0800, Icenowy Zheng wrote:
>>>> Add support of AXP803 regulators in the Pine64 device tree, in order t=
o
>>>> enable many future functionalities, e.g. Wi-Fi.
>>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>>   .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109 +++++++++++=
++++++++++
>>>>   1 file changed, 109 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> index 2132d8e6cb3d..7da074f95065 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>>>> @@ -106,6 +106,115 @@
>>>>   };
>>>>   };
>>>>
>>>> +#include "axp803.dtsi"
>>>> +
>>>> +&reg_aldo1 {
>>>> + regulator-min-microvolt =3D <2800000>;
>>>> + regulator-max-microvolt =3D <2800000>;
>>>> + regulator-name =3D "vcc-csi";
>>>> +};
>>>> +
>>>> +&reg_aldo2 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <1800000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-pl";
>>>> +};
>>>> +
>>>> +&reg_aldo3 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <2700000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-pll-avcc";
>>>> +};
>>>> +
>>>> +&reg_dc1sw {
>>>> + regulator-name =3D "vcc-phy";
>>>> +};
>>>> +
>>>> +&reg_dcdc1 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <3300000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-3v3";
>>>> +};
>>>> +
>>>> +&reg_dcdc2 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <1000000>;
>>>> + regulator-max-microvolt =3D <1300000>;
>>>> + regulator-name =3D "vdd-cpux";
>>>> +};
>>>> +
>>>> +/* DCDC3 is polyphased with DCDC2 */
>>>> +
>>>> +&reg_dcdc5 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <1500000>;
>>>> + regulator-max-microvolt =3D <1500000>;
>>>> + regulator-name =3D "vcc-dram";
>>>> +};
>>>> +
>>>> +&reg_dcdc6 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <1100000>;
>>>> + regulator-max-microvolt =3D <1100000>;
>>>> + regulator-name =3D "vdd-sys";
>>>> +};
>>>> +
>>>> +&reg_dldo1 {
>>>> + regulator-min-microvolt =3D <3300000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-hdmi";
>>>> +};
>>>> +
>>>> +&reg_dldo2 {
>>>> + regulator-min-microvolt =3D <3300000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-mipi";
>>>> +};
>>>> +
>>>> +&reg_dldo3 {
>>>> + regulator-min-microvolt =3D <3300000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "avdd-csi";
>>>> +};
>>>> +
>>>> +&reg_dldo4 {
>>>> + regulator-min-microvolt =3D <3300000>;
>>>> + regulator-max-microvolt =3D <3300000>;
>>>> + regulator-name =3D "vcc-wifi";
>>>> +};
>>>> +
>>>> +&reg_eldo1 {
>>>> + regulator-min-microvolt =3D <1800000>;
>>>> + regulator-max-microvolt =3D <1800000>;
>>>> + regulator-name =3D "cpvdd";
>>>> +};
>>>> +
>>>> +&reg_eldo3 {
>>>> + regulator-min-microvolt =3D <1800000>;
>>>> + regulator-max-microvolt =3D <1800000>;
>>>> + regulator-name =3D "vdd-1v8-csi";
>>>> +};
>>>> +
>>>> +&reg_fldo1 {
>>>> + regulator-min-microvolt =3D <1200000>;
>>>> + regulator-max-microvolt =3D <1200000>;
>>>> + regulator-name =3D "vcc-1v2-hsic";
>>>> +};
>>>> +
>>>> +&reg_fldo2 {
>>>> + regulator-always-on;
>>>> + regulator-min-microvolt =3D <1100000>;
>>>> + regulator-max-microvolt =3D <1100000>;
>>>> + regulator-name =3D "vdd-cpus";
>>>> +};
>>>
>>> Why do you need to always power the AR100 on?
>>
>> It's for CPUS power domain, not the AR100 processor.
>>
>> Kill it will lead to instantly system hang.
>
> What are you calling CPUS then?

I think it's the full zone after 0x01f00000 (all R_
peripherals)

In A23/A33 we also called this "vdd-cpus" and it should
be always-on.

>
> Maxime
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
