From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: sunxi: Add post clk divider for
 factor clocks
Date: Sat, 27 Sep 2014 09:07:08 +0200
Message-ID: <20140927070708.GY15315@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-2-git-send-email-wens@csie.org>
 <54145822.4020607@elopez.com.ar>
 <20140916155711.GF2166@lukather>
 <CAGb2v64o-7La6Sd_WVDrPQC0DUTqXZPZoG7u=OpXb+xRB1tcog@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o+N5O4bNGxsQWEyZ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBGWGTGQQKGQEJ4HVVJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64o-7La6Sd_WVDrPQC0DUTqXZPZoG7u=OpXb+xRB1tcog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--o+N5O4bNGxsQWEyZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 11:35:58PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime, Emilio,
>=20
> On Tue, Sep 16, 2014 at 11:57 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Emilio,
> >
> > On Sat, Sep 13, 2014 at 11:43:46AM -0300, Emilio L=F3pez wrote:
> >> Hi,
> >>
> >> El 06/09/14 a las 07:47, Chen-Yu Tsai escibi=F3:
> >> >Some factor clocks, mostly PLLs, have an extra fixed divider just bef=
ore
> >> >the clock output. Add an option to the factor clk driver config data =
to
> >> >specify this divider.
> >> >
> >> >Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> >---
> >> >  drivers/clk/sunxi/clk-factors.c | 3 +++
> >> >  drivers/clk/sunxi/clk-factors.h | 1 +
> >> >  2 files changed, 4 insertions(+)
> >> >
> >> >diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-=
factors.c
> >> >index 2057c8a..435111d 100644
> >> >--- a/drivers/clk/sunxi/clk-factors.c
> >> >+++ b/drivers/clk/sunxi/clk-factors.c
> >> >@@ -64,6 +64,9 @@ static unsigned long clk_factors_recalc_rate(struct=
 clk_hw *hw,
> >> >     /* Calculate the rate */
> >> >     rate =3D (parent_rate * (n + config->n_start) * (k + 1) >> p) / =
(m + 1);
> >> >
> >> >+    if (config->post_div)
> >> >+            rate /=3D config->post_div;
> >> >+
> >> >     return rate;
> >> >  }
> >> >
> >> >diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-=
factors.h
> >> >index d2d0efa..ce70c65 100644
> >> >--- a/drivers/clk/sunxi/clk-factors.h
> >> >+++ b/drivers/clk/sunxi/clk-factors.h
> >> >@@ -16,6 +16,7 @@ struct clk_factors_config {
> >> >     u8 pshift;
> >> >     u8 pwidth;
> >> >     u8 n_start;
> >> >+    u8 post_div;
> >> >  };
> >> >
> >> >  struct clk_factors {
> >> >
> >>
> >> For the record, I liked your solution on[1] more, as it's in line
> >> with what we're doing on the other sunxi platforms, instead of
> >> adding features in factors to cover for some cases. But it's your
> >> and Maxime's call, as I haven't written any of the sun6i code so
> >> far.
> >
> > No, you still wrote most of the clock support, so your opinion is
> > always valuable (and valued).
> >
> > Thing is, unlike what was done in the sun4i driver where there was a
> > "real" technical issue that was preventing us from using only
> > fixed-factor, we're not in such a case in sun6i (and later,
> > apparently).
> >
> > PLL6 has only one output, which is then directly multiplied by
> > fixed-factors, without any (pre|post)-dividers for any of them.
> >
> > That means that following what you did for the sun4i would just
> > register 3 "dumbs" fixed-factors, that we couldn't reference from DT,
> > or through a cryptic index (which is not even documented in our
> > bindings).
> >
> > I'd be fine either way, I just prefer the solution that has less code
> > and is more explicit.
>=20
> What's the verdict on this series?

If Emilio prefers to have a single clock node, fine. But please update
the DT bindings documentation.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--o+N5O4bNGxsQWEyZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJmIcAAoJEBx+YmzsjxAgDjkP/AmH1TWbHbHV4MUF0QNAhNk6
vxAxizt5C0OYeZk/ZO+bLCBXgVfG+t9cx+Mj2wyscvhezKYB8KAD3O6cYC1YY8ZY
BxOMwCSqIiRoXPd14DE9df0pQZxR73e51s9/3ew83rQ8Gv5Knb+iDKszb9E3ES/S
2Kfz+4ncEKpmmi38sAEmDiarDb0fENs82nswqccxWGLF84VionqNUTxw4wLe0BwM
gJwp7MqaC8tHAy/+yMLFxisZK/JhgOmBlSEm0SZIFOeZIMtIq5WSnA5cvv5GWx2C
ptBAYLoJKb4EbV5FBFZNNNj3lI06BqMQVlOzUD8lZTiY1gfgIOVESC2oi2MX5GDT
Hz5vdNP51Hv+eCFrK0dBZE1ObBqsvTGH5wr34qg/UPY4WGyfxyAHAVwvuwOtPmOK
1w8sEu+T58vjhZJBTbGNDSfxeazmu47Piz9+Zzq5vBecf4p4re6MiN67t3J7Px3n
B3ZGiFrao4LE2b5Ob6vqKMEGiW7ZYSawgsT24VEJ9UE9+5pMGs8gh47kaGLP7td8
KOTHbc9dI3SsoTCsqE4h0Mc834vhrrIYglewKXDQN4Qkd9g5geJyfMSrYfM5lYyF
mvwYBNjh1lGVBqcyKofqnDKHAPU2Qglehh1Sw1tcfqZcaS9KeHh+b7mxl5FwEQNW
KgbNy2cRSyBRyv4vls75
=dnRg
-----END PGP SIGNATURE-----

--o+N5O4bNGxsQWEyZ--
