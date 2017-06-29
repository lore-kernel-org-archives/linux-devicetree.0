From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/6] clk: sunxi-ng: div: Add support for fixed
 post-divider
Date: Thu, 29 Jun 2017 09:33:56 +0200
Message-ID: <20170629073356.nljcjiqw35t3y4t2@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <bc043a64775ec8c9cfcfe6d638e348d38e34eba3.1498422562.git-series.plaes@plaes.org>
 <20170627094607.2hkgzkycclboemvu@flea.lan>
 <20170628175949.GA3706@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nqbci5n5l3p2o5o3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170628175949.GA3706-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nqbci5n5l3p2o5o3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2017 at 05:59:49PM +0000, Priit Laes wrote:
> On Tue, Jun 27, 2017 at 11:46:07AM +0200, Maxime Ripard wrote:
> > Hi!
> >=20
> > On Sun, Jun 25, 2017 at 11:45:42PM +0300, Priit Laes wrote:
> > > SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> > > 6 is fixed post-divider.
> > >=20
> > > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu_div.c | 12 ++++++++++--
> > >  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
> > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/cc=
u_div.c
> > > index c0e5c10..de30e15 100644
> > > --- a/drivers/clk/sunxi-ng/ccu_div.c
> > > +++ b/drivers/clk/sunxi-ng/ccu_div.c
> > > @@ -62,8 +62,13 @@ static unsigned long ccu_div_recalc_rate(struct cl=
k_hw *hw,
> > >  	parent_rate =3D ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, =
-1,
> > >  						  parent_rate);
> > > =20
> > > -	return divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> > > -				   cd->div.flags);
> > > +	val =3D divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> > > +				  cd->div.flags);
> > > +
> > > +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > > +		val /=3D cd->fixed_post_div;
> > > +
> > > +	return val;
> > >  }
> > > =20
> > >  static int ccu_div_determine_rate(struct clk_hw *hw,
> > > @@ -89,6 +94,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> > >  	val =3D divider_get_val(rate, parent_rate, cd->div.table, cd->div.w=
idth,
> > >  			      cd->div.flags);
> > > =20
> > > +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > > +		val *=3D cd->fixed_post_div;
> > > +
> > >  	spin_lock_irqsave(cd->common.lock, flags);
> > > =20
> > >  	reg =3D readl(cd->common.base + cd->common.reg);
> >=20
> > You also need to adjust the round rate call back to take into account
> > the post divider before calling divider_round_rate_parent, and after
> > since that function can modify the parent_rate.
>=20
> Is there a way to trigger this function? I don't see it getting called.

yep, clk_round_rate will call it, and it's also in the code path of
clk_set_rate.

> > > diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/cc=
u_div.h
> > > index 08d0744..f3a5028 100644
> > > --- a/drivers/clk/sunxi-ng/ccu_div.h
> > > +++ b/drivers/clk/sunxi-ng/ccu_div.h
> > > @@ -86,9 +86,10 @@ struct ccu_div_internal {
> > >  struct ccu_div {
> > >  	u32			enable;
> > > =20
> > > -	struct ccu_div_internal		div;
> > > +	struct ccu_div_internal	div;
> >=20
> > Spurious change?
>=20
> Nope, it was not indented the same way as other variables.
> Should I send it as separate patch?

Hmmm, not really, leave it there.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nqbci5n5l3p2o5o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVK1jAAoJEBx+YmzsjxAgQIYQAJsZzktFeszC/CvccgGGrinw
JheQuR8k3thxYUYaaO6IAwE34TV7N8XxJjLDguFf9Jma2v5mjnJwYmiX6rpnR0Nw
pLupe3PeT2vaEo+PXL9iovSpSF1Rba16dBPNeyblcsfWcLGmbzD1BjQ4NWOkddf/
HODLKSojzWDm8Js95Vr+8BL6gyRg35t9qZkjJkRyWWEBKKFNTJds6doxyj/FA+iV
RXEBAkOAqkvteLaWTQEcLVrerD7r2naIKJZLyoBMEHhpFvoGrtJyzKAVcFjIynpx
yzrySAWVsuW1DzsxDYsHMtPD3Mbx+BK5DHD+SE6wLiOHXXJWu4yUNzIby/nH6fVY
PRzdgYNjjleuDikgHgeQMroUcS0viiMJ5TOMtscHX7eWZ00qlnCOSFsE4VeVdMaW
s/XEkWdYBbGV9GFMxdoEt6wPX/2YvmsDGDPmYpjqtXZ/fXOkBiGD6fZglGZvR3Ap
/Iz7xjqKLnfifcJJnjaCOjS8Aa2KvG1Q9PnMbyaztieAFfSXuxn1gtZxuOa4+QzT
+MQCoa7bvIqBk0KkbTg1BmYFwfhxrnJR6c68HFX8FNUPiZgolJ1L7QIO49Mcetjz
LN/XIq6lVG2gvI++RshUAJCRxOCct4zwDKw58PEkGrMOmrh3BHOwjBy5luWssYud
fNNzbw6NaxmvdSZyAdbV
=PHMU
-----END PGP SIGNATURE-----

--nqbci5n5l3p2o5o3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
