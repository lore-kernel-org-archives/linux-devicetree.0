From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: add audio codec
 support into V3s DTSI
Date: Tue, 06 Feb 2018 10:43:48 +0800
Message-ID: <8F4EA09E-F5DC-4F7A-951B-25DA36848FD1@aosc.io>
References: <20180202140153.21549-1-icenowy@aosc.io> <20180202140153.21549-3-icenowy@aosc.io> <20180202194935.vdqkgch6mowqi2px@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6FM4TJQKGQECB4NZYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180202194935.vdqkgch6mowqi2px-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=883:4=
9:35, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Feb 02, 2018 at 10:01:52PM +0800, Icenowy Zheng wrote:
>> Allwinner V3s SoC features an internal audio codec like the one in
>H3,
>> and a analog codec like the one in H3/A23 (but much simpler).
>>=20
>> Add them in the DTSI file.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-v3s.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi
>b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> index 20edebd983f0..f6c534efaef9 100644
>> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
>> @@ -354,6 +354,25 @@
>>  			status =3D "disabled";
>>  		};
>> =20
>> +		codec: codec@01c22c00 {
>> +			#sound-dai-cells =3D <0>;
>> +			compatible =3D "allwinner,sun8i-v3s-codec";
>> +			reg =3D <0x01c22c00 0x400>;
>> +			interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
>> +			clock-names =3D "apb", "codec";
>> +			resets =3D <&ccu RST_BUS_CODEC>;
>> +			dmas =3D <&dma 15>, <&dma 15>;
>> +			dma-names =3D "rx", "tx";
>> +			allwinner,codec-analog-controls =3D <&codec_analog>;
>> +			status =3D "disabled";
>> +		};
>> +
>> +		codec_analog: codec-analog@01c23000 {
>> +			compatible =3D "allwinner,sun8i-v3s-codec-analog";
>> +			reg =3D <0x01c23000 0x4>;
>
>This should be the whole size of the memory region.

OK. (Although on the datasheet digital part and analog
part is listed as one region.)

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
