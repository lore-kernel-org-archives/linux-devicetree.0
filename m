From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Fri, 12 Aug 2016 10:21:20 +0100
Message-ID: <20160812092120.GY9347@sirena.org.uk>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
 <20160810114140.GJ9347@sirena.org.uk>
 <CAJ+vNU3s=qxJr8x=ScnyEV0UKkD_gTOnMyY8oGuzVs14hTW0Ng@mail.gmail.com>
 <20160811094509.GP9347@sirena.org.uk>
 <CAJ+vNU3k5mg37WxsZFOMRjH-JXU_aEwwYf8ewOu7ROCVYueqbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7WMexqIhC8AwFtpM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU3k5mg37WxsZFOMRjH-JXU_aEwwYf8ewOu7ROCVYueqbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jaffer Kapasi <jkapasi@linear.com>
List-Id: devicetree@vger.kernel.org


--7WMexqIhC8AwFtpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 11, 2016 at 01:48:21PM -0700, Tim Harvey wrote:

> regulators must have a non-null ops field or they will fail
> registration so I can't just not assign it. What would be an
> appropriate ops structure for a always-on fixed regulator?

OK, empty is fine there.

--7WMexqIhC8AwFtpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXrZUPAAoJECTWi3JdVIfQmHsH/2hP5o5iINkXum957k/sTBI6
OmweWvDRs5zoyZt0Otc1gWj9sP4rLQbGMDZlq9bAK0TRC4XVdcWWU1OT4RR+Eo7l
6vN1d5j0iKSp7MG1ifrlOPWm2CROeJ4xwpd8vdTtIAXVptXugG0nLmmlPq9Jf1jA
vXKIh0TLcHCu8oEaia40Lt4O6g00qTezoFteAilXB+eHb/u6Suf2tu9yBPpqJUKK
vJXGWJ5+j+BXx9w9pLvyBav/ZV80YAuc4COX0jvqNeYe7LinRyUewfvk4s6m+jAY
B4zHfLeK0faJOT8qwiXChk1g+dA8sQwNyjaFxaZ8oLiC4Iq7UGTNqoVegBlhiDA=
=Qyyt
-----END PGP SIGNATURE-----

--7WMexqIhC8AwFtpM--
