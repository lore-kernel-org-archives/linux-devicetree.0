From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/20] clk: fixed-factor: Pass clk rates change to the
 parent
Date: Mon, 20 Jun 2016 10:54:58 +0200
Message-ID: <20160620085458.GI26668@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160617230533.27203.82622@quark.deferred.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2097931137=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160617230533.27203.82622@quark.deferred.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2097931137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h22Fi9ANawrtbNPX"
Content-Disposition: inline


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 04:05:33PM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2016-05-16 05:47:01)
> > A fixed factor clock, if it needs to change its rate, by definition do =
not
> > have any choice but to modify its parent rate.
>=20
> Logically it makes sense to always propagate the rate-change request up
> to the parent for a fixed-factor clock if we desire to change its rate.
> However, I wonder if doing this for all users of fixed-factor-clock in
> DT is safe? Some users may be counting on it not changing.
>=20
> There are 397 instances of fixed-factor-clock in .dts[i] today, so this
> change worries me a bit.

Understood.

>=20
> >=20
> > Add the CLK_SET_RATE_PARENT flag to that clock so that it can happen
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/clk-fixed-factor.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-fac=
tor.c
> > index 75cd6c792cb8..3363abd9b4ae 100644
> > --- a/drivers/clk/clk-fixed-factor.c
> > +++ b/drivers/clk/clk-fixed-factor.c
> > @@ -167,7 +167,8 @@ void __init of_fixed_factor_clk_setup(struct device=
_node *node)
> >         of_property_read_string(node, "clock-output-names", &clk_name);
> >         parent_name =3D of_clk_get_parent_name(node, 0);
> > =20
> > -       clk =3D clk_register_fixed_factor(NULL, clk_name, parent_name, =
0,
> > +       clk =3D clk_register_fixed_factor(NULL, clk_name, parent_name,
> > +                                       CLK_SET_RATE_PARENT,
>=20
> An alternative would be to pass in the flags you want, somehow. For the
> clock you are trying to fix, is it inside of the SoC or external? If it
> is internal, and part of a larger clock controller driver, is this for
> the legacy style allwinner clock drivers that put everything in DT?

It is :(

What we could do, is have an extra compatible for that clock (like
"allwinner,sun4i-a10-pll3-x2" in that case), and set the flag only for
that compatible.

Would that work for you?

> If not, it would better to initialize it statically and shove this
> flag into the struct clk_init_data storage.

Hopefully, yes, that should be addressed by the new framework, but I
need reviews to get it merged ;)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--h22Fi9ANawrtbNPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXZ69iAAoJEBx+YmzsjxAg2nIP/jqAmrV0fPnvXUghpO55krlt
rT4Ex4ie58emrWyyJXWfS84eOEbQl1y0GCdKfY3Q07cPMxgZFK4c64TfkGqhD53k
F0NcIDVVi4oHqkDwhBlO7V9ZQ9LALhFhH1CD2MY0mnkCEA/cFaGiY7z/jU03QQ19
3RYVysWPdocRB377+Yn+moTSKiMPNII0Gf3gUKitwSf5SCMegbKTbNJ8J2fcE6HF
3E57v+YDStzMXd1rMxlmyNUgqocgshO8sxTgwLIfxsF31WOs3DL6sc7jF5IRWEFY
K1+moF82uqX0oY6rOeSeIS7K4YwX6NG0ox5btGPLeGvdkR+SkYPvWsT3A1gyJ63x
I8Bu40aC8sQoJvpxnDqma/TAf4jMTBPYv65SvC/Cy5yIfaNM7eEGH3isYPw64F2L
aBbAKs8tpGRxbcfRH7t9V/582AXxpaaygJsNsnKJ2D4qocAvt8R9Fdd0/2Mu9ehT
wnvQb6mKSALL0I7Md+ue4Yka9877sJVOblExk5Rm8lDsH1+gm5zwGcU+Ckvc6N4H
xSrPL4+iAj1HbjT87Y3qKkokdFHEHn/Y8zM1KSTSclNVfF4XykfBbuEvVIOcEB96
8dwgoo8BmLSa99D6LyAoBUudBgby4rxeCIFy0OCBdSKybSlK/sJbQnOJt1wvXdYf
a49pZTIoW2IIDiw9TQSX
=FcfY
-----END PGP SIGNATURE-----

--h22Fi9ANawrtbNPX--

--===============2097931137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2097931137==--
