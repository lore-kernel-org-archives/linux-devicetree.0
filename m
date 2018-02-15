From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V2] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Thu, 15 Feb 2018 11:09:36 +0100
Message-ID: <20180215100936.dz62mm3h2zbsuf2j@katana>
References: <20180215100301.24744-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ylv4lyanihnbmzkb"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180215100301.24744-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org


--ylv4lyanihnbmzkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		stdout-path = "serial0:38400n8";

Didn't you want to change U-Boot to 115200?


--ylv4lyanihnbmzkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqFXF8ACgkQFA3kzBSg
KbYcsRAAp/DDN2P74kmG2607NMwomgRRFCCRCpVXrzVh+at+k/0NLD7Kw6sQuHQT
TeUp+z2qiMmblAS/FE1ktngXBPCDbmwF6glLJ21I1HmGvK3f8DBClw8gZNK2OlA9
tyXzMLg2VSeM8C4ja4nywDeWi3UQC3H8h6KXAJPGl95Uo5AOUsZJ4hIXFRxwZwfR
fDexJHk1oy1BRc1btSoaAbNY1JI9QYZ71EzIAl+XSBH/DnkCRfL1hCHJJOp1Jhin
6lCvWBGdm1eCjq39UhUFfCAxSYEs78+M/AcPkX3fLJHxax2mUD6VUCIUINl0R+yN
iVpmEmckQp3CXQjBNhMq8RwX0JEUTaWL9sc4BVNZhq0SLLkk0vH9GQKxXCT3KT6k
CVhA/5I2g5rou5mRyogV4ptCeOyjwy9FtkjTqkia5N8ifNKHEVcbViOeqpYoqoOT
IwF516VVOQmMYiS8vLDa+4q8bCmjYnPbVp/d/t8UrJiqwJ3zPzBZO8NPsYtIrT7G
MED3l/0zxpIMtqzZsNYSWtAor8bECKnzoNqQgRuH/QqobPRUeW5iozcANoQeNaRt
hrd31g43rQ5z3YAonsHeeHHbzUMLP8oEPm++4lbbmZRddBwpgdhY6f4QVJEJSYTQ
7/UFjP/YthcYJhIjwV4kBCMuK339/3RwMJ+6KUV1pJv/2c2Rpkw=
=/z2D
-----END PGP SIGNATURE-----

--ylv4lyanihnbmzkb--
