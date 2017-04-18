From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: pine64: Add remaining UART aliases
Date: Tue, 18 Apr 2017 07:35:22 +0200
Message-ID: <20170418053522.ebkimevucq57y2km@lukather>
References: <20170414190804.21865-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tysmkt73rdvixcm5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170414190804.21865-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tysmkt73rdvixcm5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 09:08:04PM +0200, Andreas F=E4rber wrote:
> Enabling uart2 node currently leads to a /dev/ttyS1 device, with ttyS0..4
> always present, causing confusion on the user's part.
>=20
> dtc cannot resolve an overlay's &uart2 reference for strings, only for
> phandles, so it would need to hardcode the full node path.
>=20
> Avoid this and enforce reliable numbering by adding serialX aliases for:
>=20
> UART1 - on Wifi/BT connector
> UART2 - on Pi-2 connector
> UART3 - on Euler connector
> UART4 - on Euler connector
>=20
> Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tysmkt73rdvixcm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9aWaAAoJEBx+YmzsjxAgsz8QALeki+mW1XDM+brGAEqiuOa4
Q78onngFCunmO0u0rvoEJ3Vy0hLJPZIyHrMmnAnXCJ14gCA/3crQM8d7NF5AWBtN
M4H4xeT6L2HsY4bJr+5ngbVFTzUYL59iztgsb9PbWMj8nZCuUkiunq0n2lg60XDU
FxtKQGfjiLlFfy7z8PClOSY5O6l3gqwfRkwpLHltEY2nZuJfiIZ0k23bwPGHXR+y
kqvfoHz5Ei7jnKC6w76d7CRl9RzMfaXxmZDSCCfWje2HtYgkQciDXkKshN04eO2Z
zO8jaUkUkiAfSLLf2HcfCG6QpWaI0NY12RBqYBtZ5W3qWmQz5MnqiV1vDoJRLSh6
uV7TaFGPupLo8X++e4oC1vFsKg4eaBSUkY5ZW73dpqyCZe7KjBCStU7u2+ZebH+y
qOyJijtG2hl4c7UXRIykvrrJ5M6OFDdD1w4+U8r2Kxf3NfxaQcMXbcObV6/7YCnB
YOKunjA+MYM+OST/GObvmnTH915ASGDAMq/uxTs5sO6zpMw1hUx1KzuhAdR7lf7w
9udwh8hpsR8oIS47Qh27pari2i1Xmu98uc0pbcixhkvn98j7k+KRZc6aUJ869Pr4
kQEH3nJsm17efLKK8LLd4+SxFk/nrahXvQRDVJ0j5otCCI8tN7u7D2NeA9mNLm+k
BYRDdRcy2XyTvAQXBJj2
=GJCl
-----END PGP SIGNATURE-----

--tysmkt73rdvixcm5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
