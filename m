From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/sun4i: Add display backend interrupt to device
 tree binding
Date: Wed, 29 Mar 2017 09:09:53 +0200
Message-ID: <20170329070953.x64daho2kfgr4fbc@lukather>
References: <20170327143847.16259-1-wens@csie.org>
 <20170327143847.16259-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elgbnfx46i2igjcf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170327143847.16259-2-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--elgbnfx46i2igjcf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 10:38:46PM +0800, Chen-Yu Tsai wrote:
> The display backend has an interrupt line. Add it to the device tree
> binding.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

The patches prefix for the binding documentation is usually
dt-bindings:

I've changed that and applied that patch, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--elgbnfx46i2igjcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2129AAoJEBx+YmzsjxAgqdsP+wb+Li47GrI644rcnCRrAqJ6
TK8BQDCq8XWwUgfj53j+GlDsJNgyVi5lgD5fvVseXeH00YL0aH8BJOjpCEj3H4LH
ceH4IIs9TTgWY0aXH6GPxxQFcfy+4eR3VlzDUkjhEJLmgmMJbCkTNL3PRmmqpkT2
vIKv69GPIOFwthUiTlawg5xojbmlBAOu31lhi+sz2ywt+y+SJWdpEofAh4CrBSgV
0dkVsScwjcuJ6wQDCU1+FOlz935xijw/9Btm0Ryx+V3tFh+rvmcekEb0wRlDEpjh
NPetwphuzk192AXWTSnx6qJKvFb+W/yPKVn5IAo43fek7ltDKB51vzfjNWUiEPVf
vky5fNrIgI6Db/Xb3SlkrIx0uUtGCQ1r0uVm3oGoCLx0DtbfPiBRhvyUfV+J5j73
FS8gpciAZUjax5qAn6belu24FDrOgbKSECtb8x3Jm9rZHThym40FfBVCoBO21M6m
Jm2rV718BvzV3VIM3oEeRN6qPFBzEH1T6M3loQkDI+jwNqWMYvWd3Z4YPXNoTdVQ
7Uvq18vgXyjGtxE2XzEUGzDm7ysJt92mztiYzTOCpwDE1q1fKoJ3eEXlb1BCILCG
+ZbD+0rP6ZcS1pKlgM7bhDfmSkbfHyKsSP1o2o1E2zqvOTFwQT//cUO1bO87DSd5
RElTlN38YeZgxSyrPTiP
=hFPo
-----END PGP SIGNATURE-----

--elgbnfx46i2igjcf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
