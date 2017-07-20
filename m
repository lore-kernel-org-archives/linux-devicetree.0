From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v4 4/5] ARM: sunxi: h3/h5: switch
 apb0-related clocks to r_ccu
Date: Thu, 20 Jul 2017 16:21:11 +0800
Message-ID: <a934bb1292328400004e58c886ccd693@aosc.io>
References: <20170404095100.18649-1-icenowy@aosc.io>
 <20170404095100.18649-5-icenowy@aosc.io> <1500505173.23770.1.camel@xff.cz>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6OPYHFQKGQE4XI6BDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1500505173.23770.1.camel-DlDF6nMZSto@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi-DlDF6nMZSto@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-07-20 06:59=EF=BC=8COnd=C5=99ej Jirman =E5=86=99=E9=81=93=EF=
=BC=9A
> Hi,
>=20
> Icenowy Zheng p=C3=AD=C5=A1e v =C3=9At 04. 04. 2017 v 17:50 +0800:
>> From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>=20
>> Now we have driver for the PRCM CCU, switch to use it instead of
>> old-style clock nodes for apb0-related clocks in sunxi-h3-h5.dtsi .
>>=20
>> The mux 3 of R_CCU is still the internal oscillator, which is said to=20
>> be
>> 16MHz plus minus 30%, and get a measured value of 15MHz~16MHz on my=20
>> two
>> H3 boards and one H5 board.
>=20
> There's issue with the new r_ccu that breaks r_i2c. (no devices can be
> found on the bus). Reverting this patch fixes the issue with the I2C
> controller. (everything else being the same)
>=20
> Here's the code I'm using: https://github.com/megous/linux/commits/oran
> ge-pi-4.12
>=20
> The last commit is the revert.
>=20
> The issue manifests itself by non-working DVFS, because kernel lacks
> access to SY8106A regulator, because r_i2c doesn't work with sunxi-ng
> clock driver (sun8i-r).
>=20
> Relevant difference in registers between working/non-working state is
> just this (diff -u):
>=20
>  0x01f02400 =3D 0x00000000
>  0x01f02404 =3D 0x00000000
> -0x01f02408 =3D 0x00000091
> +0x01f02408 =3D 0x00000095 DATA register inisde the I2C controller
>  0x01f0240c =3D 0x00000044
>  0x01f02410 =3D 0x000000f8
> -0x01f02414 =3D 0x00000059
> +0x01f02414 =3D 0x00000000 CLOCK setup register inside the I2C controller
>  0x01f02418 =3D 0x00000000
>  0x01f0241c =3D 0x00000000
>  0x01f02420 =3D 0x0000003a
>=20
> It looks like the new sunxi-ng clock driver causes the I2C driver to
> not correctly configure the CLOCK register. I don't know why and I'm
> not sure how to deal with this. Any ideas what can I do next?

Could you apply the patches at [1] and [2] to U-Boot and re-try with
r_ccu? They switched the CPUs clock of r_ccu to non-secure mode, which
makes it possible to be accessed from the kernel running in non-secure.

I think these patches can solve this problem.

[1] https://patchwork.ozlabs.org/patch/791414/
[2] https://patchwork.ozlabs.org/patch/791415/

>=20
> thank you and regards,
>   o.
>=20
>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> ---
>> Changes in v4:
>> - Temporarily dropped the CCU headers.
>> Changes in v3:
>> - Change osc32000 to iosc.
>>=20
>>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 45=20
>> ++++++++++++--------------------------
>>  1 file changed, 14 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi=20
>> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> index 6640ebfa6419..1aeeacb3a884 100644
>> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
>> @@ -68,31 +68,12 @@
>>  			clock-output-names =3D "osc32k";
>>  		};
>>=20
>> -		apb0: apb0_clk {
>> -			compatible =3D "fixed-factor-clock";
>> +		iosc: internal-osc-clk {
>>  			#clock-cells =3D <0>;
>> -			clock-div =3D <1>;
>> -			clock-mult =3D <1>;
>> -			clocks =3D <&osc24M>;
>> -			clock-output-names =3D "apb0";
>> -		};
>> -
>> -		apb0_gates: clk@01f01428 {
>> -			compatible =3D "allwinner,sun8i-h3-apb0-gates-clk",
>> -				     "allwinner,sun4i-a10-gates-clk";
>> -			reg =3D <0x01f01428 0x4>;
>> -			#clock-cells =3D <1>;
>> -			clocks =3D <&apb0>;
>> -			clock-indices =3D <0>, <1>;
>> -			clock-output-names =3D "apb0_pio", "apb0_ir";
>> -		};
>> -
>> -		ir_clk: ir_clk@01f01454 {
>> -			compatible =3D "allwinner,sun4i-a10-mod0-clk";
>> -			reg =3D <0x01f01454 0x4>;
>> -			#clock-cells =3D <0>;
>> -			clocks =3D <&osc32k>, <&osc24M>;
>> -			clock-output-names =3D "ir";
>> +			compatible =3D "fixed-clock";
>> +			clock-frequency =3D <16000000>;
>> +			clock-accuracy =3D <300000000>;
>> +			clock-output-names =3D "iosc";
>>  		};
>>  	};
>>=20
>> @@ -576,9 +557,12 @@
>>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>>  		};
>>=20
>> -		apb0_reset: reset@01f014b0 {
>> -			reg =3D <0x01f014b0 0x4>;
>> -			compatible =3D "allwinner,sun6i-a31-clock-reset";
>> +		r_ccu: clock@1f01400 {
>> +			compatible =3D "allwinner,sun50i-a64-r-ccu";
>> +			reg =3D <0x01f01400 0x100>;
>> +			clocks =3D <&osc24M>, <&osc32k>, <&iosc>;
>> +			clock-names =3D "hosc", "losc", "iosc";
>> +			#clock-cells =3D <1>;
>>  			#reset-cells =3D <1>;
>>  		};
>>=20
>> @@ -589,9 +573,9 @@
>>=20
>>  		ir: ir@01f02000 {
>>  			compatible =3D "allwinner,sun5i-a13-ir";
>> -			clocks =3D <&apb0_gates 1>, <&ir_clk>;
>> +			clocks =3D <&r_ccu 4>, <&r_ccu 11>;
>>  			clock-names =3D "apb", "ir";
>> -			resets =3D <&apb0_reset 1>;
>> +			resets =3D <&r_ccu 0>;
>>  			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>>  			reg =3D <0x01f02000 0x40>;
>>  			status =3D "disabled";
>> @@ -601,9 +585,8 @@
>>  			compatible =3D "allwinner,sun8i-h3-r-pinctrl";
>>  			reg =3D <0x01f02c00 0x400>;
>>  			interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks =3D <&apb0_gates 0>, <&osc24M>, <&osc32k>;
>> +			clocks =3D <&r_ccu 3>, <&osc24M>, <&osc32k>;
>>  			clock-names =3D "apb", "hosc", "losc";
>> -			resets =3D <&apb0_reset 0>;
>>  			gpio-controller;
>>  			#gpio-cells =3D <3>;
>>  			interrupt-controller;
>> --
>> 2.12.2
>>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
