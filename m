From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: Add coupled regulator
Date: Mon, 30 Nov 2015 16:41:39 +0000
Message-ID: <20151130164139.GD1929@sirena.org.uk>
References: <1448897346-17780-1-git-send-email-maxime.ripard@free-electrons.com>
 <1448897346-17780-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gf9uwQCH04IP1HVU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448897346-17780-2-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Gf9uwQCH04IP1HVU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 30, 2015 at 04:29:05PM +0100, Maxime Ripard wrote:

> +static struct of_device_id coupled_regulator_of_match[] = {
> +	{ .compatible = "coupled-voltage-regulator" },
> +	{ /* Sentinel */ },
> +};

This defines a device tree binding but does not document it -
doucmentation is mandatory for all new device tree bindings.

--Gf9uwQCH04IP1HVU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXHxCAAoJECTWi3JdVIfQq7EIAIaduQgAoB0O3zp6r7jrBDpz
9BKVeP0QwrrQ4QHyiIQQ4naLBv3f4zxAIvRVUQD1BD5A27GIpfIvJSXz4RRUH6rv
axGCA8XpnNCj610sighmAjOBuX0Tm1ouIPMqhi5gMiVIaYG8Magi0znfjht99eW8
dJsfEmTao9Wo76of72TA6deB1REgXFxdq8fdX6X+HrbBYBa9AogaGKhCDvfsimM8
mP1NDraN/vLX45tYdzKbE8NV1QxyAdoHVuvIQPoA++KsiCPImw1XRi1zuTarlWiG
VSAJwR47hRusg29pQqTee4JjGkTgeSmtW8HSZxSUsvkt240B5Fjp1244xTwMTlQ=
=7Nvg
-----END PGP SIGNATURE-----

--Gf9uwQCH04IP1HVU--
