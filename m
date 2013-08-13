Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52595 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758121Ab3HMTDW (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 15:03:22 -0400
Date: Tue, 13 Aug 2013 20:02:55 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130813190255.GF6427@sirena.org.uk>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wjVsQm+Lgir5jV8i"
Content-Disposition: inline
In-Reply-To: <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>


--wjVsQm+Lgir5jV8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 02:58:26PM -0300, Fabio Estevam wrote:
> On Mon, Aug 12, 2013 at 9:01 AM, Nicolin Chen <b42378@freescale.com> wrot=
e:
> > +Required properties:

> > +  - compatible : Compatible list, contains "fsl,<chip>-spdif". Using g=
eneral

> Can't we just use "fsl,fsl-spdif" instead?

It's better to list the specific chips in the DT so that we can quirk if
we need to later. =20

--wjVsQm+Lgir5jV8i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCoLbAAoJELSic+t+oim92QEQAJtgHlioikbwNtas7ayRGfgb
rZQXCz6RCD/YbZ/BGScMsb8j/NyuxpNGeOu/icmId3IOQfu8CZw84Zw+1swL/hue
LzVlUbrbd+miFgMAvK4PYSYLv1Pb8y6TMUxfncroYXqxtJJPRFd+8wFH9lEqdAYK
QeKmxP426/W6dBzhTx/6fJxvsxNpCDahuUwi/GHPCUvEwkoFOl0UjqYNM22H9v6X
lHzsk7mO3Z4Mo4iWbs9YZGZjNOD95tOL4891OQGk6Fq+brVK3ID8xMtwLqyg/K38
gua4xLXbcnF0BXxNtvxFlXZu2gISQuopwj77oo/A5/HTtFh0Gn0cQKk+OU3mSN7X
QIy+uLS61e1WWT8D6E6PKl5lcuFSnTDHS57Ep2eH9YWNnRYYCVwE8QGKMEeOQ9PI
UcQOhz8THEN3eOTbB0L3of//hleDJ6c6bVeR+PH+j+QH2JhP7Y5SvcDGyz9sl9SX
QJ9Ir/zxn+/895UKzDzi4MvebaqswIOiY2w/387MxAXH49HqVoZFtHb76w1bv9jT
naiQk09BbhMcTNUDGyaslt94lXDWnzDHtJpzlSDV6+/0i3VM7mrpTplWOreIQKKT
716mwhN8zMyXK8KjT+b/px4jt/RBFlzgMhAJ69UNyjKVdFkK0J1l7ap6smGmGyXS
stdX2YGidR3c1+x3YekH
=pf6Y
-----END PGP SIGNATURE-----

--wjVsQm+Lgir5jV8i--
