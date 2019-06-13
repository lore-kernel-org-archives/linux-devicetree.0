From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] dt-bindings: Check the examples against the schemas
Date: Thu, 13 Jun 2019 16:54:45 +0200
Message-ID: <20190613145445.n5i6rkhgddwtjbyo@flea>
References: <20190613144210.22181-1-robh@kernel.org>
 <20190613144210.22181-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f65q35kf44uwfpr2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613144210.22181-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--f65q35kf44uwfpr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 08:42:10AM -0600, Rob Herring wrote:
> Currently, the binding examples are just built with dtc. dtc recently
> gained the support necessary to output the examples in YAML format
> (commit 87963ee20693 ("livetree: add missing type markers in generated
> overlay properties"). Now just switch the output format and the examples
> will be checked against the schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For both,

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--f65q35kf44uwfpr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQJjtQAKCRDj7w1vZxhR
xZxpAQD+Csm6NW6xs3F9ECciXe4YWZlf4NupGE7IECk8c3fZuQEA9vcBhpmeD2UQ
Izl4nblyUMI9q0W1ucyY7sxH36PYfQY=
=jiUn
-----END PGP SIGNATURE-----

--f65q35kf44uwfpr2--
