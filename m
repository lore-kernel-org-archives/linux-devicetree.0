From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [RFC PATCH 10/11] ARM: sun8i: h3: add display
 engine pipeline for TVE
Date: Sat, 20 May 2017 02:10:35 +0800
Message-ID: <B72028D8-B055-4F53-A4EA-7E93A28DB8FF@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170517164354.16399-11-icenowy@aosc.io> <20170519180616.vzrlu2avuucsjkiu@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBLPK7TEAKGQEQ4TOGUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170519180616.vzrlu2avuucsjkiu-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882:=
06:16, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, May 18, 2017 at 12:43:53AM +0800, Icenowy Zheng wrote:
>> As we have already the support for the TV encoder on Allwinner H3,
>add
>> the display engine pipeline device tree nodes to its DTSI file.
>>=20
>> The H5 pipeline has some differences and will be enabled later.
>>=20
>> The currently-unused mixer0 and tcon0 are also needed, for the
>> completement of the pipeline.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 189
>++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 189 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>b/arch/arm/boot/dts/sun8i-h3.dtsi
>> index b36f9f423c39..20172ef92415 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -41,6 +41,8 @@
>>   */
>> =20
>>  #include "sunxi-h3-h5.dtsi"
>> +#include <dt-bindings/clock/sun8i-de2.h>
>> +#include <dt-bindings/reset/sun8i-de2.h>
>> =20
>>  / {
>>  	cpus {
>> @@ -72,6 +74,193 @@
>>  		};
>>  	};
>> =20
>> +	de: display-engine {
>> +		compatible =3D "allwinner,sun8i-h3-display-engine";
>> +		allwinner,pipelines =3D <&mixer0>,
>> +				      <&mixer1>;
>> +		status =3D "disabled";
>> +	};
>> +
>> +	soc {
>> +		display_clocks: clock@1000000 {
>> +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
>> +			reg =3D <0x01000000 0x100000>;
>> +			clocks =3D <&ccu CLK_BUS_DE>,
>> +				 <&ccu CLK_DE>;
>> +			clock-names =3D "bus",
>> +				      "mod";
>> +			resets =3D <&ccu RST_BUS_DE>;
>> +			#clock-cells =3D <1>;
>> +			#reset-cells =3D <1>;
>> +			assigned-clocks =3D <&ccu CLK_DE>;
>> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
>> +			assigned-clock-rates =3D <432000000>;
>
>This shouldn't be set in the DT, but evaluated at runtime when calling
>clk_set_rate.

Nope, DE2 clock doesn't need evalution, as the clock is decoupled with
DE2 mixers' output signal. (Although it seems that SoCs with larger
plane size will use higher clock.)

And setting it to 432MHz is also needed for properly 216MHz clock to TVE.

>
>> +		tve0: tv-encoder@1e00000 {
>> +			compatible =3D "allwinner,sun8i-h3-tv-encoder";
>> +			reg =3D <0x01e00000 0x1000>;
>> +			clocks =3D <&ccu CLK_BUS_TVE>, <&ccu CLK_TVE>;
>> +			clock-names =3D "bus", "mod";
>> +			resets =3D <&ccu RST_BUS_TVE>;
>> +			status =3D "disabled";
>> +
>> +			assigned-clocks =3D <&ccu CLK_TVE>;
>> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
>
>Same thing here. clk_set_rate should just do the right thing.
>
>> +			assigned-clock-rates =3D <216000000>;
>
>And why are you setting it in the driver and in the DT?
>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
