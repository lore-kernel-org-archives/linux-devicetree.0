From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO
 registers
Date: Tue, 21 Jan 2014 18:55:53 +0000
Message-ID: <20140121185553.GW17314@sirena.org.uk>
References: <1389900750-27625-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fJLw1dhSMr+9E5PS"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389900750-27625-1-git-send-email-nm@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fJLw1dhSMr+9E5PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 16, 2014 at 01:32:30PM -0600, Nishanth Menon wrote:

> -	abb->base = devm_ioremap_resource(dev, res);

> +	abb->base = devm_ioremap_nocache(dev, res->start, resource_size(res));

devm_ioremap_resouce() should do the right thing if the memory region is
marked as uncacheable (with IORESOURCE_CACHEABLE not set).  Since I
can't see the OF code actually setting that flag on the resources unless
I'm missing something this change isn't needed?

--fJLw1dhSMr+9E5PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS3sK2AAoJELSic+t+oim9ClwP/3NkQLt/mxG6IiRa88CEscFn
hekzf9gKmrBK+sodAM+kbdwteizCuH2z0TsBHlDdUs5uKCS3VgUKl0583+MGnPrm
VtT3bI4rCU9b5Yx8RuAR9tXnFrVbpanpp1ofQUUId0HbNMNRlT8HNafO4FfejSZK
7D7rhJb4C+557IDcReMOMakq1sCRf8yrrYJyYPBXAVN7/GJNcv2xj6ZWJlcChXK6
xSjaTrKqSxUX9yHq7Yv/arCfpiQSMaJhd5fWdF0Yjvy7w0VVYYdDNxjhCPwQlCxK
NBS6m+WFD7aKn1uBbRvrXzABA83oakrpUKCn9EIJ4MvK352emiWt8i59NtfAA/al
pIXzifLAKptRO0IAqIZxgWNf+7EKx5ni+Fbd3TobhKB8weCfw2JyqSveC4TiJsHD
ppDQsRGj0NnnfQHf7bVbuu6SD7cqeYcwZSnLk2yhmtXGYtIP5iDwmItk8ZmGJaHi
pupwKXMgYzWfrIr5HXXqsId1TXpxbCSq/gIdQVBWrobSB3mdgZnUuMQFm+kj+Gqt
237QJYb15EVtq6lV8Oj6qyzwZKTBb2aCRZl6YkSvkFmNzT91tpMp1V3C8RUYtRmP
9HRvUdCXOu8vaWw6YtTF/FKZfvrmJb1JTh8DQFbpdYUMuZXxJuKu4KfUdaK/x/D4
XVrDkb0ivqllk0/QDm+W
=cn1t
-----END PGP SIGNATURE-----

--fJLw1dhSMr+9E5PS--
