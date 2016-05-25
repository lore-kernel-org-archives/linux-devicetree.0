From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 09/20] drm/sun4i: defer only if we didn't find our panel
Date: Wed, 25 May 2016 14:09:15 +0200
Message-ID: <20160525120915.GC9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-10-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v655q_w8s7Eg8xnpzdX9PDxSEhRLvMu3bNOd==U4APgg0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366245762=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v655q_w8s7Eg8xnpzdX9PDxSEhRLvMu3bNOd==U4APgg0Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1366245762==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:52:10AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Our code currently defers our probe on any error, even if we were not
> > expecting to have one at all.
> >
> > Make sure we return -EPROBE_DEFER only when we were supposed to have a
> > panel, but it's not probed yet.
> >
> > Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 9f19b0e08560..eed6a9e8d9a6 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -429,7 +429,7 @@ static struct drm_panel *sun4i_tcon_find_panel(stru=
ct device_node *node)
> >                 return ERR_PTR(-EINVAL);
> >         }
> >
> > -       return of_drm_find_panel(remote);
> > +       return of_drm_find_panel(remote) ?: ERR_PTR(-EPROBE_DEFER);
>=20
> There's also a typo in the DRM_DEBUG_DRIVER call a few lines up. Could you
> fix it as well?

Done, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZXrAAoJEBx+YmzsjxAgloAQAIt+i2L07f/JUiJt6bEDclgE
XUw6WAClT2l13qxQe5XXzKwGYFdZruHB+oQcWpgGxaa5YIIC3Jv6fuQHJ6Ow0rLO
cA4Us8VQb4vbCrZI9jGNqdShL33ePGHHQPyyGhFx93Mg7/BqB4EGjmjGqoKkUbsV
mklhkSVDr2phVuCEqzKI10upsB+atEOCI2S4Mhc3TWRFHpjPeNzO8LVvgnL+WO2C
x2ht5PcvTZw/iLrW3zcGaaL0gXPatuZ+FJrPkfrivJz8OBxKkiI6nMpA5JXHGVRP
AyhH1jTPyoSL11n8YCw4aBKJIbSP4+dxWtCKNok6G9LrV64t12l3dq5nQ+Uxf6N7
BpJ2I/wrmmPZLlUfd4RzHSbq77qfTylWuU/3O2j/k4YMAz1IxlJ7HFDmQWm+TUXM
xdzcWxGT+F4+1GerKKRN6qlib5VFclCZK9JI4tVWus3/P0BgkBhjivVBBkgEff2u
D3lGiPySHDelf2swBQiTZHpxKIym7LN3GBTyqNSIbhwavlYFqcv1dZ+IYihGYJa8
Abj4yTvuX9hqvci5XrY/Flob767h9EOIYKyqB6+iM1S052YXUI4+sq/fbnwXbzos
Z6bdxsDS6CFUAIkZZJE3mOiYLU1TwfsLibLBpU/d6Uw6lj3DV579e9skjQTUrT5H
cVCu8eqpwgTdj7ac97OR
=mmB1
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

--===============1366245762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1366245762==--
