From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm: panel: simple: add Toshiba LT089AC19000
Date: Thu, 19 Oct 2017 10:17:57 +0200
Message-ID: <20171019081757.GB4459@ulmo>
References: <20171018172240.8772-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171018172240.8772-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 07:22:40PM +0200, Lucas Stach wrote:
> Only exposes a single mode and not a complete display timing, as
> the datasheet is rather vague about the minimum/maximum values.
>=20
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
> - fix display size in documentation
> - add bus flags
> ---
>  .../display/panel/toshiba,lt089ac29000.txt         |  8 +++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/toshi=
ba,lt089ac29000.txt

Separate patches are preferred for bindings and driver. Also, please try
to stick to the "drm/panel: " prefix for panel patches (and "drm/panel:
simple: " for panel-simple), which makes it easier for me to spot these
patches in patchwork.

Both of the above aren't blockers, so applied to drm-misc-next.

Thanks,
Thierry

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnoX7UACgkQ3SOs138+
s6H6Bw//fSJ0gKFuePab/o6O8dBelPcLgla4k2Sm3cnYYY2DNke03zC3Nu0BOgt/
6Xl7pYew/GaNcArWgFU/N2L8NHA/093lBl/NJ/Zt1VcIGmUM0cxH+HtP2cq6KRal
Xn9Zu9J7EXkvcdIK/RHIvEsSFvEy2zcOwA+VXw20sDeBJPxVq422AK9t4+8xYoic
8LIAOl6I3qVLDH6K9v6l1n9xtP4aPhPVogyAoiyaFqMeiakQ5EEiY3aRc8aK0lGs
NTz1VlhjwyBOcaZRey5T/SMqk0AfH+U9Mn6yzukFvYRiOHiPqFMhUmJNrZbXqTGy
EdM0uhoakyd37z02mRpv42MmxV8CQ+lCHzpotKi+u77nmCs02juv9/y6wIwuiy5T
NNDHPZhPXt3aFK65F5L/01kcUYmnVuvvSDlUKdg46wg1El5IeEJeQmUMaqAa5xHA
PVGT8MB7YhxVdZb2l8v1IajJbKaoCQIm1SHF0GCj9vA0pjFtPpq7HgMcol9tpLS3
VvweJsn0YmVV/rxBuKiM6xJFipJF8W+yQLJcTLfTek3rCr89uw9eBv/xuoJ5Qwei
UuRvj/Y8elOscT208Dp/EbYSOx2KoWngjAVupMy5lRaGVqad0ZoWlSeXCEfBa+82
RPsem11a1FcsEACYRq1P+xN1HKTeIod1NdjqR22BiBT4YhkB8uc=
=0Fr+
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
