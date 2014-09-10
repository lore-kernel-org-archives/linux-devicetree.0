From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 2/3] ARM: regulator: add Freescale MXS regulator
 driver
Date: Wed, 10 Sep 2014 16:13:16 +0100
Message-ID: <20140910151316.GG7960@sirena.org.uk>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de>
 <1410089869-6611-3-git-send-email-info@lategoodbye.de>
 <20140909182211.GG3896@leverpostej>
 <540F523D.4010904@lategoodbye.de>
 <20140910141853.GA4994@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140910141853.GA4994@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Stefan Wahren <info@lategoodbye.de>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 03:18:53PM +0100, Mark Rutland wrote:
> On Tue, Sep 09, 2014 at 08:17:17PM +0100, Stefan Wahren wrote:

Ugh, this looks like it might be a regulator driver but since the
subject line was "ARM: " I deleted it unread - if your changelog looks
different to all the other changelogs in the subsystem it probably needs
changing.

> > >> +       sreg = devm_kzalloc(dev, sizeof(*sreg), GFP_KERNEL);
> > >> +       if (!sreg)
> > >> +               return -ENOMEM;
> > >> +       sreg->initdata = initdata;
> > >> +       sreg->name = of_get_property(np, "regulator-name", NULL);

> > > I'm not keen on using of_get_property here. We have no idea if
> > > regulator-name is even a string (it should be, but we have no
> > > guarantee).

> > Better using of_property_read_string?

> Yes. That will check the value is NUL-terminated, at least.

Or just remove the property entirely...  without having seen the
bindings if we're specifying the name of the device via the device tree
something seems wrong.

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEGqLAAoJECTWi3JdVIfQYhMH/3Irx/4TIbl+1jnoUIF0bmc/
0MzRdjsd1D8cTFaJsY4euQSaZYi5mXZcA0stJO0GZSinjy5kJfBPJ9vGaccXcYyD
x0pc2Os91wiMIFK7ZmO4AfBR2bF1ZVKwsoPv++bbFgA2ts4UBDbDn60g9Deboris
Xi/ACOtru1pMj6vHv+BGt+jxKR2Th36/zeCjewJuDb8YM6tL5XOyiHYotRGk+MLd
M4kLH1VkYtSEJEnO/FIWEiWXOAHbL1HniYOxe3SFq8dd+dpiyi6FRZ7bHBoA5kZS
qU+YAMxZHawTFZvNbiGh6v5LbIJ8k7n4CJIi6EOi2/y36K8voRcldj9HZoKJH4o=
=rbLU
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
