Return-Path: <SRS0=YfZA=US=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Date: Wed, 19 Jun 2019 14:15:42 +0000
Message-ID: 
 <TY1PR01MB1770E5A98A22F0902168F19DC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619124131.GB21753@pendragon.ideasonboard.com>
 <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190619140631.7jdbobstw7udgahy@verge.net.au>
In-Reply-To: <20190619140631.7jdbobstw7udgahy@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 19 June 2019 15:07
> Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI sup=
port
>=20
> On Wed, Jun 19, 2019 at 12:48:17PM +0000, Fabrizio Castro wrote:
> > Hi Laurent,
> >
> > > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owne=
r@vger.kernel.org> On Behalf Of Laurent Pinchart
> > > Sent: 19 June 2019 13:42
> > > Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI=
 support
> > >
> > > Hi Fabrizio,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Jun 18, 2019 at 04:18:39PM +0100, Fabrizio Castro wrote:
> > > > Add HDMI support to the HiHope RZ/G2[MN] mother board common
> > > > dtsi.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > ---
> > > > Please note that this patch was tested with a 4K monitor and cma=3D=
96M
> > > >
> > > >  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 62 ++++++++++++++=
++++++++++++
> > > >  1 file changed, 62 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/=
arm64/boot/dts/renesas/hihope-common.dtsi
> > > > index 625c3aa..e7568e1 100644
> > > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > @@ -17,6 +17,18 @@
> > > >  		stdout-path =3D "serial0:115200n8";
> > > >  	};
> > > >
> > > > +	hdmi0-out {
> > > > +		compatible =3D "hdmi-connector";
> > > > +		label =3D "HDMI0 OUT";
> > >
> > > Is the label physically present on the device (printed on the board o=
r
> > > the case) ?
> >
> > I am afraid it's not. Shall I send a v2? Or perhaps Simon could take it=
 out while applying?
>=20
> Thanks,
>=20
> I have removed the label attribute when queuing this patch up for v5.3.
> The result is as follows:

Great, thank you Simon!

Fab

>=20
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Date: Tue, 18 Jun 2019 16:18:39 +0100
> Subject: [PATCH] arm64: dts: renesas: hihope-common: Add HDMI support
>=20
> Add HDMI support to the HiHope RZ/G2[MN] mother board common
> dtsi.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 61 ++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/=
boot/dts/renesas/hihope-common.dtsi
> index 625c3aaead14..9f05e80cee10 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,17 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
>=20
> +	hdmi0-out {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi0_con: endpoint {
> +				remote-endpoint =3D <&rcar_dw_hdmi0_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -82,6 +93,30 @@
>  		states =3D <3300000 1
>  			  1800000 0>;
>  	};
> +
> +	x302_clk: x302-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <33000000>;
> +	};
> +
> +	x304_clk: x304-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +	};
> +};
> +
> +&du {
> +	clocks =3D <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names =3D "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +	status =3D "okay";
>  };
>=20
>  &ehci0 {
> @@ -109,11 +144,37 @@
>  	};
>  };
>=20
> +&hdmi0 {
> +	status =3D "okay";
> +
> +	ports {
> +		port@1 {
> +			reg =3D <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint =3D <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsusb {
>  	dr_mode =3D "otg";
>  	status =3D "okay";
>  };
>=20
> +&i2c4 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	versaclock5: clock-generator@6a {
> +		compatible =3D "idt,5p49v5923";
> +		reg =3D <0x6a>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&x304_clk>;
> +		clock-names =3D "xin";
> +	};
> +};
> +
>  &ohci0 {
>  	status =3D "okay";
>  };
> --
> 2.11.0
