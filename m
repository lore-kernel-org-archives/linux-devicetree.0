From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Document "regulator-boot-on" binding more
 thoroughly
Date: Tue, 1 Oct 2019 18:41:04 +0100
Message-ID: <20191001174104.GD4786@sirena.co.uk>
References: <20190926124115.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926124115.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, ckeepax@opensource.cirrus.com, zhang.chunyan@linaro.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 26, 2019 at 12:41:18PM -0700, Douglas Anderson wrote:

> -    description: bootloader/firmware enabled regulator
> +    description: bootloader/firmware enabled regulator.
> +      It's expected that this regulator was left on by the bootloader.
> +      If the bootloader didn't leave it on then OS should turn it on
> +      at boot but shouldn't prevent it from being turned off later.

This is good...

> +      This property is intended to only be used for regulators where
> +      Linux cannot read the state of the regulator at bootup.

...but we shouldn't say "Linux" here since the DT binding is for all
OSs, not just Linux.  I'd say "software" instead.  Really the
expectation is that things wouldn't support readback at all, though it's
possible there's some weird hardware out there that will support
readback some of the time I guess.

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Tj68ACgkQJNaLcl1U
h9CRrgf+OhK++Wg53aKS5GOG5Scxu88CKfhRSgAezLcnGjLTBX16YijOdZNEM3yX
+eknFRwLl189sJOTSGpO+skgW1BNVYJac8PHCk8wviVL5APiFqIMkGNNIcPQZnQc
gJQFBLCnBO6RSqMiT98i0YK5Qes492NNap2lWKl+a7OvwXHo4onrdE9oYZcwmMVj
DqsJAf+7VPG+BT1nIqJVL4jTuZeAWFyWMKaUMDFWmWev0RDEMF+bHXFMf2pFtkzj
LfvVrsc7/JgU35ruEO3vCrJnDOS1Z4mplIKKFiAn/41OByNYePUx0RzdOHwinpT8
Q9w5NkdPaasBpx6zg7XiXlwSjLScfg==
=INGH
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
