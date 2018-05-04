From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] drm/vc4: Support the case where the DSI device is
 disabled
Date: Fri, 4 May 2018 15:56:51 +0200
Message-ID: <20180504135651.GY13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-6-boris.brezillon@bootlin.com>
 <20180504102833.GJ13459@ulmo> <20180504140525.152d8d8e@bbrezillon>
 <20180504132915.GX13459@ulmo> <20180504154906.2527d92b@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1227163806=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504154906.2527d92b@bbrezillon>
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


--===============1227163806==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1fZJyN7nFm/tosmV"
Content-Disposition: inline


--1fZJyN7nFm/tosmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 03:49:06PM +0200, Boris Brezillon wrote:
> On Fri, 4 May 2018 15:29:15 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Fri, May 04, 2018 at 02:05:25PM +0200, Boris Brezillon wrote:
> > > On Fri, 4 May 2018 12:28:33 +0200
> > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > >  =20
> > > > On Thu, May 03, 2018 at 06:40:08PM +0200, Boris Brezillon wrote: =
=20
> > > > > Having a device with a status property !=3D "okay" in the DT is a=
 valid
> > > > > use case, and we should not prevent the registration of the DRM d=
evice
> > > > > when the DSI device connected to the DSI controller is disabled.
> > > > >=20
> > > > > Consider the ENODEV return code as a valid result and do not expo=
se the
> > > > > DSI encoder/connector when it happens.
> > > > >=20
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vc4/vc4_dsi.c | 15 +++++++++++++--
> > > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/=
vc4_dsi.c
> > > > > index 8aa897835118..db2f137f8b7b 100644
> > > > > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > > > > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > > > > @@ -1606,8 +1606,18 @@ static int vc4_dsi_bind(struct device *dev=
, struct device *master, void *data)
> > > > > =20
> > > > >  	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> > > > >  					  &panel, &dsi->bridge);
> > > > > -	if (ret)
> > > > > +	if (ret) {
> > > > > +		/* If the bridge or panel pointed by dev->of_node is not
> > > > > +		 * enabled, just return 0 here so that we don't prevent the DRM
> > > > > +		 * dev from being registered. Of course that means the DSI
> > > > > +		 * encoder won't be exposed, but that's not a problem since
> > > > > +		 * nothing is connected to it.
> > > > > +		 */
> > > > > +		if (ret =3D=3D -ENODEV)
> > > > > +			return 0;
> > > > > +
> > > > >  		return ret;
> > > > > +	}
> > > > > =20
> > > > >  	if (panel) {
> > > > >  		dsi->bridge =3D devm_drm_panel_bridge_add(dev, panel,
> > > > > @@ -1652,7 +1662,8 @@ static void vc4_dsi_unbind(struct device *d=
ev, struct device *master,
> > > > >  	struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> > > > >  	struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
> > > > > =20
> > > > > -	pm_runtime_disable(dev);
> > > > > +	if (dsi->bridge)
> > > > > +		pm_runtime_disable(dev);   =20
> > > >=20
> > > > Is this safe? This uses component/master, so dsi->bridge is going to
> > > > remain valid until the driver's ->remove() is called. So technicall=
y you
> > > > could have a situation where drm_of_find_panel_or_bridge() returned=
 some
> > > > error code that remains stored in dsi->bridge and cause the above
> > > > condition to be incorrectly true. =20
> > >=20
> > > No, because of_drm_find_bridge() (which is called from
> > > drm_of_find_panel_or_bridge() returns either NULL or a valid bridge
> > > pointer), so dsi->bridge either points to a valid bridge object or is
> > > NULL. Am I missing something? =20
> >=20
> > The return value of devm_drm_panel_bridge_add() is also assigned to
> > dsi->bridge later on (in the "if (panel)" conditional).
>=20
> But then we return an error code if IS_ERR(dsi->bridge) [1], which
> should prevent the unbind function from being called, right?

Right, that should work. Seems safe, then.

Thierry

--1fZJyN7nFm/tosmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsZqAACgkQ3SOs138+
s6H9zBAAkdtw+P991CC3fRmrq6jFxLN6Bcz7BRbALmsIto18G9tVothhspIAYenl
4mpI3JRYlbdgkpTqsPikO9Xr2aOqGLQPF1PaK89fgrtuFLPn1NL0DX12+7IaCCWb
OuDeu7bdImgF0yFFPj8xqY+0zfJvI6FgnaD/qiE7eNqAAAppBRDy2KlMha+BDDmW
dPgiwV3R/R4Op3G5NaNyaMmMqo1gLEtocWN5LED2qfVqfCK+pMqVVf6VDNQdxPQM
vPDUuPi5ZL+CCr/+ZnrDqkd5bDJvmk7ar5q7/QEA+Y/sgAQ0SYv2s5mZ4tmvvAa1
Qw+lhAvXl70wZOUuN9LtGrMAgV8gipokQrqR6DSOUwoWUhio3qYzaD+F3NOVovfQ
cd7h4Eq8TCgyaza/AssRr5iSrt6A7D9QAXvsaoHsSrn2JdNOStIANZsGY39p/VPI
ZuE3/3W0NIZvqsJS3NKspZPl7z0eEHarqajd6v683tzWPRLiCEwkpD5Sn934bsg1
KaFNGAGjTSCBeqIl3YTEPczRaOrdFV8VGyKlIweLYgsQRJ8iBXu494idYcVNdfiE
9Zt4srPumGYYOFcrR/u8PhHjSP2Ow5GhNCt+0c4WB34MZpP7XLU3qwGUNH0Azwxl
UjuTCCtafkiw7sQIaqwRfkBYwB2vt0AQtv/GIHXi1WWxKdzq/Tk=
=8bBD
-----END PGP SIGNATURE-----

--1fZJyN7nFm/tosmV--

--===============1227163806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1227163806==--
