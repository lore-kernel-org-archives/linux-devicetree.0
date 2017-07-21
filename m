From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: allwinner: a64: drop the dummy
 vcc3v3 regulator in Pine64 DT
Date: Fri, 21 Jul 2017 20:49:23 +0800
Message-ID: <7FACC99F-F900-437B-9642-741D7D980D25@aosc.io>
References: <20170719161019.62133-1-icenowy@aosc.io> <20170719161019.62133-3-icenowy@aosc.io> <4e2c9486-9c0d-14e9-62e7-8642758c5472@arm.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBYXQY7FQKGQE2RZEG7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4e2c9486-9c0d-14e9-62e7-8642758c5472-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: andre.przywara-5wv7dgnIgG8@public.gmane.orgAndre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B47=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:=
45:39, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On 19/07/17 17:10, Icenowy Zheng wrote:
>> The Pine64 DT used to contain a dummy vcc3v3 regulator, in order to
>> satisfy some device nodes when proper AXP803 regulator support is
>> available. It's in fact the DCDC1 regulator of AXP803.
>>=20
>> Drop the dummy regulator, and fix the reference of this regulator to
>> DCDC1.
>
>Do we really need to have this?
>While I see that this is technically correct, it breaks older kernels,
>which miss the AXP driver. So we can't use this DT for syncing it into
>U-Boot anymore, while still expecting various kernels (for instance
>from
>distribution installers) to work via UEFI (for which U-Boot provides
>the
>DT). That would be a shame, because we start to see generic arm64
>distribution installers to work out of the box.
>
>I see these solutions:
>1) We drop this patch, instead add a comment that technically it's
>DCDC1. I believe we can't really turn off DCDC1 anyway.
>2) We keep theses patches, but don't sync them to U-Boot to have a
>universal DT in there which works with every kernel.
>3) We keep these patches *and* sync them to U-Boot, but add the fixed
>regulator back in via a U-Boot specific .dtsi "overlay" snippet. This
>would take care of the parts that break compatibility. The end result
>would be similar to 2), then.
>
>The easiest and most maintainable would be 1), but I am OK with 3) as
>well, though I am not sure this won't get messy in the future and will
>work for every change that we make.
>
>What do you think?

4) Do nothing.

We only promise old DTs will run with newer kernel, but
we don't promise newer DTs to run with old kernel. And
U-Boot is intended to update less frequently than Linux.

When updateing U-Boot, please update kernel as well.

>
>Cheers,
>Andre.
>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> index ac31c9477b25..68a47d9b07d9 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> @@ -61,13 +61,6 @@
>>  	chosen {
>>  		stdout-path =3D "serial0:115200n8";
>>  	};
>> -
>> -	reg_vcc3v3: vcc3v3 {
>> -		compatible =3D "regulator-fixed";
>> -		regulator-name =3D "vcc3v3";
>> -		regulator-min-microvolt =3D <3300000>;
>> -		regulator-max-microvolt =3D <3300000>;
>> -	};
>>  };
>> =20
>>  &ehci0 {
>> @@ -108,7 +101,7 @@
>>  &mmc0 {
>>  	pinctrl-names =3D "default";
>>  	pinctrl-0 =3D <&mmc0_pins>;
>> -	vmmc-supply =3D <&reg_vcc3v3>;
>> +	vmmc-supply =3D <&reg_dcdc1>;
>>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
>>  	cd-inverted;
>>  	disable-wp;
>>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
