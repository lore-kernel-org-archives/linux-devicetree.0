From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 2/3] regulator: add
 regulator_desc_list_voltage_linear_range
Date: Tue, 12 Feb 2019 15:34:08 +0000
Message-ID: <20190212153408.GE20635@sirena.org.uk>
References: <b07e501c84c77c59f0a2a67c43576373a140f10f.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b07e501c84c77c59f0a2a67c43576373a140f10f.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>
List-Id: devicetree@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 12, 2019 at 04:18:46PM +0200, Matti Vaittinen wrote:

> Add regulator_desc_list_voltage_linear_range which can be used
> by drivers for getting the voltages before regulator is registered.
> This may be useful for drivers which need to fetch the voltage
> selectors at device-tree parsing callback.

This seems fine.

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxi528ACgkQJNaLcl1U
h9A2Wgf/WiSjmwLgHQTPyCGf1Sbz8vbqTBhUHH54wARjgAV284XgiCShR+gN36Yy
SgqwuDospXsR2ieWwDSIGaSWGP2ZszxI9IMO+ln7g46IbwEQcfjG6vpehRft05Fp
A3ScY61nkouQttCGUvrZSwnMZLUs4NXm4lQ/9QFZDvt69N3uzZpuOGiieRUfcKPx
EMNiYCmEyOyesYzcyTySRarE6OdIdnCMuGZx8xSWLUf6lAWgUiQzbg1DadB+yjBk
m2kFKmmHl+bHOPTUOKHYJEnXzHZBV4gbFPdnCqaO0+OGxQLFKbGHMrutU/9/sWuc
ikXke/wV8Ta9uTnhnNmaakdDxtR9mg==
=KZNW
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
