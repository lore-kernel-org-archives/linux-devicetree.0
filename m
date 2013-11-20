From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/5] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Wed, 20 Nov 2013 15:35:07 +0000
Message-ID: <20131120153507.GH2674@sirena.org.uk>
References: <1384956732-19526-1-git-send-email-k.kozlowski@samsung.com>
 <1384956732-19526-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8Dt/lkN5I0m8i0o7"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384956732-19526-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org


--8Dt/lkN5I0m8i0o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 20, 2013 at 03:12:11PM +0100, Krzysztof Kozlowski wrote:

> +	size = sizeof(struct regulator_dev *) * pdata->num_regulators;
> +	info->regulators = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +	if (!info->regulators) {
> +		dev_err(&pdev->dev, "Cannot allocate memory for regulators\n");
> +		return -ENOMEM;
> +	}

The set of regulators in the silicon doesn't vary - you should
unconditionally register all the regulators.

--8Dt/lkN5I0m8i0o7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjNaoAAoJELSic+t+oim9Ks4QAITh22bu4KFUkdernccb4Pe+
J3BxtFhinCS1WFLgiQZp8qu8i9xTjHxxtzw+CZn8pF4/mZFnTGOptmajeoOwmbGw
hyzP2yWq0EEJafAv6fPrvYxckm7cS6iqVW0SGdIXGP4BtRpaUFjc43mOcC/Vu1au
httLzgaLFlOjH3LQEl3BYOvQSS+lu7i5UakhveW2RYITa4054YrqrOI8yxCpTuIK
f/WichGNoOCgy/+LaVJGo+B3m9xLmLdBlckDHrTVOmyaVoR5cjvPd5MKuuseN1ur
HvN7Kp1Y442/6rtBEcY1PZOmWgLwru+ZPtGIg0eKJ5OMN3TcJMVeK+T2HNqZ5P33
oigbzrn652rZ1K75ZneQL49KBFDDIEX7380xPdIGSoudqFgNQ7+LBhrFh8xKMTbm
9VKtAUJmkC+F1h+lUTeLlJyqFLFxNqWTMeG8rNeS3jD1iP0OIj925nHAPTWRXOEV
Y+EI21o+K4n9KJLYa2yFf42OaScnnkE4BguUL3S+qFzntagbXB7HZxfXlm3/SFkG
dpvg+Lsd5QiP9MpupSNitXoTRt+XSCCucTJPqZjaOLWMUe78ARcTvqE9zLVIyYnN
9MLsb5OmSaqsA15S+2/oFuNDrzKO24//h56nLsyoET0uolEA7LhRwk8kLDC+EZ1p
w5Hr6Qk1V8oTalQOHTio
=eHY1
-----END PGP SIGNATURE-----

--8Dt/lkN5I0m8i0o7--
