From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv0 2/3] rtc: rtc-isl12057: fix isil vs isl naming for
 intersil
Date: Thu, 6 Nov 2014 05:32:53 +0000
Message-ID: <20141106053253.GK8509@sirena.org.uk>
References: <cover.1415222752.git.arno@natisbad.org>
 <2ac5b475fd757ea771296ea0731de75d963999ef.1415222752.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ac5b475fd757ea771296ea0731de75d963999ef.1415222752.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 05, 2014 at 10:42:41PM +0100, Arnaud Ebalard wrote:

> When Intersil ISL12057 driver was introduced by commit 70e123373c05
> (rtc: Add support for Intersil ISL12057 I2C RTC chip), the vendor
> prefix 'isl' was used instead of the expected 'isil' (Intersil
> NASDAQ symbol). Recently, a patch from Philip Zabel (7a6540ca856a,
> ARM: mvebu: Change vendor prefix for Intersil Corporation to isil)
> fixed that prefix in ReadyNAS devices .dts files (AFAICT, the only
> kernel users at the moment).

They may be the only in kernel users but someone with an out of tree DT
may be using the existing prefix, we shouldn't break compatibility with
them so we should support both compatible strings even if we want to
deprecate the isl, one.

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWwgAAAoJECTWi3JdVIfQ9B0H/ilH4H04ZTVxLZtDAxgifSmn
1S1F1/UxL1iylzbz1GFjLC6JytjP+v//ItKc0tfPdR69Ndaf6zZKsIuOjoKBDvUI
yfN892DIRw8Vnth4+j9qPKS5Cul2DFhbZnVC75LUUX/QMavYoxXz5AvDt74IThCb
yRCxhWCFxWteJRyHM8QC9vmuymxAwn0f+PFJFP5WUMt1sw9SG8h3gHVQizbGp9N6
+zY1FnlQOA0FhUwRBAC2h81kzUE95oLv+jrElMPH9xym1una4yadNbivbcb5ICeE
e5IKa2d6jJHxmoIS1ApjKEm5T1xXmTvpRUiEd3VBfdRm/Grs8BLq/Wkb4x31ugw=
=bvP+
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
