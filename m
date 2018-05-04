From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/6] drm/tegra: Fix a device_node leak when the DRM
 panel is not found
Date: Fri, 4 May 2018 11:50:16 +0200
Message-ID: <20180504095016.GE13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-2-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180503164009.14395-2-boris.brezillon@bootlin.com>
Sender: stable-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:04PM +0200, Boris Brezillon wrote:
> of_node_put(panel) is not called when of_drm_find_panel(panel) returns
> NULL, thus leaking the reference we hold on panel.
>=20
> Fixes: 9be7d864cf07 ("drm/tegra: Implement panel support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I'm not sure this warrants a backport, it's a very minor reference leak
so doesn't really have an impact on system stability or functionality.

Since this patch is unrelated from the rest of the series, do you mind
if I pick this up into the drm/tegra tree?

Thierry

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsLNcACgkQ3SOs138+
s6HbmA//aoCGzyD9o5tAEqgJ3jFbJfP3Svk911VmwQC6SldNtsHuNvB6Bq+yag9M
3FnH5x2yOvVEIij9bXn690v4+aVAeeCleFAn4hMhQ/4W6nUXk1IAbTYjK+tsvdJ1
oh6w0yyuoz7tEsMi4BWvMSS+tngAzRJB6Hn9sJ6qNoAF6B0k5fshUZv509sL7NrL
MZbGxy8/5b7fwlSk/ux56EfHqqcITrEApHnxEICchvTGiwKmHeGe+uGRgOF54Z+E
Qr1RP6Yq83Z8xKD6Ssk1ob3jop1IAw5ejioqMwEgcB9Qm/GNzcAOUmYIcJN0XXhf
MYcMaX8aI5ORGdfSAoyr7BimnlbutC81naVyHhnA6IXbA1TTsdC/edYDXfzRQzbs
3Rn1svSwbAx5uCxA0YUvXhWbQXk3KuTdKvEPhYZrN8fndO03Dj5YYWBYGBI8Afza
MTNWgCjvHUc75KA4Z4rkurjbub5iaGJdNDiXVqO4wc7E9If+QOD1akNiOI3sprRl
GVPAlBHwJX0mGFyiqzrz91zUkcpmcpfWlZ835+LdcWOFCkfWTESa5IV5m1V3ZWC3
x6iKxX8HEPZrJRwRui7dXFpxQu5jMh+2pv80MppzfEH8ELHv8Ro5G/oEBAJ2TIP0
5copjoh6mrpGd8wfynqtQFQuLeIr32Q0vnBBcT7BcF9X57TO99o=
=2YTq
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
