From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 2/2] ASoC: simple-card: Add documentation for
 force-dpcm property
Date: Mon, 14 Oct 2019 12:56:35 +0100
Message-ID: <20191014115635.GB4826@sirena.co.uk>
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
 <20191013190014.32138-3-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191013190014.32138-3-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, robh+dt@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 13, 2019 at 10:00:14PM +0300, Daniel Baluta wrote:

> This property can be global in which case all links created will be DPCM
> or present in certian dai-link subnode in which case only that specific
> link is forced to be DPCM.

> +- force-dpcm				: Indicates dai-link is always DPCM.

DPCM is an implementation detail of Linux (and one that we want to phase
out going forwards too), we shouldn't be putting it in the DT bindings
where it becomes an ABI.

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2kYnIACgkQJNaLcl1U
h9AJzAf+L30WoNHHnOrkkpLMsmM6uZcu7czOKRKOJyZ35878jKwHbjZap1z9TOLG
ivJDyoiRoLYg4twQJcl7Rt/I7WytvqTEkhzju5+LWpRuB+fFtdBjwK0p0rXZbj1E
6wWWkfnGi5NgxPGa0FSCwLUkIwPtrsd3Rwxbwk6n+kekbJxEYK9UzkGOydcIIgez
ie6lZRh515nxc2sohfBhM3//verg1jHxxG6sA0cMQ+hHwdzgIzfXzsHXlYw9M/pm
Z9KNu7+EiJ0gefb6XXCbqfJQ+B37sibpl+10EeiUIHIW2bjOl1w+LJgRJzb6nFK8
j60W+/cODoUMQWboKCkQ+oTUEHuDXg==
=SivO
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
