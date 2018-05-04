From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/6] drm/tegra: Fix a device_node leak when the DRM
 panel is not found
Date: Fri, 4 May 2018 11:53:34 +0200
Message-ID: <20180504095334.GF13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-2-boris.brezillon@bootlin.com>
 <20180504095016.GE13459@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504095016.GE13459@ulmo>
Sender: stable-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 11:50:16AM +0200, Thierry Reding wrote:
> On Thu, May 03, 2018 at 06:40:04PM +0200, Boris Brezillon wrote:
> > of_node_put(panel) is not called when of_drm_find_panel(panel) returns
> > NULL, thus leaking the reference we hold on panel.
> >=20
> > Fixes: 9be7d864cf07 ("drm/tegra: Implement panel support")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/gpu/drm/tegra/output.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> I'm not sure this warrants a backport, it's a very minor reference leak
> so doesn't really have an impact on system stability or functionality.
>=20
> Since this patch is unrelated from the rest of the series, do you mind
> if I pick this up into the drm/tegra tree?

Oh, nevermind, I just noticed that patch 2 depends on this, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsLZ4ACgkQ3SOs138+
s6Gndg//Z4Hjy/jgajA4atZTPWhs4yqdUkewk9paMSFh+GmFsGJBrWMkIvmVkAIa
tJHWI+v1BJc+U1KAKgKopnszeXwGt+77LcQOsTo5U67uUf/RbMydOXdAKiwcQB/i
XXh9MhbEfwmD8/f2wbazVV0s6pvbVMV31iCtRFLH/WRLK4WywOn2oCVLOiK0oQ1A
CSTf3AHQ2HfXYJHl9EUHx7VZCmmvKChms84cpa9NP1P3bfmveef9YbkZ0kfuWbQV
rm/nfmNOXrEOx60GWbpev7ma1nYUZuw1CBwaom3ezpXObE9dfdqjErRZr0v6Zn9m
iAo8xgHIQkv0IAuAX6hvqWQO+dj95HbV+ZZqfiLymso4nMd2iA5MrVWQLahquZ6K
EQW02t+ZyKd9pcwCJuPBqFJ21JGqWfgOOvJnZzChRVSJFhN0cOR3O1PFzcJuqAax
627PAXsLH6yD4FVWxKg7epEfyFQTrzF257LSlJfZSzkR7uUGYlU8O99U4Swdh6cp
wxKVvxsImo6tB/1rhAyswucFSvzWeQRnBS5yfNIyQPtfWiN2vO1HTyrX8/g+LJJa
/HuxfzFqlvJ3tNVx2R/pgB7vbv1gAUdpmu5RoZw4UEkPE7tfTOXb08qw9QKLw9sX
O3A4w6GGl2r4E4Ml6sKEi6R996YN7HRjz1OEnWpjTZwEJpdfRnM=
=gs4g
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
