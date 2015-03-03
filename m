From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] regulator: core: Expose init_data to of_parse_cb
Date: Tue, 3 Mar 2015 12:50:33 +0000
Message-ID: <20150303125033.GO21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KJtrLAZG9Uo4yONd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425356740-26285-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--KJtrLAZG9Uo4yONd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2015 at 08:25:38PM -0800, Bjorn Andersson wrote:

> Expose the newly created init_data to the driver's parse callback so
> that it can futher enhance it with e.g. constraints of the regulator.

Why would the driver need to do that?  I guess I'll see later on in the
series but the changelog should make that clear.  Drivers aren't
supposed to ever need to look at their init data, modifying the init
data from what the machine provied is usually a red flag.

> This is needed because calling regulator_register() with a of_node and
> of_match will overwrite the passed config->init_data. An alternative way
> would be to merge the parsed init_data with the driver provided one.

Put any explanation as to why the feature is needed in the changelog.

--KJtrLAZG9Uo4yONd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9a4YAAoJECTWi3JdVIfQZoEH/3lwClkjHbGDJ7wBqZOVxxm8
2yWkgC5egQwPhr/L/NuAPGoVVEeKgz/m5Y6NOoOxhJNalxvfyUfConPJU1Se1JpA
nSCoi+WNX+mXztApOai8ClxeikHRfxRac4xze22+wRmByTv/ht6HR22aIyTmDnQA
2d2FyGzhEVxV7TNzojPIWN4GIMeMRkOXPbx7Cf8eWEguF1tcQXaua5wpxPDfYUW/
WvKZxxmykBu9Rrz3QDRNeXmzJ1jhXp97LcXBufTS8IwVR3/Pv38QRUhAG/MWBa6z
Tyc/ZIRG9cLNKemXNgsvNOxwTvW1ceHwVi/yJOb3w0SWWlXtO36RDgRJvRUizqk=
=EUz0
-----END PGP SIGNATURE-----

--KJtrLAZG9Uo4yONd--
