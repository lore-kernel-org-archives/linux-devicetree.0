From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 09/11] [media] marvell-ccic/mmp: add devicetree support
Date: Mon, 5 Nov 2018 10:20:16 +0100
Message-ID: <20181105092016.GM4439@amd>
References: <20181105073054.24407-1-lkundrak@v3.sk>
 <20181105073054.24407-10-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105073054.24407-10-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>
List-Id: devicetree@vger.kernel.org


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-11-05 08:30:52, Lubomir Rintel wrote:
> The platform data is actually not used anywhere (along with the CSI
> support) and should be safe to remove.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Pavel Machek <pavel@ucw.cz>


> +	} else {
> +		/*
> +		 * This are values that used to be hardcoded in mcam-core and

"These are values"? "and it"?

> +		 * work well on a OLPC XO 1.75 with a parallel bus sensor.
> +		 * If it turns out other setups make sense, the values should
> +		 * be obtained from the device tree.
> +		 */
> +		mcam->mclk_src =3D 3;
> +		mcam->mclk_div =3D 2;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvgC1AACgkQMOfwapXb+vL+1ACfSJLXt+lTZ7EuD71lKBgEC2aY
CmUAniSv4VHkCgne0aAYDEZY3hFeFunz
=JHwO
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--
