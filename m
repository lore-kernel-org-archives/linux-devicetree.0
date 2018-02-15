From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Fix broken bananapi m2 devicetree/regulators
Date: Thu, 15 Feb 2018 10:08:38 +0100
Message-ID: <20180215090838.fnenymzrejs6vhcf@flea.home>
References: <20180214141025.22171-1-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pezhon6uik27e2hh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180214141025.22171-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pezhon6uik27e2hh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2018 at 03:10:23PM +0100, Philipp Rossak wrote:
> This patchseries fixes the bananapi m1 devicetree, to be able to boot aga=
in.
> The first two patches update/improve the devicetree and the last patch ad=
ds
> all missing regulators.
>=20
> Regards,
> Philipp
>=20
> Changes since v1:
> 	* squashed commit 1 and 3
> 	* fix wrong mmc regulator
>=20
> Philipp Rossak (2):
>   arm: dts: sun6i: a31s: bpi-m2: improve pmic properties
>   arm: dts: sun6i: a31s: fix: bpi-m2: add missing regulators

Applied both.

I had to make a couple of changes though, in the commit title arm
should be uppercase, and the fix isn't needed.

I also added stable in Cc, since these patches have been there for
quite some time.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--pezhon6uik27e2hh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqFThUACgkQ0rTAlCFN
r3SYtA/+KYqTpkxcn4U+UE/F645lEn0rhrJt+dlSELrkIQ0dd2pZsW+FFloohSJb
GRxM77uLy/uvfhLEocQoJujJJU3UBvLGkYyQGeXQmSiQGcGaB5YCkUQNeN91tJF9
r5PTSPpE02qGQ7iU6PrvPpmoWTqZlkKe/59ouZoxA5/390ZcMgfwF6HZJ6KYbrAn
pMfAMLmWRh66v+iFCVZXBOLi0GW7ui1RCpk0ZdBUv9Ojeufnjqf1v9Oy3onEHDFs
xhNDtNita6gCNFL4Wt+uTi43ggNI7RUCSn54zSr3Fm6oPY6OQ338rYiLf4pg0cf3
rgbGeK/FBG96wZEj7YzVu39GXWFB+eC+gJa8S4arYYkMkBYoOgaDSZ1H++cSIlwQ
f+TNjD/2Z+VqCXPxlDm2wLHeqj33r06bb4kJKoXPqCIcoEoYeprTyNX8MS4BhCOi
ksOl7XrjaRhtT12ly4tzvpyx7dBZggebwQkvPPEy+6Ubx4j2fMoHtpP1xpinK0Of
jYm3msKTYvuejYAmqgM2zS/i6dzCYkilDpl5DQAu86ril8D3c/EylEaNUilnx9Bb
FY1tgE+cOP4d2GNsxTfoxDfcaEBA7Ve8WQEjUBtD5Y+keNcy0+sYBFSa226iwmvQ
krkdtqR2BsJODzZUkDKwyj2ExiVDtQLZUCg9pTC/dU81DigcIbQ=
=VPxy
-----END PGP SIGNATURE-----

--pezhon6uik27e2hh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
