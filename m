From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Thu, 4 Oct 2018 11:50:31 +0100
Message-ID: <20181004105031.GD6412@sirena.org.uk>
References: <20181004090654.32233-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181004090654.32233-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>, robh@kernel.org
List-Id: devicetree@vger.kernel.org


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 04, 2018 at 11:06:54AM +0200, Linus Walleij wrote:

>  Optional properties:
> -- gpio: gpio to use for enable control
> +- gpios: gpio to use for enable control

Are we supposed to be able to have just plain gpios as a standards
conforming property or would best practice be to call it enable-gpios or
something?

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu18HcACgkQJNaLcl1U
h9DrPwf7Bh2tYKRDE9uZ3rdDUFBuNurCRgtWm7BsUaccxX5NvLnJJ5GNK310VNxl
qVh5M96vfWmoylOBi2ETFo0wtOXMIwNyVeWXfvPJNhCZnVLZuBtITDN5zAJPqlAX
mgb0mWp0w/IuQ8OSlHwrd7HioG0k/8RPPrQ0A0SmVXWuKgIKDsS2MZaqKLA6vkVF
bsWOx4FqX7IiCyduFC12baqFxtrKCrhTkEkYCKVxaNZ88tn/mqqwqt3fHush550w
wI9Ek7j/lSVMbHKTj0jA6eVs1bNYgqY1qfRJKafKQv446Yy2nK85xF6vTFMqYQFs
Muo4xvKIzBM88b8sw0HqigGKMkjfRA==
=Nkv4
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
