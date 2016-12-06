From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dts: sun8i-h3: correct UART3 pin definitions
Date: Tue, 6 Dec 2016 15:31:43 +0100
Message-ID: <20161206143143.yq3tqkcimrg45n6m@lukather>
References: <20161206142710.6450-1-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lfyrffyl3unhdooc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161206142710.6450-1-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lfyrffyl3unhdooc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

On Tue, Dec 06, 2016 at 03:27:10PM +0100, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
>=20
> In a previous commit, I made a copy/paste error in the pinmux
> definitions of UART3: PG{13,14} instead of PA{13,14}. This commit takes
> care of that. I have tested this commit on Orange Pi PC and Orange Pi
> Plus, and it works for these boards.
>=20
> Fixes: e3d11d3c45c5 ("dts: sun8i-h3: add pinmux definitions for
> UART2-3")
>=20
> Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

Could you please queue that patch for 4.9, with
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lfyrffyl3unhdooc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRsvLAAoJEBx+YmzsjxAg+IoP/2LHAnTAZUtxVXo3UkrxGvom
dlNm4qX+l+avEGbzcm8f7tVQsbKCq1ANV/cr8LwuKL6U/ycP7WAXrBWxAounUfke
DXONRZ8fhyHiS1XBS0JZ59p89uS4HU5+3pFAN/0nx80A0yLkneDWJ6RdY/aGoND6
bNZODdz44W88JJ9uXVq9hLHotQnmHLo9wsw2yCDZ4OD+Ozwy1vaBKMYGMgTBsWVd
pvrYPYqiW3M1MDTdVOGLpP48jjN5sngWRBQ0mgugIjRjqCzhp9t62SOIue4ubadW
9mHSV7tGv+0rykuRy58+LErIVV6MZf2gkcIpAOWughRGlCrIB4Dmzt60k6b5E8La
ZUYKr5QgTcnR6Dblmp/QHvORjE5dozq0WrUq+RcK4Z0y17ouhUJgoMJ/MHqhIO2c
s8qyDWKkI8k30jaxSG13T5hIRgMpIJvRDDQaFvbIriX4OzkBc4guCCBUaXSXc9nH
YIKgtuE7pY/7laCcHdoBsdi6i4A2ienWKhyom844CdEtUTRjywZ065pdmaKHuFVE
giOciy6mxAt7RUrVEDLRr+FjzmfTUnlPnJYyXClgv9aaAQ+An9O/BaPcRS+WSYbY
+j1dh9mPwxVtA20rFNy+tfjeaSKgM8iX4NcPQpmBjrzMxW3rf0k+HZPOCGIOW066
ajVP+LLs3xvt/JtK7S7v
=nujw
-----END PGP SIGNATURE-----

--lfyrffyl3unhdooc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
