From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 11:08:34 +0100
Message-ID: <20131125100834.GH22043@ulmo.nvidia.com>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125094503.GD17722@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 09:45:03AM +0000, Lee Jones wrote:
> On Fri, 22 Nov 2013, Thierry Reding wrote:
[...]
> >  static int cros_ec_probe_spi(struct spi_device *spi)
>=20
> Can you send a pre-patch to fix this too please:
>   static int cros_ec_spi_probe(struct spi_device *spi)

I just noticed that we should probably do the same for .remove(), which
uses the same convention.

While at it, do you want me to make the same changes for cros_ec_i2c.c
as well?

Thierry

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSkyGhAAoJEN0jrNd/PrOhHxgQAJ6WRO2EJBZ+j9e+P/fei+kq
+KXy9hzlwzyvKA9hkF4Sr6pgULxTtpRwwNnDvxyzn6VVIrY232F0sguyCB0GZ1To
9B7EwapYGUOdgm/wz0SlEJZzuWUqRtdal3rlQmvQRKO/VIpP+ksKdWtNdy9+CyQ9
A1F7LJJktDSgo8qdRymEaafWNwE2n37B/Yq97z1vTVTRthU/2HEDzYs3KqiYHEQi
ml4KgUhUhncj3Hh8EiDNKexW4JDDDDjHBrDArI8qUh6FflEPL2pliQqIsLknZfQi
BuH0NCz9Y9+kHV6xw6zl1JSDKbiSZcxy+z2b2r/if2yRvObBTu9Op5tKs4ehzMj8
qwSFAcsU9q1JHa7y+3tPGvhzp8+ICiF0ofgZYAfSAu7mqcOIVnVbFFjEU6EbjorG
KViCWHXVlViqCYwIOrTMpMx9TONNpTW/h7VjKZql8unpzVh9sP+zWr1seI5aF+T0
xrsjSTpG4GqcCqzwT687aCOQTE8dgYd8XjJT0VngSi9S6UIDm6pILYDZ6L6mwkfY
+rrQzFHNGEHr9dEhgVv7KAcqBbZTiebJcePVx3N2lu5Aoe/k5d58mDghfT6qf8tw
xiL+CwrWdvrXmWYeA8WrR8PXB/rquCn7F7npJaZVuuHOqaCE5nPDQGhNmlgpu5SW
Sr2mJsxBOfogJz/s+89P
=Y5BO
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
