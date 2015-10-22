From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Thu, 22 Oct 2015 10:29:59 +0200
Message-ID: <20151022102959.09f0a1f4@OPI2>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
	<1445444428-4652-2-git-send-email-jenskuske@gmail.com>
	<20151022080508.GN10947@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151022080508.GN10947@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Oct 2015 10:05:08 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> > +		uart0: serial@01c28000 {
> > +			compatible =3D "snps,dw-apb-uart";
> > +			reg =3D <0x01c28000 0x400>;
> > +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&bus_gates 112>;
> > +			resets =3D <&bus_rst 208>; =20
>=20
> It's a bit weird that the clocks and reset indices don't match,
> usually they do.
>=20
> What's even weirder is that there's a 96 offset between the two (4 *
> 32), is this expected?

Yes, this is conform to the H3 documentation.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
