From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Convert vendor prefixes to json-schema
Date: Mon, 20 May 2019 15:18:46 +0200
Message-ID: <20190520131846.tqx7h7sjyw6sgka5@flea>
References: <20190510194018.28206-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="26jxfkzgkqsicu7x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190510194018.28206-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--26jxfkzgkqsicu7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Fri, May 10, 2019 at 02:40:18PM -0500, Rob Herring wrote:
> Convert the vendor prefix registry to a schema. This will enable checking
> that new vendor prefixes are added (in addition to the less than perfect
> checkpatch.pl check) and will also check against adding other prefixes
> which are not vendors.
>
> Converted vendor-prefixes.txt using the following sed script:
>
> sed -e 's/\([a-zA-Z0-9\-]*\)[[:space:]]*\([a-zA-Z0-9].*\)/  "^\1,\.\*\":\n    description: \2/'
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> As vendor prefix updates come in via multiple trees, I plan to merge
> this before -rc1 to avoid cross tree conflicts.

I just tried this with the 5.2-rc1 release, and this very
significantly slows down the validation.

With a dtbs_check run on (arm's) sunxi_defconfig, on my core-i5 with 4
threads, I go from 1.30 minutes to more than 12.

Should we improve the dt-validate tool before merging this patch?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--26jxfkzgkqsicu7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOKpNgAKCRDj7w1vZxhR
xaU/AP4sEcxQ75aEnI0xMbq88t3BZzAEW0xMBgZRESwC/0YwUwEA3Wu9L5Uir8PG
cDc3z03Kswww+O1DXoE+XNDbc1gMHwc=
=aMcg
-----END PGP SIGNATURE-----

--26jxfkzgkqsicu7x--
