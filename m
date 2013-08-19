Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37463 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087Ab3HSKwh (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 06:52:37 -0400
Date: Mon, 19 Aug 2013 11:52:01 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130819105201.GB30073@sirena.org.uk>
References: <cover.1376901081.git.b42378@freescale.com>
 <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
 <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
 <20130819095042.GA11402@MrMyself>
 <20130819100143.GH3719@e106331-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4rQ9lIe3OahbhU4J"
Content-Disposition: inline
In-Reply-To: <20130819100143.GH3719@e106331-lin.cambridge.arm.com>
Subject: Re: [PATCH v7 2/2] ASoC: fsl: Add S/PDIF machine driver
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Nicolin Chen <b42378@freescale.com>, "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>


--4rQ9lIe3OahbhU4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2013 at 11:01:43AM +0100, Mark Rutland wrote:
> On Mon, Aug 19, 2013 at 10:50:43AM +0100, Nicolin Chen wrote:

> > The phrase "user-visible" is being used in many current docs, I don't=
=20
> > dare to change it unless a sage gives me a suggestion.

> I can see that there is entrenched usage, but this really seems to be
> embedding Linux-specific implementation details into the dt. I don't see
> why the driver cannot select a sensible name, but perhaps I'm missing
> something.

> Mark, is there any reason we need to handle the user-visible name of the
> device this way?

This is intended to allow userspace to distinguish between systems that
are electrically identical but physically distinct, for example when
multiple systems are derived from the same reference design.

--4rQ9lIe3OahbhU4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSEfjOAAoJELSic+t+oim9ZrUP/0YfOli74A4vtrIcU2c4qCAa
mS4mAGH9qBXN/qL65qvdmA7B/4TtW6u0fPFqfihDMz4Hlp3fNDdFHnKKhVynpcVb
3eUo7bBM5x26ScwBJY2578O1jjn5pBpNYSNvZdZRniSsxDLp6cBIYzwquALgeds9
AOoz0yeuhUj4RVpc/e8gJW5q7tPSUj85zvVzTGOq3vU90Rg9XzbHkVFu92EF8tYY
83kZDq55QsItcVtKMq2lM7UrByC0f47/Lu55dMJ/hmRgLFtzDrp42b3O9mpBjBVl
9XW6hk97l3QYyM6OuMWaS7BIyP/olqdl8PdPBqS3m/afgKXR43xpavXxV/E6JKpW
+0xxXxXTQ5utzX9FgdSX6r6JX9y4px77FZAORoGujTOujZOyPVGmkQQjY4yrQBup
gORILLWUmWVa2QCifbyftRwpulQNCHTlyfMcLDbwyGO1rkq/jgGiNJQkjVWbBpIn
mCWOfhb8t4Xcgo3ZsIjoejBiZ6/HnbdXUYiE1jbyG7xrbcuseynLeaKX2KjZ0HzW
0DVaiGsY/okSt0e0m08LuYtyNigm/EldXfRQJdQWr947UtggZKUx+4sbg+188BoF
G/eAnq3uUBGdAJ/d60lxiddOVm8NwNe2OMjZuLrRR/q2CFsuW3AekLg8kaWz+E4f
e5/lJnFoWFfU6/4E0j0j
=lMy4
-----END PGP SIGNATURE-----

--4rQ9lIe3OahbhU4J--
