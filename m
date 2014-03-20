From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] regulator: Add new driver for ST's PWM controlled
 voltage regulators
Date: Thu, 20 Mar 2014 17:31:55 +0000
Message-ID: <20140320173155.GG11706@sirena.org.uk>
References: <1395324654-8235-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XJC8d/km55BuzcCo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395324654-8235-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--XJC8d/km55BuzcCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 20, 2014 at 02:10:54PM +0000, Lee Jones wrote:

> +	dev_info(&pdev->dev, "ST PWM Regulator registered\n");

Remove this, it's not adding anything really (the core is pretty chatty
already).  Otherwise this all seems fine modulo the issues Josh
mentioned.

--XJC8d/km55BuzcCo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKyYIAAoJELSic+t+oim96qMP/jxQwZ0by95KLR8s0/Ardnt0
rPCOD9Khi03/1qoLKkUMn6ScEgwPb2vd4klX2WUtxRJx0UvIaAR9AUHH5+HVtz86
mTiRXHl0CHwuxY6XihC9VdiJeEAgy/XXSZMqw1Cbdp1aH4x7UL1MdYyvv/4p/lUK
e6HQeJyPEZBxJqY/jcQFPHM+whGdzyAyTNLEG/OyKAMf5OhQQHgPdKe6zZHypAT/
H3mfUS7tnrf3+BAszuLnqd/465k2rHfKm4QyxnvAiqlcy1O4WO7LV/g+RRInuI6x
EPrksoZAq5QRGFpEJM7HeR7wGtmcpePcoBkHercuvQerZOBNrH4mzcTSkBT+X49b
J7XKS5sgMWRki2UdQBBw/N0r55HLGzrwSRPa7ZPUdw8o3UA7E/0Titf9otLNZxJF
8KAv75V0aLcs895BCjJdCL4dv7c1qSZSW1ltewvQ0loFbjZJ5w2hDEwJ3L1M7DRi
GNlmfNC8LUS7c01taBP1OpKujt602FEQqekhKxRti++dp06NCZIH6xxsnfICEa6q
LsVdY2wAz0au1TWLbDGGYmCiUyeZE9axEbGx1p1KmYeF4d6NBhOrrLSTgBn89fAi
1YysCtMtxVCeNLl4xfRBvDa7rbUpK7nObWXhWL72pWhYZczdHB6QOObaz1A0S3bx
WdZLEIokdQR1QryC6T3W
=+QoK
-----END PGP SIGNATURE-----

--XJC8d/km55BuzcCo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
