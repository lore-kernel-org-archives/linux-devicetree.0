From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 5/5] ARM: sunxi: select MFD_SUN6I_PRCM when sun6i arch
 support is enabled
Date: Thu, 15 May 2014 17:30:20 +0200
Message-ID: <20140515153020.GY29258@lukather>
References: <1400144113-27659-1-git-send-email-boris.brezillon@free-electrons.com>
 <1400144113-27659-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I2k41U2G4dq8LTBU"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400144113-27659-6-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org


--I2k41U2G4dq8LTBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 10:55:13AM +0200, Boris BREZILLON wrote:
> Select the MFD_SUN6I_PRCM option when sun6i arch is enabled in order to g=
et
> the PRCM (Power/Reset/Clock Management) related drivers compiled.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--I2k41U2G4dq8LTBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTdN2MAAoJEBx+YmzsjxAgFkMQALjVc7ONqOryt0EbvVbk9WXn
AmT/Y7rT+wyKey3E/GHfEbJDkennYRLytgiuB55XdA4uWIqLJ94SZyzUZr7abWcA
/A21/Xf58/btxl0EzyzkPbhalovLjhY6o7H4GAllUsk1mGXycCfdUfn81cPNtylm
d7ExvWozg3qs0/ynIeb8ipsOWzAbS0ShjQuXpGruWx86WdOY/KWk0aQF8ASnIZIg
KT3votjxFUlN5Hkk2X9uwp8jRVHnSzQO3zU9xACsMTQq+0ovh+N19uO9B29bCUFQ
dWkc2NJoS0kH4wd3pEAeH3HkMM1y2usf7sObdlCLD2CsyJGcvxF8uY92q+8JC9eO
wWCxnhwS7AsqOPB8USHZIuCYwYYov49gaqc8soOJtk2uCFUZ7KZ16a4peQK5qcoA
wzX81HwEsfEstBAUmJkyiknD2FV3oGzMMCXMLqbzLCxq+Lmh8PgX6NULwYczxtZr
tKNGiNKLUbgItHJBu7zFN2KeV5Q+diCkiMqcNaJD93WOHcL12tHbDNMIEicBB43i
I7F7hLxvp5D6kAa1MgJk+L90dJu843PljNHmEFgG5qjpe11NGu+Q16hWhT/HjsoC
Axt+j2uYIlKOos0JFaWc6Wppq8n/X64Wus//7dU8X6V2PJc2L3ools5UT9LXTAWR
G/sHyp65CQYAHgOzeFR/
=NR1i
-----END PGP SIGNATURE-----

--I2k41U2G4dq8LTBU--
