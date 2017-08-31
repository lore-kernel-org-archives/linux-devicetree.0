From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for Allwinner A64
Date: Thu, 31 Aug 2017 16:52:46 +0200
Message-ID: <20170831145246.p4k3uakbn67na3pv@flea.lan>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="q6ijb5qpgbsb6jtp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170830233609.13855-4-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--q6ijb5qpgbsb6jtp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 01:36:09AM +0200, Stefan Br=FCns wrote:
> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> reduced amount of physical channels. Add the proper config data
> and compatible string to support it.
>=20
> Signed-off-by: Stefan Br=FCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++++
>  drivers/dma/sun6i-dma.c                       | 7 +++++++
>  2 files changed, 11 insertions(+)

With what device did you test this? As far as I know, the SPI driver
doesn't use DMA at all.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--q6ijb5qpgbsb6jtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqCK+AAoJEBx+YmzsjxAgwfoQAIdOg/nUV1PYfAl+tCh3A5Vn
AMUbwL+sL4YZi2DQKVqrwxItlSpyB1QZMdjx2M7XAM7m9rDpKDJ3kISSiKel2fXv
P0ob4uR2bZeDtMqSDOJuCDUI7y4U9zsiN7Dcxlczjs8URGwjx5f337sYpVKe+HSH
HEs4hDg2YZGIoKm1N2CLe1RrLKJMG5ZKhh5jy9lO9nUwDTbXVljfOlSbvOcRM9Bj
2CJOdGOlezKW5pYiALSrqez7Piak2WdjdZclkJncdIf9R7UKIEebQax25w9U/PoX
z1i2IZpPhp5nRL1wIS86GqrvDEIf0Vi9fjcY/R0yXgXAG1RN62KBj4C+P52lEwrb
CYiCSb9dv/PEUtqlKmTW9xUl0HkGPSVHsozxQV/FmpwTwZwQdL8Ls+hqrgHOuBUy
kELbgKMkpO5Xuk+hn6qJgk9DUaX4eGxab1wvy9axagSpGJdB/hx5RtJWfCOHtfVj
W+kymYFHelSRUxXkTGLkBt2cCyu4+hhuNN7j1Qu8zjf+E3sA97AkDIo7ryrK9vtl
fXf45cSsDjJ9VfjOliygX3I9QmyaPGZwsxena+tTKI1Gq1AkMZeWyzMnnfE3DRDn
cWepaSuP0FwxURuq5c8mza4T8eQT4nr/ZT201doCY2kfEmkGJzBrhbSA9m/KInTn
hPqmr6t4NHs7Uvkmc6Mg
=yZ8V
-----END PGP SIGNATURE-----

--q6ijb5qpgbsb6jtp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
