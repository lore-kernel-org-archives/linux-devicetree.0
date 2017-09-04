From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 05/10] dmaengine: sun6i: Move number of
 pchans/vchans/request to device struct
Date: Mon, 4 Sep 2017 09:43:55 +0200
Message-ID: <20170904074355.niloziky42aki7bg@flea>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-6-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hs4nqmfrjcgcpunc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170903224100.17893-6-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hs4nqmfrjcgcpunc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 12:40:56AM +0200, Stefan Br=FCns wrote:
> Preparatory patch: If the same compatible is used for different SoCs which
> have a common register layout, but different number of channels, the
> channel count can no longer be stored in the config. Store it in the
> device structure instead.
>=20
> Signed-off-by: Stefan Br=FCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

As stated already, we already are going to have a different
compatible, and this is not something that will change from one
instance to the other. Having code is therefore:
  A) Making the code more complex
  B) For no particular reason.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hs4nqmfrjcgcpunc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrQQ7AAoJEBx+YmzsjxAg4sIP/juFa5MC/C0tdGXRLFS0/DGD
5XpDuI8Iu6R34p6JU+cd+RYEJSDzKyrOkBqVmgHvhrq99BpJe+aerw+UbLrZrKXj
4kBKaNCtb7wyNe424q4z1ZbtwW/Xkj9aMqcXYbNzJ6wtsltOoK+MU1YuEEy1SziH
WTkh4EDiu2W7He66yEtKrdOfcQt+kGwACZ/P/dK5pxNVyMqW3EsA/IjO7JPsxZ3C
H9bE2JLAW3srQAnMCPJFUXeYwX4v5YE6niOpDjHaBuEeUuohsS4r+vBhE25kafRX
aAoxK+JlJLu1Z/QuHDP6HnuhU6o7H6bt7MfhFsueviPx0harFJv4tyBfaee1hDf9
nWtcRP+QofT+pop+dpWsojTJaCie5ZXyKZOzAER6t1yL2IyQDUSylgKjCz0FkZ40
94yW77BvgoRr9ySr49RFPWbrj3urcPpt3AWH6CqqgxF8PnQkbWnw/S4HTO3tEHn/
ycDFDEdz3v2MZkAKCfCDq3IEGSvLO+ACPrVeUKPzrLH5IYX5KHiPtF6PIhmIyNaW
YOABPR0s8Ix4gVhPNgEgLaa9kWhTTFV42TaEg3eCCcrCTMIVAsO/s6YvK7k04miO
oFFUtmOyi/2FULdPx3H6Lg41Ee5nVIMMgN+gN28DZZkioMUgXW0fDxbgMU6jN9JM
8nOtcRvbig05x1A4SUEC
=Jwhi
-----END PGP SIGNATURE-----

--hs4nqmfrjcgcpunc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
