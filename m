From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/7] ARM: dts: sun8i: h2+: Add Libre Computer Board
 ALL-H3-CC H2+ ver.
Date: Tue, 24 Apr 2018 13:54:18 +0200
Message-ID: <20180424115418.lpv4drajf4t32xss@flea>
References: <20180424113424.13196-1-wens@csie.org>
 <20180424113424.13196-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9164255474367297455=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180424113424.13196-5-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org


--===============9164255474367297455==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzgf7d4p5vzbjttm"
Content-Disposition: inline


--dzgf7d4p5vzbjttm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 07:34:21PM +0800, Chen-Yu Tsai wrote:
> This patch adds a device tree file for the H2+ version of the Libre
> Computer Board ALL-H3-CC. It is the same board first introduced in
> commit 6ca358645d4d ("ARM: dts: sun8i: h3: Add dts file for Libre
> Computer Board ALL-H3-CC H3 ver."), with the H3 SoC replaced with
> the H2+ SoC, and has only two 2Gb DDR3 chips instead of four.
>=20
> The device tree utilizes the common board design file for ALL-H3-CC,
> providing just the model strings and SoC specifics.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--dzgf7d4p5vzbjttm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrfGukACgkQ0rTAlCFN
r3TUQhAAl9TdM3aK2eT+CyAkBdIJDTJwLFd7ecZi8f7ZRUENxH1ogWlToPKCvg76
yIFqPlLd9ISJa7stJFsQzlVrBZIHBFCWaS3ZQg8NKJxtFQGo/gPF+WHwfbqCDO8l
uTwQB9374kQYsb0z5qcCslT2I67MTakQMM4vyZVc0H1gDQmYXmwbtsIDfiOx543k
Mlc5YxQ+3BSw23bW6CIB1YnLx72LIyPJn2tii6bNwobcp03l739igisr2qbwzJlw
jcD5hEELjkeey9R6Jp8HDxg55nsU9ab1LGVVFRRoMS+ixirrnZ41KoUbtfAS5Kiz
kPfxBpbw9FMp/zo16cSaPUgeRIoB56aL50rYjuRpPHr6pF+pL+CQqsAjox49fz19
wuD2YfaqHj5wd/4BYDvPqMg/pnd6pdSJuHAKrfOFWJo8VT7nY5eVYF6elAe8UsJE
/IPgnv7dl2AfMRBkvb6lDik82iaKoOirlgO4VeDvd2TfQUrM6+q2JD1PH+oKjT21
wMgUwgzK6YMLx5JV6x3mcI4XcML9FFVd6zjbcP+hSXv4DykONhUeAsUSGZtzHVtn
AWp9WOWLm3teH+7fWthY/34z1QCMOqDWxTTIRVDSWEafFhGkBESAzCu4kZp8poKn
gCJX6RCRH3iJwN39JS/7HUS4zYcBL3L/PmRKw38BXm0alVQcZbk=
=Q8X6
-----END PGP SIGNATURE-----

--dzgf7d4p5vzbjttm--


--===============9164255474367297455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9164255474367297455==--
