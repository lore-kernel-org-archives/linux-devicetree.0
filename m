From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 04/20] clk: sunxi: display: Add per-clock flags
Date: Fri, 10 Jun 2016 11:50:31 +0200
Message-ID: <20160610095031.GT5242@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-5-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66-GzV=1wrJnHBObLVPVHPk87o0PaJtNyYasp2wFsZabw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wlbg71WMOPzcvmIn"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66-GzV=1wrJnHBObLVPVHPk87o0PaJtNyYasp2wFsZabw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--Wlbg71WMOPzcvmIn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2016 at 11:21:41PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The TCON channel 0 clock that is the parent clock of our pixel clock is
> > expected to change its rate depending on the resolution we want to outp=
ut
> > in our display engine.
> >
> > However, since it's only a mux, the only way it can do that is by chang=
ing
> > its parents rate.
> >
> > Allow to give flags in our display clocks description, and add the
> > CLK_SET_RATE_PARENT flag for the TCON channel 0 flag.
> >
> > Fixes: a3b4956ee6d9 ("clk: sunxi: display: Add per-clock flags")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/clk-sun4i-display.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/=
clk-sun4i-display.c
> > index 445a7498d6df..9780fac6d029 100644
> > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > @@ -33,6 +33,8 @@ struct sun4i_a10_display_clk_data {
> >
> >         u8      width_div;
> >         u8      width_mux;
> > +
>=20
> Don't really need this separator, but I'm ok either way.
>=20
> > +       u32     flags;
> >  };
> >
> >  struct reset_data {
> > @@ -166,7 +168,7 @@ static void __init sun4i_a10_display_init(struct de=
vice_node *node,
> >                                      data->has_div ? &div->hw : NULL,
> >                                      data->has_div ? &clk_divider_ops :=
 NULL,
> >                                      &gate->hw, &clk_gate_ops,
> > -                                    0);
> > +                                    data->flags);
> >         if (IS_ERR(clk)) {
> >                 pr_err("%s: Couldn't register the clock\n", clk_name);
> >                 goto free_div;
> > @@ -232,6 +234,7 @@ static const struct sun4i_a10_display_clk_data sun4=
i_a10_tcon_ch0_data __initcon
> >         .offset_rst     =3D 29,
> >         .offset_mux     =3D 24,
> >         .width_mux      =3D 2,
> > +       .flags          =3D CLK_SET_RATE_PARENT,
> >  };
> >
> >  static void __init sun4i_a10_tcon_ch0_setup(struct device_node *node)
> > --
> > 2.8.2
> >
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied,

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Wlbg71WMOPzcvmIn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWo1nAAoJEBx+YmzsjxAgl/oQAIvxRhLSQW10AvucyHjV2Kjx
Ta3aw8e3Muy/AFR5cpEXa7s3VxemymQTL9/UKp8hutBMG9znmiQTxT00+ySyA/PV
8OVxDr5IsNZrZc+U5fgOQtcwqDwkTFYfQKFp2PzRt925xEFluBwn70UvN287rj2D
mpuLccd4UmLBDtuQykwoZPYRTtw1PfqaaBmEfggxrnmo6BGUKLbu2Bx9kXXHPK0t
m619vzodQlx6NrO9IqY3dbbNUhDLDd1fhY0n+UJMxgwAki4RNqmFbHsZQaO5cCEI
ltetA1rVCtJz/cJk1NXTK5i0IV9rTzpwvVirDl6Cs2jNmYTpypbIcclxl9CnOWFA
qw8LoyGPcaOqVnl/31MP5rZYHkfV/3bAVAAUREZBTIQnouFSN7rBPL++HMjb+aBG
SzlXfPGZOWDeycekig1mJ1XBSYUhaBykCyhMQk+fKDp3h9/A4JlDwHHJeRvyh9ij
kKy6r5erBivvXg1/L7xJuyrC4PrOcPvW9lS3xkCVqN6ZCBTMm9TA0rx8LUfjQcX2
sD878ChmlR5nQOAS4HioqCUyHBZ168rIP87yt81hSBBKa9VJ0GgBdg/ocoshhI0X
YR6yeiki2Mhk3E4ZLlGghiWj1J9H3PVe+/QcSMPuidtF0ePYQnzyp4jlmKCsf+nw
h9bO6JNRltZ3g6nDxdWa
=889b
-----END PGP SIGNATURE-----

--Wlbg71WMOPzcvmIn--
