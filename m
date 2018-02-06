From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 05/10] ARM: sun8i: h3: add
 operating-points-v2 table for CPU
Date: Tue, 06 Feb 2018 17:10:26 +0800
Message-ID: <D4A773D5-E57C-4767-9D3C-0D386BF76DED@aosc.io>
References: <20180206044905.30508-1-icenowy@aosc.io> <20180206044905.30508-6-icenowy@aosc.io> <20180206090656.r52hs7sk7w5iynrk@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBEXC4XJQKGQEZDIFT3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180206090656.r52hs7sk7w5iynrk@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885:0=
6:56, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Tue, Feb 06, 2018 at 12:49:00PM +0800, Icenowy Zheng wrote:
>> The CPU on Allwinner H3 can do dynamic frequency scaling.
>>=20
>> Add a DVFS table based on the one shipped with Allwinner's H3 SDK.
>The
>> voltage-frequency relationship seems to be conservative, and Armbian
>has
>> another DVFS table which uses lower voltage at a certain frequency.
>> However, the official one is chosen for safety.
>>=20
>> Frequencies higher than 1008MHz are temporarily dropped in the table,
>as
>> they may lead to over voltage on boards without proper regulator
>> settings or over temperature on boards with proper regulator
>settings.
>> They will be added back once regulator settings are ready and thermal
>> sensor driver is merged.
>>=20
>> In order to satisfy all different regulators (SY8106A which is 50mV
>per
>> level, SY8113B which have two states: 1.1V and 1.3V, and some board
>with
>> non-tweakable regulators), all the OPPs are defined with a range
>which has
>> the target value as the minimum allowed value, and 1.3V (the highest
>> VDD-CPUX voltage suggested by the datasheet) as the maximum allowed
>value.
>> It's proven to work well with a board with SY8113B.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v2:
>> - Switch to BSP OPP table, which is more conservative.
>>=20
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 32
>+++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>b/arch/arm/boot/dts/sun8i-h3.dtsi
>> index 8495deecedad..36608c03f02b 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -43,32 +43,62 @@
>>  #include "sunxi-h3-h5.dtsi"
>> =20
>>  / {
>> +	cpu0_opp_table: opp_table0 {
>> +		compatible =3D "operating-points-v2";
>> +		opp-shared;
>> +
>> +		opp@648000000 {
>> +			opp-hz =3D /bits/ 64 <648000000>;
>> +			opp-microvolt =3D <1040000 1040000 1300000>;
>> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
>> +		};
>> +
>> +		opp@816000000 {
>> +			opp-hz =3D /bits/ 64 <816000000>;
>> +			opp-microvolt =3D <1100000 1100000 1300000>;
>> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
>> +		};
>> +
>> +		opp@1008000000 {
>> +			opp-hz =3D /bits/ 64 <1008000000>;
>> +			opp-microvolt =3D <1200000 1200000 1300000>;
>> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
>> +		};
>> +	};
>> +
>>  	cpus {
>>  		#address-cells =3D <1>;
>>  		#size-cells =3D <0>;
>> =20
>> -		cpu@0 {
>> +		cpu0: cpu@0 {
>>  			compatible =3D "arm,cortex-a7";
>>  			device_type =3D "cpu";
>>  			reg =3D <0>;
>> +			clocks =3D <&ccu CLK_CPUX>;
>> +			clock-names =3D "cpu";
>> +			operating-points-v2 =3D <&cpu0_opp_table>;
>> +			#cooling-cells =3D <0x2>;
>
>So, that would be 2?

Okay.

>
>There's this pattern on pretty much all the other patches following
>this one as well, you should address them too.
>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
