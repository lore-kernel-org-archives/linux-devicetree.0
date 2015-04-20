From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: max8973: get rid of extra variable for
 gpio validity
Date: Mon, 20 Apr 2015 16:06:05 +0100
Message-ID: <20150420150605.GN6023@sirena.org.uk>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
 <1429534457-15515-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q/1MAkI9S5Mtv7sU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429534457-15515-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--q/1MAkI9S5Mtv7sU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:24:15PM +0530, Laxman Dewangan wrote:
> To find that dvs-gpio is valid or not, gpio API gpio_is_valid()
> can be directly used instead of intermediate variable.

> Removing the extra variable and using the gpio_is_valid().

This still looks like it's got the same issue with not doing the right
thing with platform data that uses zero as a default which is the point
in having a flag like this.

--q/1MAkI9S5Mtv7sU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVNRXcAAoJECTWi3JdVIfQq+0H/3kfB1L1y2Tmy4CGeTpy2OHq
MZLzDAyujZ6lWG3m+r3u3D2Ib2Y4r8H0Oq6P+jrTm6bUsrjga2EtAn0jnrGjvmsg
olpOWGeo8C70OM3H8L0jkKRdOXx+IyA6Dm8GxRcxXPJcxR3+XUAKYJamYpfK2ExS
cShx+CmuCbWcDFQout8jXQFzUE111PIMkt/GkxI/Y2XItIow2cqymvWQ7RCC5Igx
ym8kUIDpYHUb/UTcAMd2/lFgGEND58BJHMy5H3FZZPJOBQiFwz5KU/UhDTuEkl5Q
mA3R45EpvxYdU9fJJEO4U7Koq/HuAHuPWQ7yJeb4TIf9pYpnJ9lgl+C5w0AWmfs=
=/SoK
-----END PGP SIGNATURE-----

--q/1MAkI9S5Mtv7sU--
