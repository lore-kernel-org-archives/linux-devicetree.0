From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Wed, 4 Mar 2015 00:09:55 +0000
Message-ID: <20150304000955.GH21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F630FF.60109@codeaurora.org>
 <20150303223235.GK26334@sonymobile.com>
 <20150303235209.GG21293@sirena.org.uk>
 <54F64B67.9060608@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b8eDURjBVdu3Id7y"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F64B67.9060608@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--b8eDURjBVdu3Id7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2015 at 04:01:43PM -0800, Stephen Boyd wrote:
> On 03/03/15 15:52, Mark Brown wrote:

> > ...but of course we'd never try any operations on it anyway as there
> > would be no consumers.

> Yes sounds fine. The only concern is that we're probably wasting memory
> with things that won't ever "match" something in DT.

You still get diagnostic output about what the regulator state is which
is useful in itself and the amount of memory involved is really not
enough to worry about in the grand scheme of things.

--b8eDURjBVdu3Id7y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9k1SAAoJECTWi3JdVIfQpwYH/RHyQO6r3YNNFE+RFyKuDadu
SUPdJTfu0EzCy9gp8pJ+NbX6aXh9UROwVMBpWOzKK6qc6w49S0cVEEBip4/9O2pD
AKR7jeEaWqKhkoDEMWCwVvoAc9ZpAT+qmhQKrZLS2e7wYBOWrxHJX6px2TApL5wo
Fd33WeS8EtYzq5zluUj5mHMva7VLSH0XvH5TsIrGlEf4LfvL0FNuGPTKI/JSzobg
oNSTSdKCizZ3/zk26BnYCN/TZfA4qCTB01CPXVcQs0DF11WfTun/gVh0KiBrVx9d
te6XOLof+pA5X1Udgqjoma8IYJcaCC0/VmgSEz4zsFqnzvMLo0SdVCnN5X/B+lQ=
=kMEW
-----END PGP SIGNATURE-----

--b8eDURjBVdu3Id7y--
