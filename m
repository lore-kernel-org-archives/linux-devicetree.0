From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Tue, 24 Nov 2015 12:11:55 +0000
Message-ID: <20151124121155.GK1929@sirena.org.uk>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk>
 <5650D6D2.5060108@ti.com>
 <20151122131321.GM26072@sirena.org.uk>
 <56534FA7.2040200@ti.com>
 <20151123190026.GS26072@sirena.org.uk>
 <56536677.5070102@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OOq1TgGhe8eTwFBO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56536677.5070102@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--OOq1TgGhe8eTwFBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2015 at 01:18:15PM -0600, Andrew F. Davis wrote:

> Right, so this is the kind of description that would be nice with the
> declaration.

Feel free to send patches for the documentation, bearing in mind that
there is a limit to how large we cna make it.

> >>in the config takes precedence over the one in config->dev, the
> >>opposite is true for regulators, this is very confusing and should be
> >>standardized.

> >No, they both do the same thing.

> I don't see that, config->dev->of_node is checked for the init data in
> regulator_of_get_init_data, then config->of_node is then ignored if that
> succeeds.

Right, like I say this is because nobody should ever actually be using
that capability if they also have good bindings.  If anyone did have a
sensible use case that'd be where it would go but as things stand they
will be pushed to do the right thing.

--OOq1TgGhe8eTwFBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWVFQGAAoJECTWi3JdVIfQdmQH/3+Frbwh9PyJ+y+ZLzrKNwro
ud0849OraOtw08iASbo+4a7nDlWfryqyEzd8SWgInpI4yA5xWtrrJKrLKWNZOvaa
w5qf1KmL5sR4Qc9kTXZrckLLvv+ERQHKo3fc0AB8HPTrw7p9Zn8f+dNzliTF1IYY
Ee5mS06rz1Zc8oQ3y59ozmL9K3D4IO5YmX1GDTEf3lkbBCIRxFL9ymlGa8FFNMI7
a/fr7mhLvwFCsBLyN3b52wNthsyoIpugqkuFx8OlUt43FwylfC1G7Yig3SsNWANJ
nFIidMmzgzcx/t1b4yfNT0u4bYGBoTJQ6UPI0wL+1HfmVaJeocPl5M3rvD3aEPU=
=PHWn
-----END PGP SIGNATURE-----

--OOq1TgGhe8eTwFBO--
