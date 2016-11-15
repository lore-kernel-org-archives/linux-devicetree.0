From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 0/2] pinctrl: sunxi: Support the interrupt debouncing
Date: Tue, 15 Nov 2016 18:50:16 +0100
Message-ID: <20161115175016.yf4yrju235j5xs5d@lukather>
References: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7qdc5zonu7xyd7kn"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.fa554eb1146d18ec75bf44863543fec4fa4fd3ae.1479156725.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--7qdc5zonu7xyd7kn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 09:53:02PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> The Allwinner pin controllers can setup a different debouncing period bas=
ed
> on two clocks and a prescaler.
>=20
> This debouncing is applied to the whole IRQ bank, which prevents us from
> using the per-pin property that is usually used.
>=20
> Let me know what you think,
> Maxime

Applied the second patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7qdc5zonu7xyd7kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYK0rYAAoJEBx+YmzsjxAgiaEP/jMNkM6VB1CnkCUw5/uk++h8
+CyA1sF6UUCnIFCMKPaiuf07vPeO0AT70KfPfy2a4K+KyeCHIGYevPz9XHRQVphK
pK3n42rTGJ4j25cKzFZu6SjXxTJYju41OlDihTe46nHIJVBIAxpaoACaRdmvlaNd
u7sWph7m7ODmYvk3lpJkDMYM2PiclrmKbVO4TQtQQ9qWu+dtCbgty1JVvRLEH6dL
Z8IXBaxD4RGDWdSQFbiCMqOKbyWf14OJT2UkTD5FnXgR+jHhIYb2kAjHIqrTM1zS
rMayRuhFHLZId1hbnlqukFVCRK0MFQeE2Qlf5EpUOzyImcNtOWEeeA6M+KKGpuKX
OD6NeAji1Xk53O1EHEupy4Ahp0rowXQBN4T7XMxcjwOOd3uoseG9/M/Pz/loGtbU
9UGq1kR8orwDg+PpTgVkwXpZ8HTRPb6tT7CMeamcgdI11Bw6sRAKPTSubMf1uBMj
sBTOhuhjlnf6fHYPd6sYaWYRhSIbDCwZfHukBm8LtnaKVLUDdIFn0bMsRGU9SPbY
bzvcrgvNi8j0YgEIlLLOvKUZ9E2aIF0BnhY+fEaDJwe6/ApsIeDhaczJUf6Mipmc
4I7CdI7TiNxe5g3SwttIXHL4X/mfffdNL7hLtiwprQCmZOPcwPS7+UvHb2yxMBL6
qzVhqbtqeDjmWh+H1Y46
=LHkQ
-----END PGP SIGNATURE-----

--7qdc5zonu7xyd7kn--
