From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 02/11] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Fri, 11 Oct 2019 09:57:05 +0200
Message-ID: <20191011075705.j5bqw2w6jmcrv5dz@gilmour>
References: <20191010182328.15826-1-clabbe.montjoie@gmail.com>
 <20191010182328.15826-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hxdp6s4p3ktvf5rr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010182328.15826-3-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--hxdp6s4p3ktvf5rr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 08:23:19PM +0200, Corentin Labbe wrote:
> +	ce->reset = devm_reset_control_get_optional(&pdev->dev, "bus");
> +	if (IS_ERR(ce->reset)) {
> +		if (PTR_ERR(ce->reset) == -EPROBE_DEFER)
> +			return PTR_ERR(ce->reset);
> +		dev_err(&pdev->dev, "No reset control found\n");
> +		return PTR_ERR(ce->reset);
> +	}

There's only one reset so you don't need that name.

And I'm not sure why you're using the optional variant, it's required
by your binding.

Maxime

--hxdp6s4p3ktvf5rr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXaA10QAKCRDj7w1vZxhR
xdFDAP4z2YXaSscQlnjsH4zr2VB2gt6uDBKoFCnpm7jjmt5m8wD6A51EfrA7MNrg
+4UUrvYx5Q4Ij377kSHvZ927yk3uXAg=
=IagG
-----END PGP SIGNATURE-----

--hxdp6s4p3ktvf5rr--
