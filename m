From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 5/7] drm/sun4i: Rely on dma interconnect for our RAM
 offset
Date: Wed, 13 Feb 2019 16:41:44 +0100
Message-ID: <20190213154144.5m5qxbfh2qmzwatn@flea>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <dfbdedf89c6a36f6fe5564e7c518664fa9e828c0.1549897336.git-series.maxime.ripard@bootlin.com>
 <16cb9f67-6b10-fbc3-6222-5364e718721b@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1941873367=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <16cb9f67-6b10-fbc3-6222-5364e718721b@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Dave Martin <dave.martin@arm.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1941873367==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d7l7xjpoqu2z746x"
Content-Disposition: inline


--d7l7xjpoqu2z746x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robin,

Thanks for your feedback!

On Tue, Feb 12, 2019 at 06:46:40PM +0000, Robin Murphy wrote:
> On 11/02/2019 15:02, Maxime Ripard wrote:
> > Now that we can express our DMA topology, rely on those property instea=
d of
> > hardcoding an offset from the dma_addr_t which wasn't really great.
> >=20
> > We still need to add some code to deal with the old DT that would lack =
that
> > property, but we move the offset to the DRM device dma_pfn_offset to be
> > able to rely on just the dma_addr_t associated to the GEM object.
> >=20
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >   drivers/gpu/drm/sun4i/sun4i_backend.c | 28 +++++++++++++++++++++-----=
--
> >   1 file changed, 21 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/su=
n4i/sun4i_backend.c
> > index 9e9255ee59cd..1846a1b30fea 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > @@ -383,13 +383,6 @@ int sun4i_backend_update_layer_buffer(struct sun4i=
_backend *backend,
> >   	paddr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> >   	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
> > -	/*
> > -	 * backend DMA accesses DRAM directly, bypassing the system
> > -	 * bus. As such, the address range is different and the buffer
> > -	 * address needs to be corrected.
> > -	 */
> > -	paddr -=3D PHYS_OFFSET;
> > -
> >   	if (fb->format->is_yuv)
> >   		return sun4i_backend_update_yuv_buffer(backend, fb, paddr);
> > @@ -835,6 +828,27 @@ static int sun4i_backend_bind(struct device *dev, =
struct device *master,
> >   	dev_set_drvdata(dev, backend);
> >   	spin_lock_init(&backend->frontend_lock);
> > +	if (of_find_property(dev->of_node, "interconnects", NULL)) {
> > +		/*
> > +		 * This assume we have the same DMA constraints for all our the
> > +		 * devices in our pipeline (all the backends, but also the
> > +		 * frontends). This sounds bad, but it has always been the case
> > +		 * for us, and DRM doesn't do per-device allocation either, so
> > +		 * we would need to fix DRM first...
> > +		 */
> > +		ret =3D of_dma_configure(drm->dev, dev->of_node, true);
>=20
> It would be even nicer if we could ensure that drm->dev originates from a=
 DT
> node which has the appropriate interconnects property itself, such that we
> can assume it's already configured correctly.

The thing is drm->dev comes from a node in the DT that is a virtual
node, and therefore doesn't have any resources attached, so I'm not
sure we have any other way, unfortunately.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--d7l7xjpoqu2z746x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGQ6uAAKCRDj7w1vZxhR
xbcrAQCEh1n4PhkK+dn+4WpQ1biwl3IG6QgA2yRSmoSg9ifHoQD6AtuVsCOMes58
jmZVxAAvWJpuWbVmFvidFiAlLvvQMQw=
=TNDy
-----END PGP SIGNATURE-----

--d7l7xjpoqu2z746x--

--===============1941873367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1941873367==--
