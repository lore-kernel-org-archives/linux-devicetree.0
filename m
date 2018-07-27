From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3.1 10/10] arm64: dts: allwinner: a64:
 Enable HDMI output on A64 boards w/ HDMI
Date: Fri, 27 Jul 2018 23:42:08 +0800
Message-ID: <7e1dcd8796e417924072f14b2a50af73@aosc.io>
References: <20180726171257.6688-1-icenowy@aosc.io>
 <20180726171257.6688-11-icenowy@aosc.io>
 <20180727125615.ju23ecgm6y4rz7p5@flea>
 <8DF4600E-DFE4-47CD-B541-FFDD903A65FB@aosc.io>
 <20180727140032.go6f3dwzxrzfstzj@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBUP25TNAKGQEC35ZJLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180727140032.go6f3dwzxrzfstzj@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-07-27 22:00=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Fri, Jul 27, 2018 at 09:26:11PM +0800, Icenowy Zheng wrote:
>>=20
>>=20
>> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=888:56:15, Maxime Ripard=20
>> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>> >On Fri, Jul 27, 2018 at 01:12:57AM +0800, Icenowy Zheng wrote:
>> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> >b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> >> index 1b9b92e541d2..1b972bade9f6 100644
>> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> >> @@ -62,6 +62,21 @@
>> >>  	chosen {
>> >>  		stdout-path =3D "serial0:115200n8";
>> >>  	};
>> >> +
>> >> +	connector {
>> >> +		compatible =3D "hdmi-connector";
>> >> +		type =3D "a";
>> >> +
>> >> +		port {
>> >> +			hdmi_con_in: endpoint {
>> >> +				remote-endpoint =3D <&hdmi_out_con>;
>> >> +			};
>> >> +		};
>> >> +	};
>> >> +};
>> >> +
>> >> +&de {
>> >> +	status =3D "okay";
>> >>  };
>> >>
>> >>  &ehci0 {
>> >> @@ -82,6 +97,17 @@
>> >>
>> >>  };
>> >>
>> >> +&hdmi {
>> >> +	hdmi-supply =3D <&reg_dldo1>;
>> >> +	status =3D "okay";
>> >> +};
>> >> +
>> >> +&hdmi_out {
>> >> +	hdmi_out_con: endpoint {
>> >> +		remote-endpoint =3D <&hdmi_con_in>;
>> >> +	};
>> >> +};
>> >> +
>> >>  &i2c1 {
>> >>  	pinctrl-names =3D "default";
>> >>  	pinctrl-0 =3D <&i2c1_pins>;
>> >> @@ -99,6 +125,10 @@
>> >>  	};
>> >>  };
>> >>
>> >> +&mixer1 {
>> >> +	status =3D "okay";
>> >> +};
>> >> +
>> >>  &mmc0 {
>> >>  	pinctrl-names =3D "default";
>> >>  	pinctrl-0 =3D <&mmc0_pins>;
>> >> @@ -238,6 +268,10 @@
>> >>  	status =3D "disabled";
>> >>  };
>> >>
>> >> +&tcon1 {
>> >> +	status =3D "okay";
>> >> +};
>> >
>> >Is it working or not on the pine64?
>>=20
>> Not tested yet, as my main A64 device is Pine A64-LTS now.
>=20
> It was last reported as broken, so it's better to leave it out of that
> patch until someone figures it out.

Sorry, I did find a bug. Although after fixing it HDMI on Pine A64+
works fine.

Will fix the bug when sending v3.2 (resending after rc1).

>=20
> Thanks!
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
