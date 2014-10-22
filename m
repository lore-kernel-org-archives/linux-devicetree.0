From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC v3 PATCH 1/5] of: Add standard property for poweroff
 capability
Date: Wed, 22 Oct 2014 16:59:21 +0100
Message-ID: <20141022155921.GA2344@sirena.org.uk>
References: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Do9hQ/bfCb4zBpLo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Romain Perier <romain.perier@gmail.com>
Cc: devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, heiko@sntech.de, grant.likely@linaro.org, robh@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org


--Do9hQ/bfCb4zBpLo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 14, 2014 at 06:31:09AM +0000, Romain Perier wrote:
> Several drivers create their own devicetree property when they register
> poweroff capabilities. This is for example the case for mfd, regulator
> or power drivers which define "vendor,system-power-controller" property.
> This patch adds support for a standard property "poweroff-source"
> which marks the device as able to shutdown the system.

Applied everything except the DT update, thanks.

--Do9hQ/bfCb4zBpLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUR9RYAAoJECTWi3JdVIfQHo0H/2H2SwmX3/5xD9ZRF1nfYM5K
l8R0IES9Ks0yKogjfyC7buNJNCOskrLfB1dqqQFPMwxKw9UsqwFxy/MkK+7iV0EQ
MWCvC9RZiJDpE1QRJJz5exb3pDJuP/kb70p8Po6dWAPHuW+ooTF6p56DfYrBiGBa
y/PyCyA7le57z6x1uJojdgjAGyZFosXluyh9PJLLVglzKYzyqexuWIKCgr6ZuI1a
pUg9L81yclXGBm9fiqZX8zEhe9pxqcxCpwp/6XJ0Fbf/Rqgete7t2Bgifem5Xl+S
v7yrAfol5/EWz7jlbv1JhKUBog1Il8dzXQSe8NhGaNS4tp+kwkb9tAN8IXW7QMc=
=rxHD
-----END PGP SIGNATURE-----

--Do9hQ/bfCb4zBpLo--
