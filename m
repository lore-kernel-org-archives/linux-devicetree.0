From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] clk: sunxi-ng: Add A33 CCU support
Date: Mon, 5 Sep 2016 11:51:54 +0200
Message-ID: <20160905095153.GC6322@lukather>
References: <20160901141617.9777-1-maxime.ripard@free-electrons.com>
 <20160901141617.9777-5-maxime.ripard@free-electrons.com>
 <CAGb2v66z4KMbfOr2kcNXSSXzVqXQ1uZ9p_-uNyvb_7_ACdNCqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66z4KMbfOr2kcNXSSXzVqXQ1uZ9p_-uNyvb_7_ACdNCqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mylene Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Mon, Sep 05, 2016 at 02:34:21PM +0800, Chen-Yu Tsai wrote:
> > +static SUNXI_CCU_NKMP_WITH_GATE_LOCK(pll_cpux_clk, "pll-cpux",
> > +                                    "osc24M", 0x000,
> > +                                    8, 5,              /* N */
> > +                                    4, 2,              /* K */
> > +                                    0, 2,              /* M */
> > +                                    16, 2,             /* P */
>=20
> Manual says there's no divider for P =3D 0x3.
> You'll need a table here.

Hmmm, Indeed. Or rather, a max value. We discussed that in the past, I
guess it's time to introduce it.

> > +                                    BIT(31),           /* gate */
> > +                                    BIT(28),           /* lock */
> > +                                    0);
> > +
> > +/*
> > + * The Audio PLL is supposed to have 4 outputs: 3 fixed factors from
> > + * the base (2x, 4x and 8x), and one variable divider (the one true
> > + * pll audio).
> > + *
> > + * We don't have any need for the variable divider for now, so we just
> > + * hardcode it to match with the clock names
> > + */
> > +#define SUN8I_A33_PLL_AUDIO_REG        0x008
> > +
> > +static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_audio_base_clk, "pll-audio-base=
",
> > +                                  "osc24M", 0x008,
> > +                                  8, 7,                /* N */
> > +                                  0, 5,                /* M */
> > +                                  BIT(31),             /* gate */
> > +                                  BIT(28),             /* lock */
> > +                                  CLK_SET_RATE_UNGATE);
>=20
> Are you sure about this? I suspect CLK_SET_RATE_GATE (clk must be
> gated before set rate) is what you want, given the non-DVFS
> nature of the PLL. Same for the other PLLs.

Yes, I'm sure about it. The lock, on the A33 at least, this has to be
confirmed on other SoCs, won't work if the clock is gated.

So, every time we call clk_set_rate, we will hit the WARN_ON because
of the lock timeout unless the clock runs.

> > +static SUNXI_CCU_GATE(bus_mipi_dsi_clk,        "bus-mipi-dsi", "ahb1",
> > +                     0x060, BIT(1), 0);
>=20
> Nit: we know which bus these peripherals are on.
> Can we be more explicit with the names?

I wanted to be consistent with the datasheet, and would really prefer
to stick to it.

> > +static SUNXI_CCU_GATE(bus_ce_clk,      "bus-ce",       "ahb1",
> > +                     0x060, BIT(5), 0);
>=20
> Nit: manual says Security System.
>=20
> (Maybe I should change the name on sun6i to say Crypto Engine
>  if that's what we're going with?)

But I can't really use reject that argument there then :)

The rationale was that it's called CE in the H3 which was already
merged, but I'll change it.

> [...]
>=20
> > +static SUNXI_CCU_GATE(usb_hsic_12M_clk,        "usb-hsic-12M", "osc24M=
",
> > +                     0x0cc, BIT(11), 0);
>=20
> A TODO note saying we should have a fixed-factor-gate for this
> would be nice.

Hmmm? I'm not sure what you're saying.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzUA5AAoJEBx+YmzsjxAgJEMP/1RrjhvyAQDC5+CDz1N4XhW5
Duquk9tpWRdIjtnfQapBRECt+d/hrxShFkpYpUYBQFVsXRPO7DI9tc5zd5RDex6C
c59GqTegiDd8nTJDYtAZ5A4di3E/5IFtWyw4navVL5ZgA9S1AHJTrFmO/4arPpqP
jqkUTDnXzDlnDlRu/BKd3mnwLiBHAUdU8s6VFWMLc9vDbWx8H8WKzNATjgx0yLPr
WzO//In5UPQv3ol7uAwZUavybpNPsKsJ7FXjNIelXFkDAz4OBlekX2UlpfzFVZol
WZG3PJo/iOc7jYxjB4v3YY02gXlhn7TaAKYdXt8AW7VV/L85slzKv2EOJCRh1CEo
HiYlMwVlzj41AqPau2hHzHoKZbP3hX0az+PlNx2v2wiGRenlKasnzXLksLzwoWXo
iJ/1uTOYn7+TS3KjFgl+JGgVYNJdZalYI3x54j6SAykJJihQ5c4owWTwojSBPryN
Vlc9j/JgDJWM11Pb1uihbDKZKjkm1sODZwA3U1Jmg9Adh1maoSm7/4Utz4MuMU0Y
lI0i0P++zAqUUh0xV00TobAgXuY5FZDXHmNBY9+etr/MLHNAATLZhh4ECDPRXOhW
igUv+FnlnfzxCWAp9+NKIZKqXV2QDGhjgtwf+aeuPyy6TGcyXw3Vq2MM1Bh7awkV
DPTaPHEOS3l2nU53aodl
=kNIz
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
