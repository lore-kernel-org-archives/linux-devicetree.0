From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 12:26:45 -0700
Message-ID: <20150921192645.GA30445@sirena.org.uk>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150919184021.GQ30445@sirena.org.uk>
 <56003365.8030803@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOr3uFpVABmJfvZe"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56003365.8030803@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--BOr3uFpVABmJfvZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2015 at 11:42:13AM -0500, Andrew F. Davis wrote:

> I know this is hard to review, and so I would like to apologize in advance, but
> the regulator and GPIO changes depend on the new driver core, as do the i2c/spi
> components. I really don't know how to split this up without leaving some part
> in a non-working state in-between patches (which I've heard is also not OK).

So split that interface change between the MFD and the function drivers
out into a separate change - you've got way more than just an interface
change in here (and you've not enumerated the various things that are
being changed in the changelog).

--BOr3uFpVABmJfvZe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWAFn0AAoJECTWi3JdVIfQVDoH/1jPkK3K6UdC0y+2cWxZEUSn
HAlj7dadTgId3bnTaizcAwVJX2vOgALNmYB3qQ9jRh2dkFy6gms1SwDYkUBslfq2
QMnWaRn6W9LdaLvF61OtV82wvI7c17+LGMbpO5ZI7o8xOGRoDs0VIfHUkhZ6jMBg
Ua3t2ZnKPLVHoq0vvenbbHL5UbClN5OR9GiXL527PrbTi4a7JcyhCtL0oTtIHMSK
YhGD0tkOJHf/lhefVgO3Ka+l04J/QEHZRfiotQ2fMoomeO0tzkvaMRs3t/W7sgiY
czeujHqoBVLniKLAbkOtfr9a51zGvugAIv0LlyUhKtfrfL3XkV7AS+82mE5AHOA=
=L/xO
-----END PGP SIGNATURE-----

--BOr3uFpVABmJfvZe--
