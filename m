From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 7/8] ARM: sunxi: Select PM_OPP
Date: Mon, 27 Feb 2017 15:40:37 +0100
Message-ID: <20170227144037.qvys7jczmmjkgvla@lukather>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
 <e1424c55f3f8b1176f24a446936d189b00383a4c.1486655917.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3hntdeeaa72maean"
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <e1424c55f3f8b1176f24a446936d189b00383a4c.1486655917.git-series.maxime.ripard@free-electrons.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--3hntdeeaa72maean
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2017 at 05:39:21PM +0100, Maxime Ripard wrote:
> Device frequency scaling is implemented through devfreq in the kernel,
> which requires CONFIG_PM_OPP.
>=20
> Let's select it.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3hntdeeaa72maean
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtDpkAAoJEBx+YmzsjxAgHn8P/1H66zUudD9jsZUhIgNqJBYK
dTiYcYq9Rm506dkTyt+SJUePepF053SkErBNaYXstAfcSOZGJ5FtvXKiMujivUkO
gpgy20gZxHMy/x6dsh6KKKz6/qH6Ci62Yj0+m1xwF1q4P6L8e+G35ceK0UAzwJIt
KSE9n4X8d81tnr7V8uhD21Eeu3ZXML0xNeNDAYhlXjenD+qR/rmxBkhgc9Ob3uVX
oEGoHTZh4yadORENjlN9v8DiAJN1v1duWGFKkmcE4whJuc8FTGvAJACO3AfRVLkI
8sCct8aiIpPi2a12gjru9/R0FzFFeQ5OoWGKpSakBDfD7Q0FWnGUYogY4eTZDX0P
nyAc0/QpdCmrqjpr8aNFHFiF/X2QYDjGLV/PC/vYWqnl7xmdAtepj7NJH4khJQPC
aN3qX9ncu1KJXEFG14EPOc9UccPEcGQlgoX0mVsMD2vWaeZGG+x8dxG4+hKAzg/a
dE6rozbD8urCSRJmWn32KJAElvXRIqxysQphZQMRt5arfLSXlOGHuGcs1u0LBbE1
GYvhzQrrX0T5+OpNuBsLjfHLoWM8R8drkraDvnouAGcasmyDDgcsuNwTtAX2YVgn
WHEfXNv/X7fTRDaN/NMV9bJzM8d1qDLthFWMbjFS+/FNZwCEk9xBdVr8WtrkyGFd
y/E2K0Q4//8NHa60nHl3
=yeDX
-----END PGP SIGNATURE-----

--3hntdeeaa72maean--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
