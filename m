From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM
 regulator subnodes
Date: Thu, 5 Mar 2015 00:33:23 +0000
Message-ID: <20150305003323.GA21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20150303124700.GN21293@sirena.org.uk>
 <20150303160250.GD26334@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qyCEDz8sjg330OCf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150303160250.GD26334@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--qyCEDz8sjg330OCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 08:02:51AM -0800, Bjorn Andersson wrote:

> rpm {
> 	compatible =3D "qcom,rpm-apq8960";
>=20
> 	regulators {
> 		compatible =3D "qcom,rpm-pm8921-regulators";

Oh, so what you're saying is that the pm8921 is not actually a MFD at
all?  Why name it like a MFD component then?

--qyCEDz8sjg330OCf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU96RSAAoJECTWi3JdVIfQJTsH/3C6CP5ixQtzfB3ePboz03LG
s3y+0PFsx9Tt6w3q75c39BfEoFISb3dMdharGgQXhU50q4q9v7yybTQaklahzPpS
ziES+YWB9VOoH6xGqlO/k5/P+B8liVMYJEOPioca/85Te4zSfeuXw3TFsKUO6c0S
k6mJTgF39WOe14ABSeBhe7SNjwvvgEHQ80DTun+ofEYYNU08DCwD25Xwk+5iqa3g
02bobO+Fw6BbTkvX7TwSviXao2EERdoWm+9h3kl4PXcqwJMJ+OcKFlPXuWwRjyAg
GRw/eentT9ku0YGGN/gLg/A+fKKvbpdugtgbXjZYssIY276D/a31VYY7Oosb7YE=
=WkUL
-----END PGP SIGNATURE-----

--qyCEDz8sjg330OCf--
