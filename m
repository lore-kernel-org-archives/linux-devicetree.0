From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] drm/vc4: Support the case where the DSI device is
 disabled
Date: Fri, 4 May 2018 15:29:15 +0200
Message-ID: <20180504132915.GX13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-6-boris.brezillon@bootlin.com>
 <20180504102833.GJ13459@ulmo> <20180504140525.152d8d8e@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271287133=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504140525.152d8d8e@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1271287133==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KC+fneiph5CALyUl"
Content-Disposition: inline


--KC+fneiph5CALyUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:05:25PM +0200, Boris Brezillon wrote:
> On Fri, 4 May 2018 12:28:33 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Thu, May 03, 2018 at 06:40:08PM +0200, Boris Brezillon wrote:
> > > Having a device with a status property !=3D "okay" in the DT is a val=
id
> > > use case, and we should not prevent the registration of the DRM device
> > > when the DSI device connected to the DSI controller is disabled.
> > >=20
> > > Consider the ENODEV return code as a valid result and do not expose t=
he
> > > DSI encoder/connector when it happens.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_dsi.c | 15 +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_=
dsi.c
> > > index 8aa897835118..db2f137f8b7b 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > > @@ -1606,8 +1606,18 @@ static int vc4_dsi_bind(struct device *dev, st=
ruct device *master, void *data)
> > > =20
> > >  	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> > >  					  &panel, &dsi->bridge);
> > > -	if (ret)
> > > +	if (ret) {
> > > +		/* If the bridge or panel pointed by dev->of_node is not
> > > +		 * enabled, just return 0 here so that we don't prevent the DRM
> > > +		 * dev from being registered. Of course that means the DSI
> > > +		 * encoder won't be exposed, but that's not a problem since
> > > +		 * nothing is connected to it.
> > > +		 */
> > > +		if (ret =3D=3D -ENODEV)
> > > +			return 0;
> > > +
> > >  		return ret;
> > > +	}
> > > =20
> > >  	if (panel) {
> > >  		dsi->bridge =3D devm_drm_panel_bridge_add(dev, panel,
> > > @@ -1652,7 +1662,8 @@ static void vc4_dsi_unbind(struct device *dev, =
struct device *master,
> > >  	struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> > >  	struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
> > > =20
> > > -	pm_runtime_disable(dev);
> > > +	if (dsi->bridge)
> > > +		pm_runtime_disable(dev); =20
> >=20
> > Is this safe? This uses component/master, so dsi->bridge is going to
> > remain valid until the driver's ->remove() is called. So technically you
> > could have a situation where drm_of_find_panel_or_bridge() returned some
> > error code that remains stored in dsi->bridge and cause the above
> > condition to be incorrectly true.
>=20
> No, because of_drm_find_bridge() (which is called from
> drm_of_find_panel_or_bridge() returns either NULL or a valid bridge
> pointer), so dsi->bridge either points to a valid bridge object or is
> NULL. Am I missing something?

The return value of devm_drm_panel_bridge_add() is also assigned to
dsi->bridge later on (in the "if (panel)" conditional).

Thierry

--KC+fneiph5CALyUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsYCgACgkQ3SOs138+
s6EWuA//S65DsiWZFL3if4C4sOBJFWqU4ygqvzCsIaTi9aMnAeUJVYCE4+VGL9oy
Ek5RPgR8kcS0e4UVDyFDwiwqMG7ABnhg2Zj8Z84rg+c8+A9BhufND5+77fVchK1H
u7nEegcHCs5Aovp7kvoiv5uuJoyU+KiCQVHMq5B85s6Mkv4vZSsrIXkpyo04UI2p
SYp/AUdv4GVZlMdRlFmKDUx0QPxl4BxZ0rySPKK/SlQRNWCpGHBgrGaOZr4jQgH4
YLJvEFEI2BmQF++5PK0MUz1ptVXPrd1CWLZWRuK8NLq0O7ZARRcysEK8yQoupdg5
eMarE+zSr1d3eI9hXiPmwJtu+4s9JRzb/5tNXza2iAp7ylzufxMRvZDZS+dufP3c
0WLdJSGSjuQhvLlMr2xu38/YID/44MAMHeFwxfEmaGz9dZj7ajziJqPOZcyiFfe9
rhi6d8ydqls2Xqczb2DoCaki/MP/cmbki071ezrcwN+u95Q+lriAiYZg4SKYm8gn
avuNK+MShR8SUn3Obf+U6PUoKf+eUrz7FlIChBTYzSDdrb8jmB0TldD2O4KOeIt5
yogk1Zc926ZA3RJDH6ZxFOkIqi0PlgXNYExvdCqpugZWT+tW6kqcuNycvUZISOxM
z4ezXap0AA8PHlvKBfdk0M/EY7wz9WkdJ2OkKUPApf8C7kRK/pA=
=dNd4
-----END PGP SIGNATURE-----

--KC+fneiph5CALyUl--

--===============1271287133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1271287133==--
