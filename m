From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: max8973: get rid of extra variable for
 gpio validity
Date: Mon, 20 Apr 2015 22:19:39 +0100
Message-ID: <20150420211939.GQ14892@sirena.org.uk>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
 <1429534457-15515-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hHiQ9nAwW5IGN2dL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429534457-15515-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--hHiQ9nAwW5IGN2dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:24:15PM +0530, Laxman Dewangan wrote:
> To find that dvs-gpio is valid or not, gpio API gpio_is_valid()
> can be directly used instead of intermediate variable.

Applied, thanks.

--hHiQ9nAwW5IGN2dL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVNW1qAAoJECTWi3JdVIfQd0oH/3drixNTuc6hzo1hHfN0RqOT
1223cog50tSSITkIjnhLGYagzypDl5jvvYTd8GHGXvIKm8A312BZ6Op4bC9vwJiC
fPmvvu8eCy+Tnu40+HkWpLzOOeAGWj1Ru2I716o7dYVHWxh1ep/zWsFVyM8wfVY1
btDe7HyTNqrMsqUUPDWbY/Xcl7fNhW4UimyeV9NbTmQn97WaZ77M8TDkEMx9X07O
cPdd8N27OOCNOpWZZcrgkGq0tkiDauFCxyJcBMHchastfXJ2Nbb9MJLn+hbf0VT9
MOxfNYzj1VSTI1tzH3zg82O+ThUJYJDhgk1RnK5YTPacYRm0i6E0miNd+3VkHA8=
=CHRj
-----END PGP SIGNATURE-----

--hHiQ9nAwW5IGN2dL--
