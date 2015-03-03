From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Tue, 3 Mar 2015 23:52:09 +0000
Message-ID: <20150303235209.GG21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F630FF.60109@codeaurora.org>
 <20150303223235.GK26334@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pTVG0ADt/DSJwUUQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150303223235.GK26334@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--pTVG0ADt/DSJwUUQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2015 at 02:32:35PM -0800, Bjorn Andersson wrote:
> On Tue 03 Mar 14:09 PST 2015, Stephen Boyd wrote:

> > How does this work for the case where we may not want to add all the
> > regulators that a PMIC supports. I'm mostly thinking about the case
> > where we want to use the pm8xxx-regulator driver for a few regulators
> > and so we omit them from the DT for the RPM regulators.

> An empty or non-existing regulator of_node will still be registered, but
> without REGULATOR_CHANGE_STATUS nor REGULATOR_CHANGE_VOLTAGE; so any
> operation on this regulator will fail with an -EPERM.

...but of course we'd never try any operations on it anyway as there
would be no consumers.

--pTVG0ADt/DSJwUUQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9kkoAAoJECTWi3JdVIfQ7wwH/1IRiUtLJlf0y5aK+8Y8w5Js
pfmRRzeOxVXecMYUHfJpAthB7dOW8NPItcgsLyl/B61X0Pj59RXzYgdfbxJVpukL
yU/d5uJEWR8MHSFOQ7UaKkzg7K83PAVPLgp75VFxFadPSfqmlqP9PldMIOZyoaF5
VWQMdcWlKEIv/8VZk+t0e08mts5fd7LXY2+ziKWGCsk/Jn86hk/A+s60BhECif9s
bKLzt9JVs4Pv5BuWHIzjXLeokNtfxrx06ZB3hDOKyG0wPnFYb2inIVCoDsLRfrRG
z8JeB/hMETBIoQ9S040Da/Vy5AgMfkvH3Q08fEJPFiCEcQXQbyTwkQUWxweOTGo=
=WQjl
-----END PGP SIGNATURE-----

--pTVG0ADt/DSJwUUQ--
