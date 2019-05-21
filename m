From: luca@z3ntu.xyz
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Tue, 21 May 2019 08:43:45 +0200
Message-ID: <9B2B83DF-2C91-4DDA-B707-664A792A8BCF@z3ntu.xyz>
References: <20190518170929.24789-1-luca@z3ntu.xyz> <20190520110742.ykgxwaabzzwovgpl@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520110742.ykgxwaabzzwovgpl@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On May 20, 2019 1:07:42 PM GMT+02:00, Maxime Ripard <maxime=2Eripard@bootli=
n=2Ecom> wrote:
>Hi!
>
>On Sat, May 18, 2019 at 07:09:30PM +0200, Luca Weiss wrote:
>> Add a node describing the KEYADC on the A64=2E
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu=2Exyz>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64=2Edtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64=2Edtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-a64=2Edtsi
>> index 7734f70e1057=2E=2Edc1bf8c1afb5 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64=2Edtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64=2Edtsi
>> @@ -704,6 +704,13 @@
>>  			status =3D "disabled";
>>  		};
>>
>> +		lradc: lradc@1c21800 {
>> +			compatible =3D "allwinner,sun4i-a10-lradc-keys";
>> +			reg =3D <0x01c21800 0x100>;
>> +			interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +			status =3D "disabled";
>> +		};
>> +
>
>The controller is pretty different on the A64 compared to the A10=2E The
>A10 has two channels for example, while the A64 has only one=2E
>
>It looks like the one in the A83t though, so you can use that
>compatible instead=2E
>
>Maxime
>
>--
>Maxime Ripard, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin=2Ecom

Hi,
Looking at the patch for the A83t, the only difference is that it uses a 3=
/4 instead of a 2/3 voltage divider, nothing is changed with the channels=
=2E But I'm also not sure which one (or a different one) is used from looki=
ng at the "A64 User Manual"=2E

Thanks, Luca
