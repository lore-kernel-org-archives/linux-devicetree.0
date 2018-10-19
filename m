From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 7/9] arm64: allwinner: a64: enable ANX6345
 bridge on Pinebook
Date: Fri, 19 Oct 2018 13:50:43 +0800
Message-ID: <5B167CD3-734F-4AE0-81F5-51749C9AD09C@aosc.io>
References: <20181018073327.64942-1-icenowy@aosc.io> <20181018073327.64942-8-icenowy@aosc.io> <10486569.ZhsSaQbvn5@anarsoul-thinkpad>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQPBUXPAKGQE6FEXC3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <10486569.ZhsSaQbvn5@anarsoul-thinkpad>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B410=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
1:17:35, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi Icenowy,
>
>On Thursday, October 18, 2018 12:33:25 AM PDT Icenowy Zheng wrote:
>> Pinebook has an ANX6345 bridge connected to the RGB666 LCD output,
>and
>> the I2C controlling signals are connected to R_I2C bus.
>>=20
>> Enable it in the device tree, and add a usable EDID from the panel's
>> datasheet (at least 14" Pinebook used a panel without EDID).
>
>There's no EDID in dts and 14" Pinebook uses a panel with EDID. Is it
>leftover=20
>of old comment?

Yes, it is.

>
>Regards,
>Vasily
>
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  .../dts/allwinner/sun50i-a64-pinebook.dts     | 43
>+++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts index
>> 77fac84797e9..d7c14d0d61f9 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
>> @@ -66,6 +66,10 @@
>>  	};
>>  };
>>=20
>> +&de {
>> +	status =3D "okay";
>> +};
>> +
>>  &ehci0 {
>>  	phys =3D <&usbphy 0>;
>>  	phy-names =3D "usb";
>> @@ -76,6 +80,10 @@
>>  	status =3D "okay";
>>  };
>>=20
>> +&mixer0 {
>> +	status =3D "okay";
>> +};
>> +
>>  &mmc0 {
>>  	pinctrl-names =3D "default";
>>  	pinctrl-0 =3D <&mmc0_pins>;
>> @@ -127,6 +135,27 @@
>>  	status =3D "okay";
>>  };
>>=20
>> +&r_i2c {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&r_i2c_pins_a>;
>> +	status =3D "okay";
>> +
>> +	anx6345: anx6345@38 {
>> +		compatible =3D "analogix,anx6345";
>> +		reg =3D <0x38>;
>> +		reset-gpios =3D <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
>> +		panel-supply =3D <&reg_dc1sw>;
>> +		dvdd25-supply =3D <&reg_dldo2>;
>> +		dvdd12-supply =3D <&reg_fldo1>;
>> +
>> +		port {
>> +			anx6345_in: endpoint {
>> +				remote-endpoint =3D <&tcon0_out_anx6345>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>  &r_rsb {
>>  	status =3D "okay";
>>=20
>> @@ -267,6 +296,20 @@
>>  	vcc-hdmi-supply =3D <&reg_dldo1>;
>>  };
>>=20
>> +&tcon0 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&lcd_rgb666_pins>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&tcon0_out {
>> +	tcon0_out_anx6345: endpoint@0 {
>> +		reg =3D <0>;
>> +		remote-endpoint =3D <&anx6345_in>;
>> +	};
>> +};
>> +
>>  &uart0 {
>>  	pinctrl-names =3D "default";
>>  	pinctrl-0 =3D <&uart0_pb_pins>;

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
