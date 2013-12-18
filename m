From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/5] mfd: sec: Remove sec_reg* regmap helpers
Date: Wed, 18 Dec 2013 17:25:53 +0000
Message-ID: <20131218172553.GA31886@sirena.org.uk>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-4-git-send-email-k.kozlowski@samsung.com>
 <20131218133625.GT28455@sirena.org.uk>
 <1387375431.1433.2.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387375431.1433.2.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2013 at 03:03:51PM +0100, Krzysztof Kozlowski wrote:
> On Wed, 2013-12-18 at 13:36 +0000, Mark Brown wrote:

> > This doesn't apply against the regulator tree.  Can you please check
> > what's going on here, I guess there may need to be some merge with MFD?

> I think you need to rebase on current Linus' (at least 3.13-rc4) to get
> this patch:
> "mfd/rtc: s5m: fix register updating by adding regmap for RTC" (3e1e4a5f3a3)

Yes, that's it - applied now, thanks.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsdqeAAoJELSic+t+oim9P04P/3OVJqBoINrcJdhGXGI9nffy
svdDDAFfug7OtCZX5e4zV/miEE1mJtJr0SRYd9y7JI8V1LVCwEUHFDvyDYe9a6lu
VJw09AWGylFadbmVY1FsHSaTWB3lIqtBP2qLvVC9FwxUyTpZgSoYJfQALqe3NK1q
yGfRKbQZ8VITpfvOwObGnaO1OfHggfx5wUjqTvoj9Tq7MuLoltxkeI/onVO6Kvlv
UZnKxHaUjyC5rwHuak54BCzI2/mE5b6C7Vy1hHBgZHxdIIdgN3ftdC8fn+r9mNUE
PTVFI1zDcbMvxnB8WwwKjk8wHQAgv34j6v/bcRYp2AAHq/S43pXWV0v/+CS6Sj9l
D0f66DK5tHwrOV0nVWvWMI1fqyredHKwVCKQMa+doJHBCQCUw6a8EZK9maHtgtjB
D3Tq5bICiXJx2+zthKcliO+Ip+eNoWNFapPQJJlcg1GGHhb4ZXAg4c/ipViScQxX
6UC3X4ma9uKBrczayFBw18uv4clnnXf8GdKr8VarKkouWw2c32NtuNniQ8HC6xh8
MIEMmpmfhj+6tIpJoT4z7hUyUyNDmpMdkLGE8VrPEMUZDVdqnJeoBPli/h8feFP/
FhhUC8Cl9hlIuvDqVKZpApPwJsqqcMtz9TNrupq+45SYJ2hIcPYs4H0gJfJAb2sC
nwRgFLMcEGBS2wa9Oacg
=D1kD
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
