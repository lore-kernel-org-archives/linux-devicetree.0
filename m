From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Fri, 23 Oct 2015 21:20:13 +0200
Message-ID: <20151023212013.50bcbe4a@OPI2>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
	<1445444428-4652-2-git-send-email-jenskuske@gmail.com>
	<20151023181406.GK10947@lukather>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBB7UQVKYQKGQENGL7YLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151023181406.GK10947@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Oct 2015 20:14:06 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Wed, Oct 21, 2015 at 06:20:27PM +0200, Jens Kuske wrote:
> > +		bus_gates: clk@01c20060 {
> > +			#clock-cells =3D <1>;
> > +			compatible =3D "allwinner,sun8i-h3-bus-gates-clk";
> > +			reg =3D <0x01c20060 0x14>;
> > +			clock-indices =3D <5>, <6>, <8>,
> > +					<9>, <10>, <13>,
> > +					<14>, <17>, <18>,
> > +					<19>, <20>,
> > +					<21>, <23>,
> > +					<24>, <25>,
> > +					<26>, <27>,
> > +					<28>, <29>,
> > +					<30>, <31>, <32>,
> > +					<35>, <36>, <37>,
> > +					<40>, <41>, <43>,
> > +					<44>, <52>, <53>,
> > +					<54>, <64>,
> > +					<65>, <69>, <72>,
> > +					<76>, <77>, <78>,
> > +					<96>, <97>, <98>,
> > +					<112>, <113>,
> > +					<114>, <115>, <116>,
> > +					<128>, <135>;
> > +			clocks =3D <&ahb1>, <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb2>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb2>,
> > +				 <&ahb2>, <&ahb2>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&ahb1>, <&ahb1>,
> > +				 <&ahb1>, <&apb1>,
> > +				 <&apb1>, <&apb1>, <&apb1>,
> > +				 <&apb1>, <&apb1>, <&apb1>,
> > +				 <&apb2>, <&apb2>, <&apb2>,
> > +				 <&apb2>, <&apb2>,
> > +				 <&apb2>, <&apb2>, <&apb2>,
> > +				 <&ahb1>, <&ahb1>; =20
>=20
> This is not really what I had in mind...
>=20
> This IP has 2 parents, and only two parents. The mapping between the
> IPs should be done in the driver itself, not in the DT where it is
> very error prone and barely readable.
>=20
> And note that I never have expected you to use clk-simple-gates
> either. This is a complicated clock, unlike the other we've seen so
> far, it definitely deserves a driver of its own.

It seems that Allwinner puts the gate definitions anywhere in the array
of registers, so, I think that the H3 scheme will not be the last
complicated one, and if the parent clocks are in the code instead of in
the DT, we will have more and more code to develop.

An other way to describe the gates would be to add containers per parent
(with still a small patch in the clk-simple-gates):

	bus_gates: clk@01c20060 {
		#clock-cells =3D <1>;
		compatible =3D "allwinner,sun8i-h3-bus-gates-clk";
		reg =3D <0x01c20060 0x14>;
		ahb1_gates {
			clocks =3D <&ahb1>;
			clock-indices =3D <5>, <6>, <8>,
					<9>, <10>, <13>,
					<14>, <18>,
					<19>, <20>,
					...;
			};
			clock-output-names =3D "ahb1_ce", "ahb1_dma", "ahb1_mmc0",
				"ahb1_mmc1", "ahb1_mmc2", "ahb1_nand",
				"ahb1_sdram", "ahb1_ts",
				"ahb1_hstimer", "ahb1_spi0",
				...;
		};
		ahb2_gates {
			clocks =3D <&ahb2>;
			clock-indices =3D <17>, <29>,
					<30>, <31>, <32>,
					...;
			clock-output-names =3D "ahb2_gmac", "ahb2_ohic1",
					"ahb2_ohic2", "ahb2_ohic3", "ahb1_ve",
					...;
		};
		apb1_gates {
			...
		};
		apb2_gates {
			...
		};
	};

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
