From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH v3 02/12] arm64: allwinner: a64: add NMI
 controller on A64
Date: Tue, 18 Apr 2017 18:56:43 +0800
Message-ID: <FB3B3C68-EB16-4352-B0B9-64857B1A6C03@aosc.io>
References: <20170417115747.7300-1-icenowy@aosc.io> <20170417115747.7300-3-icenowy@aosc.io> <20170418070016.qsng3qtk76bqxyc5@lukather>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB5HB27DQKGQE2Y7IYQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170418070016.qsng3qtk76bqxyc5@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B44=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:=
00:16, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Apr 17, 2017 at 07:57:37PM +0800, Icenowy Zheng wrote:
>> Allwinner A64 SoC features a NMI controller, which is usually
>connected
>> to the AXP PMIC.
>>=20
>> Add support for it.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>> Changes in v2:
>> - Added Chen-Yu's ACK.
>>=20
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index 05ec9fc5e81f..53c18ca372ea 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -403,6 +403,14 @@
>>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>>  		};
>> =20
>> +		nmi_intc: interrupt-controller@01f00c0c {
>> +			compatible =3D "allwinner,sun6i-a31-sc-nmi";
>> +			interrupt-controller;
>> +			#interrupt-cells =3D <2>;
>> +			reg =3D <0x01f00c0c 0x38>;
>
>The base address is not correct, and there's uncertainty on whether
>this is this particular controller or not. Did you even test this?

Tested by axp20x-pek.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
