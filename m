From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: qcom: Refactor of-parsing code
Date: Tue, 3 Mar 2015 14:13:21 +0000
Message-ID: <20150303141321.GQ21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5tnu7VSDgXc9ikuK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--5tnu7VSDgXc9ikuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2015 at 08:25:39PM -0800, Bjorn Andersson wrote:

> +	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
> +	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
> +		dev_err(&pdev->dev, "no voltage specified for regulator\n");
> +		return -EINVAL;
> +	}

OK, so it looks like we're using it because we can't read the initial
hardware state - can we introduce a specific interface for that perhaps?
A call to query the current constraints might do it.  Or possibly just
change your earlier patch to make sure the constraints are marked const
would do it, reading them isn't the problem that modifying them is.  I
might've missed some other usage somewhere though.

--5tnu7VSDgXc9ikuK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9cGAAAoJECTWi3JdVIfQqPMH/1MW//txR1gZQ2urDGVno1/Y
c56+nkBe99AyV7efubfMvDh0irWWdDH47vA/KaOZuIU8NVZnOPGz+PGtKBR7/lxj
ZuwhX/zGC27RSQvFZmO0p9BcjdZUzGgSSmiEqWeqw/eZFbyiCfJsVKvPuGbQg1va
ue0iYRWcQR6WGwjM9jbDHvDCEMbcyVe0605FOW/+9cEwYCehZOy7i4LnpjreovFp
K57zMo9ytc6mfFxPV5InyQFM5w8OVTVbD0DoHKx6jkra1e3iRbO/bN7CcSQ0wMQx
D3b9R38drxGtcHnzEiRmhhE9uOq8JDrI2CAK6sfGv4PrIctkZu8XLozpCE4SQHs=
=Gq5G
-----END PGP SIGNATURE-----

--5tnu7VSDgXc9ikuK--
