From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-sun8i: drop V3s compatible and
 add V3 one
Date: Fri, 2 Feb 2018 23:13:01 +0100
Message-ID: <20180202221301.judzaafcu67h4c2v@flea.lan>
References: <20180202180456.60378-1-icenowy@aosc.io>
 <20180202180456.60378-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w3j3l6kd2tz7c6az"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180202180456.60378-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--w3j3l6kd2tz7c6az
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 03, 2018 at 02:04:54AM +0800, Icenowy Zheng wrote:
> The V3s is just a differently packaged version of the V3 chip, which has
> a MAC with the same capability with H3. The V3s just doesn't wire out
> the external MII/RMII/RGMII bus. (V3 wired out it).
>=20
> Drop the compatible string of V3s in the dwmac-sun8i driver, and add a
> V3 compatible string, which has all capabilities.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

This breaks the DT ABI, so NAK.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--w3j3l6kd2tz7c6az
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlp04mwACgkQ0rTAlCFN
r3R0fQ//ffoKAqEP0sFMB9nFlN99JfDugPC/YpywXyDNrTMvb5TV1Ir1d0YMLAWC
jaT+EgL/eGA3Eo5488f2tD7Dl7hlOCJEliXJp3tyP5DGGDUN8tzEaej5j+R6GpMU
+b4nIZyZj/lw7fmTHCiynhG4MdyR0yT8QILUbhD4ts/+UeIy1OoEpJVjGAp4gFAP
lY29KR1D8j+uK2CLPoSYnnqv+1Fr15NDE2gbxMPDvle5DgglCSphUXN+A23Dzk38
EnrELnrHJj8V+E9QBX/kfCoIGWHQpknphDoMR1J5/1r1J7bo87S/PRvoH0MU7eqm
aFu6Jc+Whe3MG02ItTg9py+L9WT8hW5Yq98xXqQmc2T1R0nBfIAROY54LLhXs1VX
mRAgsn3k+5s4/hNPRdMEmxBlDOO/ecsYHMqRLVos7Bg6KUjjnJp7h4Ja3mta0fGa
R4w0fBCfTEcVTHhR0LfXmGOYY0XIzH8cwJpGGB4hw5xM/nDEULJtt3u8Qf5rMqnx
KutdC6QQ9QMMGMeADPgT/7hGt7Keabk48Urc4Ye6QXiq825QirfFfcNklY5UEgs8
OZ69tG3JGK/xcphgJryF499Qy6WABb/XWvCEIyiW5UapI/hvhtMLBKs38+SeZgDP
HZV8m+cvScrnRiD7sTHqzPRWPKxiHMnJWL4x4OlXIbP0+JFX5L4=
=rMO6
-----END PGP SIGNATURE-----

--w3j3l6kd2tz7c6az--
