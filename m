Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36441 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746Ab3HVKjZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 06:39:25 -0400
Date: Thu, 22 Aug 2013 11:39:20 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130822103920.GC26118@sirena.org.uk>
References: <CAPgLHd_XJpihjFyozW0f01zj03mJQTzPN02=pdBuYfwckDWvGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lg8eXa+brxrbjAbR"
Content-Disposition: inline
In-Reply-To: <CAPgLHd_XJpihjFyozW0f01zj03mJQTzPN02=pdBuYfwckDWvGg@mail.gmail.com>
Subject: Re: [PATCH -next] spi: spi-efm32: remove redundant dev_err call in
 efm32_spi_probe()
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Lg8eXa+brxrbjAbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2013 at 04:11:12PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied, thanks.

--Lg8eXa+brxrbjAbR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFepVAAoJELSic+t+oim9J5wP/1Cz/4tWXpDJQSZR1y0Hqj3a
uh9hBpHtXrRuQtUsdsU1dkjtmkA0ixb3aOgv3uOaQJOtBS8Gwbu67/KdqfkQwgs3
GHhwnn3EHw+OhBpA2wZxd2s9L5cpLa9JScDH4UhKmh71tlNZXcU3h3H7AcNl3tEU
LQjidU6l6XofdyaF9vCrtKbOLkvzR2JHHGnt1VBgsZ2r2bCFHw0e+ApT/wMF8sAC
gJUNasAdyG4/anqrl1tWV4O9hQAiuFra8dfEK2TPWHdM6fbKAJ26ZpfqnJJQbu0F
IOBF1Q94cKeMtzQ69jlpEM++oTuXjMrG34NXa3qV3rp0KRLeiYOum55ywZf4XgsP
Ve3YBWja35Dqsy1X7uDKjEtNNM77zeDLDNLKlNScR1rGbh04jpbgz+l7xJIgiPDu
aa16j5I9/UsYABOzhM2CpUu7ockFkS9Z6HsHBDJbM7EAnCOM8v+uqPiWHPSB4ZTo
JMpvMwkqpOu36uCdAocNLxG1nK+vjIGS4OU4SBNxDzVY723mFgUDDKguku+DcQGb
WxYt8ZRkOaVPbZUiw8xQ5zXYvdGmSK2hD7hytnOMyy+RMxOhME8NzKlPwZ5+L6Pa
lD5xVDBAUiqY9rReLA2ImC5IXPV+V9eMVM2HvHNmvgIJRpbJPvmp6TLv/8YDNhIa
nvw6lGxruMyMQkXHmvui
=xge3
-----END PGP SIGNATURE-----

--Lg8eXa+brxrbjAbR--
