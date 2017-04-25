From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 09/10] arm64: allwinner: a64: enable
 AXP803 regulators for Pine64
Date: Tue, 25 Apr 2017 17:28:01 +0800
Message-ID: <B52BFC2A-58C9-4F1C-A477-D5522347F07B@aosc.io>
References: <20170424160103.9447-1-icenowy@aosc.io> <20170424160103.9447-10-icenowy@aosc.io> <8c7864f1-a0d7-b87f-f9d6-5201cc773609@arm.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBK5N7TDQKGQE5C5C5OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8c7864f1-a0d7-b87f-f9d6-5201cc773609-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B44=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885:=
24:13, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On 24/04/17 17:01, Icenowy Zheng wrote:
>> Add support of AXP803 regulators in the Pine64 device tree, in order
>to
>> enable many future functionalities, e.g. Wi-Fi.
>
>In general that's quite some code to just achieve some device power
>plane switching, but that's another discussion, I guess ;-)
>
>To me this patch here like a lot of churn to be duplicated in each
>board's DT.
>Can't we provide some sane defaults, either in axp803.dtsi or in an
>extra file (allwinner-ref-axp803.dtsi?), and only overwrite them in a
>board's DT if a board deviates?

For critical regulators you're right, however, peripherals' power seems to =
vary a lot, e.g. Wi-Fi and HDMI.

The DLDO1 for HDMI and DLDO4 for Wi-Fi design is only adopted by Pine64; ac=
cording to BPi M64 schematics, Wi-Fi is DLDO2 and Wi-Fi IO voltage is DLDO4=
 (on Pine64 it's ELDO1 which is forced to be 1.8v because it's connected to=
 CPVDD); on Orange Pi Win {,Plus} Wi-Fi is ALDO1, Wi-Fi IO is DLDO4 and HDM=
I is DLDO3.

>Because it seems like many boards are actually based on some Allwinner
>reference design and use very similar, if not identical settings.
>
>Also one thing below ...
>
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109
>+++++++++++++++++++++
>>  1 file changed, 109 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> index 3e1b44292534..abc1879e91f2 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> @@ -106,6 +106,115 @@
>>  	};
>>  };
>> =20
>> +#include "axp803.dtsi"
>> +
>> +&reg_aldo1 {
>> +	regulator-min-microvolt =3D <2800000>;
>> +	regulator-max-microvolt =3D <2800000>;
>> +	regulator-name =3D "vcc-csi";
>> +};
>> +
>> +&reg_aldo2 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <1800000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-pl";
>> +};
>> +
>> +&reg_aldo3 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <2700000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-pll-avcc";
>> +};
>> +
>> +&reg_dc1sw {
>> +	regulator-name =3D "vcc-phy";
>> +};
>> +
>> +&reg_dcdc1 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <3300000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-3v3";
>> +};
>> +
>> +&reg_dcdc2 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <1000000>;
>> +	regulator-max-microvolt =3D <1300000>;
>> +	regulator-name =3D "vdd-cpux";
>> +};
>> +
>> +/* DCDC3 is polyphased with DCDC2 */
>> +
>> +&reg_dcdc5 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <1500000>;
>> +	regulator-max-microvolt =3D <1500000>;
>
>On the Pine64 there is DDR3L DRAM, running at 1.35V.
>
>Cheers,
>Andre.
>
>
>> +	regulator-name =3D "vcc-dram";
>> +};
>> +
>> +&reg_dcdc6 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <1100000>;
>> +	regulator-max-microvolt =3D <1100000>;
>> +	regulator-name =3D "vdd-sys";
>> +};
>> +
>> +&reg_dldo1 {
>> +	regulator-min-microvolt =3D <3300000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-hdmi";
>> +};
>> +
>> +&reg_dldo2 {
>> +	regulator-min-microvolt =3D <3300000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-mipi";
>> +};
>> +
>> +&reg_dldo3 {
>> +	regulator-min-microvolt =3D <3300000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "avdd-csi";
>> +};
>> +
>> +&reg_dldo4 {
>> +	regulator-min-microvolt =3D <3300000>;
>> +	regulator-max-microvolt =3D <3300000>;
>> +	regulator-name =3D "vcc-wifi";
>> +};
>> +
>> +&reg_eldo1 {
>> +	regulator-min-microvolt =3D <1800000>;
>> +	regulator-max-microvolt =3D <1800000>;
>> +	regulator-name =3D "cpvdd";
>> +};
>> +
>> +&reg_eldo3 {
>> +	regulator-min-microvolt =3D <1800000>;
>> +	regulator-max-microvolt =3D <1800000>;
>> +	regulator-name =3D "vdd-1v8-csi";
>> +};
>> +
>> +&reg_fldo1 {
>> +	regulator-min-microvolt =3D <1200000>;
>> +	regulator-max-microvolt =3D <1200000>;
>> +	regulator-name =3D "vcc-1v2-hsic";
>> +};
>> +
>> +&reg_fldo2 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt =3D <1100000>;
>> +	regulator-max-microvolt =3D <1100000>;
>> +	regulator-name =3D "vdd-cpus";
>> +};
>> +
>> +&reg_rtc_ldo {
>> +	regulator-name =3D "vcc-rtc";
>> +};
>> +
>>  &uart0 {
>>  	pinctrl-names =3D "default";
>>  	pinctrl-0 =3D <&uart0_pins_a>;
>>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
