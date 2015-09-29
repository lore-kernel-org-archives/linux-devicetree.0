From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Tue, 29 Sep 2015 16:13:20 +0100
Message-ID: <20150929151320.GT30445@sirena.org.uk>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk>
 <5605AA1C.3090905@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dBO7RQoQeylDOh0t"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5605AA1C.3090905@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--dBO7RQoQeylDOh0t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2015 at 03:10:04PM -0500, Andrew F. Davis wrote:
> On 09/25/2015 01:05 PM, Mark Brown wrote:
> >On Thu, Sep 24, 2015 at 09:52:53AM -0500, Andrew F. Davis wrote:

> >>+	match = of_match_device(tps65912_regulator_of_match_table, &pdev->dev);
> >>+	if (!match)
> >>+		return -ENODEV;

> >>+	template = match->data;
> >>+	id = template->id;
> >>+	init_data = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
> >>+					       &regulators[id]);

> >Don't open code this stuff, use the core DT matching in the
> >regulator_desc instead.

> I assume you are referring to your additions in a0c7b164ad11? If so I'm not

Please don't refer to commits by ID only, include a human readable
description of the commit for the benefit of any humans who might read
your mail.

> sure that will save me anything as my probe function is called with a DT
> match already, so no searching is needed.

You've not understood what that change is replacing, the code I'm
quoting above is exactly that code.  Check out some of the existing
drivers using this API.

> >Please also use subject lines mathcing the style for the subsystem.

> I'm not sure I know what you mean? What is wrong with my subject line, it looks
> like the others I've looked at?

You are using "regulators:", the regulator API uses "regulator:" - this
should be really clear if you do something like a git shortlog.

--dBO7RQoQeylDOh0t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWCqqPAAoJECTWi3JdVIfQXyYH/jsAgXlhyWqBDDO74YxEDUrs
GMql3c0AkUuqzocdOlY3Q4GL5k7AxblNcTPWGD/iMG1SoCuAukOUOaqjRcQpGfRa
4uz5E8NGa2i8m4L281hicghhT0Bhr7akuDJXh/IE/H6ua9tzi0Vcv7bCMyH+gc4G
ypKSUAVllZTXE1EKBw7gZXz3JQJ6Zx/RxLy5HmupKbKJK2zqHp5gNQ7Wn5E6hHIT
7OWiajHR1lfVfpmboP5nl/58WVGrTiNgJ9bjK8smBUNBj2njt/Q64cEyJ3Khcs+L
YtCmIg8f8EHln3TCpguic17VTRqPaF4W+zlqPcmKKYkHc/psFAAjVqRktRR8gbQ=
=7DKR
-----END PGP SIGNATURE-----

--dBO7RQoQeylDOh0t--
