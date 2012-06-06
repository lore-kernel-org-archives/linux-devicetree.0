From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v5] MTD: LPC32xx SLC NAND driver
Date: Wed, 06 Jun 2012 11:42:48 +0300
Message-ID: <1338972168.6875.7.camel@sauron.fi.intel.com>
References: <1338837901-24075-1-git-send-email-stigge@antcom.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-WzbfxerG2eTWwgqj3ru0"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1338837901-24075-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org


--=-WzbfxerG2eTWwgqj3ru0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-04 at 21:25 +0200, Roland Stigge wrote:
> +config MTD_NAND_SLC_LPC32XX
> +	bool "NXP LPC32xx SLC Controller"

Why bool and not tristate here? Why you force this to be compiled-in and
make it impossible to be a kernel module like other drivers are?

--=20
Best Regards,
Artem Bityutskiy

--=-WzbfxerG2eTWwgqj3ru0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzxgIAAoJECmIfjd9wqK0S/4P/isrXfnJuvL9Wq8WDK5jgLdM
J4DgBmJrPVSYPeMU76fZGK46zMCEb76K45x8jCTkm+sXiRM2ET20sBMIlCByOc1U
nV1tE1dA9ux6oXa3ZaCdAPxGUIWPW0Es2blqLwUu8C6VtIiIxGFrQBUHpEeZ0iTJ
/bg2L38QnTmt6nWhNMzCIaHOGYoXz/OlHizEmi640/S0JWK5wNHGmuJ3oDxVdbbX
0QoH7NcFq+kIfgUe/Fp+g051apSqc3oQ8oMkrPQidx6kishQnz6OlzlV+Lif8W2r
Nv/gYIBGWbNtLjUVjlwOf8whdi/EvZz+jpp7kM0DlxUF4s/PBMbGebNbp8cUmnqJ
e9UzETGdH9w+mmE1Wp7AtU9oFQCGe2Wk+GLI0mac22kl5aF4Wm8naAcrb9PWALb5
/2zg8yC02ZvlcMPPpVkdcISB4yhO46Lt2FWmiD9/QwPtSjE0pL2I8dG51zrBtkoA
vvuFYCs42B1ls/B+6db9u3QW546Rdm2glNASHoBCXwyskI6HTZxUv8jE5VEbWLFj
COTn0v82HJi00oX0msJ8gAhNKoAK3w5CTPqExkEOStkN0gCzHAXUi8TqfP/jp0g+
CRJRYM19J2A0wLS7fzchpwyBwoxPZ3sp3Ye1MSYaFpqVthLLGakS35RbMBrKUOok
9DDkVvNm2tn3ByjDkSIK
=BWe3
-----END PGP SIGNATURE-----

--=-WzbfxerG2eTWwgqj3ru0--
