From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v3.1 10/10] arm64: dts: allwinner: a64:
 Enable HDMI output on A64 boards w/ HDMI
Date: Fri, 27 Jul 2018 17:44:59 +0200
Message-ID: <2190272.845Jehz4jH@jernej-laptop>
References: <20180726171257.6688-1-icenowy@aosc.io> <20180727140032.go6f3dwzxrzfstzj@flea> <7e1dcd8796e417924072f14b2a50af73@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBAH45TNAKGQE3IFCMZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <7e1dcd8796e417924072f14b2a50af73-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne petek, 27. julij 2018 ob 17:42:08 CEST je Icenowy Zheng napisal(a):
> =E5=9C=A8 2018-07-27 22:00=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
>=20
> > On Fri, Jul 27, 2018 at 09:26:11PM +0800, Icenowy Zheng wrote:
> >> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=888:56:15, Maxime Ripard
> >>=20
> >> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> >> >On Fri, Jul 27, 2018 at 01:12:57AM +0800, Icenowy Zheng wrote:
> >> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> >
> >> >b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> >
> >> >> index 1b9b92e541d2..1b972bade9f6 100644
> >> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> >> @@ -62,6 +62,21 @@
> >> >>=20
> >> >>  	chosen {
> >> >>  =09
> >> >>  		stdout-path =3D "serial0:115200n8";
> >> >>  =09
> >> >>  	};
> >> >>=20
> >> >> +
> >> >> +	connector {
> >> >> +		compatible =3D "hdmi-connector";
> >> >> +		type =3D "a";
> >> >> +
> >> >> +		port {
> >> >> +			hdmi_con_in: endpoint {
> >> >> +				remote-endpoint =3D <&hdmi_out_con>;
> >> >> +			};
> >> >> +		};
> >> >> +	};
> >> >> +};
> >> >> +
> >> >> +&de {
> >> >> +	status =3D "okay";
> >> >>=20
> >> >>  };
> >> >> =20
> >> >>  &ehci0 {
> >> >>=20
> >> >> @@ -82,6 +97,17 @@
> >> >>=20
> >> >>  };
> >> >>=20
> >> >> +&hdmi {
> >> >> +	hdmi-supply =3D <&reg_dldo1>;
> >> >> +	status =3D "okay";
> >> >> +};
> >> >> +
> >> >> +&hdmi_out {
> >> >> +	hdmi_out_con: endpoint {
> >> >> +		remote-endpoint =3D <&hdmi_con_in>;
> >> >> +	};
> >> >> +};
> >> >> +
> >> >>=20
> >> >>  &i2c1 {
> >> >> =20
> >> >>  	pinctrl-names =3D "default";
> >> >>  	pinctrl-0 =3D <&i2c1_pins>;
> >> >>=20
> >> >> @@ -99,6 +125,10 @@
> >> >>=20
> >> >>  	};
> >> >> =20
> >> >>  };
> >> >>=20
> >> >> +&mixer1 {
> >> >> +	status =3D "okay";
> >> >> +};
> >> >> +
> >> >>=20
> >> >>  &mmc0 {
> >> >> =20
> >> >>  	pinctrl-names =3D "default";
> >> >>  	pinctrl-0 =3D <&mmc0_pins>;
> >> >>=20
> >> >> @@ -238,6 +268,10 @@
> >> >>=20
> >> >>  	status =3D "disabled";
> >> >> =20
> >> >>  };
> >> >>=20
> >> >> +&tcon1 {
> >> >> +	status =3D "okay";
> >> >> +};
> >> >
> >> >Is it working or not on the pine64?
> >>=20
> >> Not tested yet, as my main A64 device is Pine A64-LTS now.
> >=20
> > It was last reported as broken, so it's better to leave it out of that
> > patch until someone figures it out.
>=20
> Sorry, I did find a bug. Although after fixing it HDMI on Pine A64+
> works fine.
>=20
> Will fix the bug when sending v3.2 (resending after rc1).

Why don't you simply send v4, with all patches and changelogs? It would be=
=20
easier to comprehend.

Best regards,
Jernej

>=20
> > Thanks!
> > Maxime




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
