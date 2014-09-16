From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: sunxi: Add post clk divider for
 factor clocks
Date: Tue, 16 Sep 2014 17:57:11 +0200
Message-ID: <20140916155711.GF2166@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-2-git-send-email-wens@csie.org>
 <54145822.4020607@elopez.com.ar>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MZf7D3rAEoQgPanC"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBA554GQAKGQERAXLYDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54145822.4020607-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emilio,

On Sat, Sep 13, 2014 at 11:43:46AM -0300, Emilio L=F3pez wrote:
> Hi,
>=20
> El 06/09/14 a las 07:47, Chen-Yu Tsai escibi=F3:
> >Some factor clocks, mostly PLLs, have an extra fixed divider just before
> >the clock output. Add an option to the factor clk driver config data to
> >specify this divider.
> >
> >Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >---
> >  drivers/clk/sunxi/clk-factors.c | 3 +++
> >  drivers/clk/sunxi/clk-factors.h | 1 +
> >  2 files changed, 4 insertions(+)
> >
> >diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-fac=
tors.c
> >index 2057c8a..435111d 100644
> >--- a/drivers/clk/sunxi/clk-factors.c
> >+++ b/drivers/clk/sunxi/clk-factors.c
> >@@ -64,6 +64,9 @@ static unsigned long clk_factors_recalc_rate(struct cl=
k_hw *hw,
> >  	/* Calculate the rate */
> >  	rate =3D (parent_rate * (n + config->n_start) * (k + 1) >> p) / (m + =
1);
> >
> >+	if (config->post_div)
> >+		rate /=3D config->post_div;
> >+
> >  	return rate;
> >  }
> >
> >diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-fac=
tors.h
> >index d2d0efa..ce70c65 100644
> >--- a/drivers/clk/sunxi/clk-factors.h
> >+++ b/drivers/clk/sunxi/clk-factors.h
> >@@ -16,6 +16,7 @@ struct clk_factors_config {
> >  	u8 pshift;
> >  	u8 pwidth;
> >  	u8 n_start;
> >+	u8 post_div;
> >  };
> >
> >  struct clk_factors {
> >
>=20
> For the record, I liked your solution on[1] more, as it's in line
> with what we're doing on the other sunxi platforms, instead of
> adding features in factors to cover for some cases. But it's your
> and Maxime's call, as I haven't written any of the sun6i code so
> far.

No, you still wrote most of the clock support, so your opinion is
always valuable (and valued).

Thing is, unlike what was done in the sun4i driver where there was a
"real" technical issue that was preventing us from using only
fixed-factor, we're not in such a case in sun6i (and later,
apparently).

PLL6 has only one output, which is then directly multiplied by
fixed-factors, without any (pre|post)-dividers for any of them.

That means that following what you did for the sun4i would just
register 3 "dumbs" fixed-factors, that we couldn't reference from DT,
or through a cryptic index (which is not even documented in our
bindings).

I'd be fine either way, I just prefer the solution that has less code
and is more explicit.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGF3XAAoJEBx+YmzsjxAgtTgP/Azy5GDv0XIJADawyYLh1cUR
Um6fa6+LqKfYeY48XKRpqvK6ltbKVC5HJpiIOE5/5TK1InHu0NTT5Ee16kFJXLDG
dzjmp4e3Z1hEo7Cgv7Hh+IOstLeyw2anozEnwylkRJja4aBXwUhO9RXDcOf5RUJK
lLFt36tftMUYQsSuJqi2R0BQ2dUGJ5o7Pz+hceG0knltHODjFAp0JvzeswF8ASnw
ctaOpnnU6HQmq6ykOg7mK22O7+zcMsKSMZrqFnp/mTj2P60FiWzMVQsrrCWuXzoP
EIKVw4wKiMXEHQqWDEJGK3t40OkJqVZ2+pMeJDcul4QxjY+W9uPpcOptG/3+Ih+R
9kqSpWpXkaNr0hYFkpvqMxQz6/qSaiAIa4ZfmdKzvblfJc+la7SwDpmDCC6AKaYL
+h+hST0Vvirhe72CoDZT8DMgUwOgy5qec3oLBt1r5FuTAWeaBjilDCALbrvw3etk
7mfbOkGWbqwtCSSitkRT9JJchYqExFub87ZJ3L2ksjHDRT5U1OvTIa5+KbhIqiCg
Fkr4BsSdq8FPfbz7P6vjJAvCFixqwaGhyxwQv0PcpNK3hNGQfHptan8rX3KEa0hO
Bd11D4SYJhKHndfkcIGVjh4w64Dh9i13mBx2y7XpNcc2HCUvfIZP7ec6tB8QOB+j
Q+UaAzIoAT6M11dNEvwA
=ZkT5
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--
