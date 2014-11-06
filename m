From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Thu, 6 Nov 2014 06:07:16 +0000
Message-ID: <20141106060716.GS8509@sirena.org.uk>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
 <20141106055017.GL8509@sirena.org.uk>
 <545B0E53.4020003@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABd7dauUP597Mpr3"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <545B0E53.4020003@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
List-Id: devicetree@vger.kernel.org


--ABd7dauUP597Mpr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 05, 2014 at 09:59:47PM -0800, Guenter Roeck wrote:
> On 11/05/2014 09:50 PM, Mark Brown wrote:

> >I can't help but think that toggle is a confusing name for this.
> >enable?

> If I recall correctly we had this argument before. Problem is that the
> function can also _disable_ the alarm, so to name it enable is just
> as misleading or confusing. update_alarm, maybe ?

update seems reasonable, yes.  toggle I'd expect to invert the state.

--ABd7dauUP597Mpr3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWxATAAoJECTWi3JdVIfQVf0H+wddQ6du6ZGmqMpaNZw2umDq
WnBpZW8YPeoMtbcleARYNmY1I1zftVH4dOlaAntdqMVZUiHkFespg9yLhZI8WzwY
uEvARCirtowMz7lY86l/3lDUK8/xO2e6i7+c5giV9ZbAUo+7eYQB/gU061J4oiB7
wwPs4fi0zmbtGOIHebNKRCjUcpIsv4t7FtVmv1amdBQRnt0bsvrLFVGJRaudhyrG
HW9oaC8ur1iu8j2tkCFhp2Q9/9UWYzRBuKbilNur6EfSaanTPlG+dmTXuIKtbFqG
ohv9UdEUcQj5hhI6joFalcIYEWtBNvz4IZ+t7H/E/pkpZCMlIliwWXEKY94VLTI=
=D6Id
-----END PGP SIGNATURE-----

--ABd7dauUP597Mpr3--
