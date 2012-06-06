From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
Date: Wed, 06 Jun 2012 17:36:30 +0300
Message-ID: <1338993390.6875.63.camel@sauron.fi.intel.com>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
	 <1338989921.6875.50.camel@sauron.fi.intel.com> <4FCF68DE.6000701@antcom.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Ef4+bn1I7oqMnE/pAFFN"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FCF68DE.6000701@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org


--=-Ef4+bn1I7oqMnE/pAFFN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 16:27 +0200, Roland Stigge wrote:
> >> +#else +#define lpc32xx_nand_resume NULL +#define
> >> lpc32xx_nand_suspend NULL +#endif
> >=20
> > 0, not NULL.
>=20
> Can you please point me to an explanation for this? NULL sounds

Right, sorry, that was incorrect.

--=20
Best Regards,
Artem Bityutskiy

--=-Ef4+bn1I7oqMnE/pAFFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz2ruAAoJECmIfjd9wqK0AhsP/Rl8yELzehgMokWZaJPv4sxY
TX4yqAqO7Jd2T4VFnjj8z84dXcYsHuFgYsJPmEtn9pLwmDC85FMQZTSNz5mTYxZe
9sElONk5SD3qEa6WsOzqbQ2ehnIA9/7o0kq8qNV/z92OTwrQtD29VlY7u1ENF4dY
2q/RUZozxAYIeQZ/kSqBwSV2aErbcTX8CiltYGXboRqA1BPSVGtOkDAPC/tZJNM2
OlF7AaCAUAdUcGxJvPrH2L1vU8+ctnJwn2raZrEkeZQWMudryWPtNd95UZ5IV79z
Y8x+O64XG0RZxa+P0gGmwukORfpRDj8qayEbnmM3blzWwlB8IvA6dd0OLLY0wTXy
ffQGT2vgG1G2XCOGfkPF6VEkuDRDgeF4nwydm7WLjpbRZLA0zqjo5cv+MaFx/mek
le3pkuZiZPb9CALIDzuCX0Xd/oRONRRdGRBymVN9+8RhYCHLuwPPQdzgCTJPIPwG
+HahoagrheSuheiG6Rvsesa2tgjnePf71Y0UsP/mXr9nGG2S0WMaYnKx/BcI0lEL
MnrhIQ1ItnYw10rkYdNS9cUXiUPB75YZm4xjh4YHcypnAWZ1oJv0MmBESEewEXwM
mJwqZrfPgOdelgiJukSAjKivvUhkIguan7rKyc4FTi06AaETYnybhJ8lqcYT9I3L
3V7M12mj7jX8bLgyUzzn
=wGXp
-----END PGP SIGNATURE-----

--=-Ef4+bn1I7oqMnE/pAFFN--
