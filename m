From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Tue, 29 Sep 2015 19:38:18 +0100
Message-ID: <20150929183818.GA15635@sirena.org.uk>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk>
 <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk>
 <560AD3B2.1070102@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560AD3B2.1070102@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2015 at 01:08:50PM -0500, Andrew F. Davis wrote:
> On 09/29/2015 10:13 AM, Mark Brown wrote:

> >>sure that will save me anything as my probe function is called with a DT
> >>match already, so no searching is needed.

> >You've not understood what that change is replacing, the code I'm
> >quoting above is exactly that code.  Check out some of the existing
> >drivers using this API.

> Looking at other drivers that use this API they all call regulator_register
> in a loop in their probe, once for each possible regulator, in this case
> letting the API do the DT node search makes sense. My probe on the other-hand
> is only called when we already have a DT match, therefor searching is not
> necessary and all I have to do is call of_get_regulator_init_data myself on
> the already found DT node. No need to add node names to my regulator_desc
> and make the API re-search for the node.

Oh, ick.  The binding has a compatible string in the individual
regulator bindings which is broken unless there really are lots of
variants being configured via DT (which is just not the case here).
It's not only more typing in the DT, it also means that we can't read
back the configuration of the device unless the user goes and creates a
DT which explicitly lists each regulator on the device which is
unhelpful.  We should be able to read back the configurations of all the
regulators by simply listing the device in DT.

The fact that this is different to the bindings for other regulator
drivers and requires more code ought to have been a big warning sign
here :(

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWCtqZAAoJECTWi3JdVIfQtTIH/3T4chIy5DqUEBznGkQEHK4g
iIdZ3drD8lRaXKA5mIHv5qo9fSP/x9kP3rQAgSSFJ7lsjPYKtcPMUIAFrFHtd2WT
qhxxPTJsoSvQq8YNFj5V65T0ZWM5ujn1xClPvMmZ8hbjhHmHyqZ4Oj0o9wqn8D0Z
4XVZOkbw9JHEEBne+v3m0RmbVJXYyuDjXpu6JenRDeR6+KwEVwrv/PZYd087FjVy
hXShaW/EG+pBCUH2D4eTNLnoDGiEGwZx0jEuE3/qK3kk7r38LwFH3dpBzlBlfH6r
ccW8zyvqTgLq6TmNkAWfCePbBxBkf07o64oDyWmujdQpHsVwqUEEvOK180llIJk=
=26T7
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
