From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 04/14] clk: sunxi: add ahb1 clock for A83T
Date: Tue, 2 Feb 2016 14:17:25 +0100
Message-ID: <20160202131725.GQ4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-5-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aX6oBa4COn3eIhlv"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-5-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--aX6oBa4COn3eIhlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 31, 2016 at 09:20:56AM +0800, Vishnu Patekar wrote:
> AHB1 on A83T is similar to ahb1 on A31, except parents are different.
> clock index 0b1x is PLL6.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>

If the clock is the same but the parents are different, then we don't
need to duplicate all the logic. Simply add the number of parents to
mux_data, and you're all set.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--aX6oBa4COn3eIhlv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsKxlAAoJEBx+YmzsjxAgdhcP/0QhemNTUGVW+K54sC/ZyF1v
myXI8I1Nol320ljDG2Qc8Vv6SUbKjvWgARuEZ3YulJ00Uyxa6wCKeN5QalO28cme
aAfpRRkPokpKyC++v+lr3EyUY5sPLepukZk0Dgj6rYdEGPCxjlnaFay+smcs82vA
mRTOkICdr8ZFr8pynxrb9XBwlL3m4R3+KA6g2AF+b596Kv4b8vLqj4YhpNB3GT7e
F+/dOnXsW+02algRTT8eaSoEPNQhVf8OIxrLVEY36WbkIn/USbTKi1T2mtJehDEu
AtqG7+POcnNzOZuDno5jtvypHfQZ5nmesiaZD2yMQ90tqHOB6aAhHTbeQsGUGpUM
IViHOg44HzBsmvubMXypua+a2mWmqq4QNh0GfO2agovswVKhgfiCqbmzGMWsU2Ie
TWPS7SVqlpI/cjZXHZcHwaKbO4anx+z9e4Yd/Ga/1Wh79zMxv1r0YsmfSUI9MjGC
wgqJNykdQsKUGOdKH+MyCeu/ktBX5vIqDrBWeLJVBMhKXAGm4VqG7l+hKzst7L7q
gDoeZvjPCQ0lKz5P+Y4HEsQzXgByQAGxEfUdyhN61YKFigKtph/S5e1VXPdV+U8r
/PFbn1i+zgep1Ue9hNqKEZU9D3R4lA0/OvuMDN784dc3Q/DrqjG7GGrzDyZ5Vb7d
Yb/luuLVuxunjGx9EDHh
=6lKj
-----END PGP SIGNATURE-----

--aX6oBa4COn3eIhlv--
