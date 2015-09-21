From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 12:54:57 -0700
Message-ID: <20150921195457.GD30445@sirena.org.uk>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150919184021.GQ30445@sirena.org.uk>
 <56003365.8030803@ti.com>
 <20150921192645.GA30445@sirena.org.uk>
 <56005EAA.3000208@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2mUf73N0HmzM2Naa"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56005EAA.3000208@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--2mUf73N0HmzM2Naa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2015 at 02:46:50PM -0500, Andrew F. Davis wrote:
> On 09/21/2015 02:26 PM, Mark Brown wrote:

> >So split that interface change between the MFD and the function drivers
> >out into a separate change - you've got way more than just an interface
> >change in here (and you've not enumerated the various things that are
> >being changed in the changelog).

> I'm not really "changing" anything, this is a ground-up re-write. This
> fundamentally changes the way the MFD core and the function drivers interact,
> I would consider this a whole new driver that just happens to replace an older
> driver, not a bunch of incremental changes although I kept the same filenames.

So split out the deletion then add the new driver like you'd add any
other new driver.  If there were in tree users even that would be really
problematic but it does seem like we don't have any so perhaps people
will be OK with this.

--2mUf73N0HmzM2Naa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWAGCQAAoJECTWi3JdVIfQyxMH/i33R5jUiNorkBT6pUyxYU3j
jzABa8WNQZY/5fMb6rVNr64QEfOicaf6bLOtW7//9Fx9FMcbcoiIsELp0ytzj/n/
3MF9ZnjYKWp3Cm8opGbhrfDelnNM+5T4zF3J/8aV6yLjGjq00UkxREF+ohRd6tDU
tnTOUQ3qSgTmipqi4lL2SpBU/d65v7ZBEaDt3GCMfd/ETrtG5knAgdXPUzT9Hnc7
xxE3uy6AuPss94jvTZjw2Z4ALGrF/74kdJx5Fi4vI2z1fTl6K5SyQmf2pZ9RKOA1
Pd3azGQ7heIsCYXv/YG1/01VqI1SEpT7XUDpIADv+HgA4DrFprL4otgg6PEZ+zU=
=iNq5
-----END PGP SIGNATURE-----

--2mUf73N0HmzM2Naa--
