From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv1 1/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Tue, 16 Dec 2014 23:05:11 +0000
Message-ID: <20141216230511.GV11764@sirena.org.uk>
References: <cover.1418687005.git.arno@natisbad.org>
 <db1f0eecbdc5062a61232b99699ecfa6e0a2a956.1418687005.git.arno@natisbad.org>
 <549004B9.2060402@kleine-koenig.org>
 <87vblbdcii.fsf@natisbad.org>
 <5490A873.1000706@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kTSzC5IcQVJlHX++"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5490A873.1000706@kleine-koenig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Arnaud Ebalard <arno@natisbad.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--kTSzC5IcQVJlHX++
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 10:47:31PM +0100, Uwe Kleine-K=F6nig wrote:
> On 12/16/2014 01:07 PM, Arnaud Ebalard wrote:

> > no, it is for this patch. I did a specific commit message for the second
> > patch. IIRC, it also has the example if it was the meaning of your
> > question.

> Is it usual that an rtc can wake up a machine from shutdown state? I
> thought it isn't.

It's fairly normal when the RTC is integrated into the PMIC - the PMIC
is typically the component initiating power on so it's easy for it to do
so.

--kTSzC5IcQVJlHX++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUkLqnAAoJECTWi3JdVIfQ1e8H/iGD0sitYuaBmbcfm2OZm7dm
/6Tv6YhCVbgnd6uuQLBMB5oMrwEwkiCxUe2FqBkZIta4tLdT+ydAiVecsqyGMZ0v
cX6U/oj1mTcohyINSPUgku2b9vCY9XGrzZs6HGQRFOoXNOsWj6H86AwgVkqFkRK/
5D+m7ZpGOtYzD0kGjoyF0Y1YYL9puqTJHzFDtlsIMV+4bdrbpyuDeGw186GXpJR5
VQtI72ucgJ88pGFk8BozCrrbfrs15M1MArDikqE2TO99PMODTYFOnv/b24Wqvx9J
p5M9wmUgwOWl52TpI+1JOE9qLLZ2EJNM9Ni1Tv9YUng9ATE5+7d1HOY9X8YSRCQ=
=YQDo
-----END PGP SIGNATURE-----

--kTSzC5IcQVJlHX++--
