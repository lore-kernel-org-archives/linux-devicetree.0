From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i-a83t: Correct low speed oscillator
 clocks
Date: Tue, 2 Feb 2016 14:19:47 +0100
Message-ID: <20160202131947.GS4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gXx2FYK2AghGE4Yq"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gXx2FYK2AghGE4Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 09:20:58AM +0800, Vishnu Patekar wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A83T does not have a 32.768 kHz low speed oscillator, either as
> an external crystal or input. It has a 16 MHz RC-based (inaccurate)
> internal oscillator, which is then divided by 512 for a clock close
> to 32 kHz.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

You should have your SoB here.

Is it ok to add it?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--gXx2FYK2AghGE4Yq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsKzzAAoJEBx+YmzsjxAgVbsQAIrgvDLhc9G7FHuWIjknKcbV
Wa9uwHLTHr3TACcm0eUD8zjDxVKdRqYAZ2JDvwfPGN3Q62AZOtrIHJr8CnQcs+sa
0ebCCBkBHsOo2sioydT9b6qpP1dUUOL19LXUIpJceNZfirPiJzkIZ40CNKLdwHsX
K6m1W79sXyKM89zqvzVpsTUv/OeOgJwBE/t4AAVNPmt07gjN599PJ1NkChYaVYzi
yVLBKBpi1Z3WPMZa3T7+zZHiCoROHzvnIgsxaCi9KKOlKrghg+ztKuWaKI+bPS5+
n6INtuKFm/9wlL/Vek8yOHawMzO3a66rEEdfIvJFapzHIEIHqBy9yuM8OQOBwAjo
mkgeKe66e/WzJ1cpuEeDgC+trgjXMPPFmhcZmnOMt6DrgMYZQ7cNxU/9iApC0fWA
OxnkZ8yvBDc6FqJZDHi0bSllVo25O0ETQ3q8+rPcOGHJLQXghZs5ENfcYFSnS9o3
QxJ1m9NiiYGPoJc2kGcwq6dliQ4AFP/htaZipHnz+qF/AmqFogycj3fEnjpmPy2i
2TzhVKirt0dYDLGnHpph3HGe4NARMvMfn3NkdDExpZxfSmh6vizLKJApsmpSQCu6
xFIotNzv3uFDo0qUn1j3qI5S10T4KaWaO+voZYn/g79z+LcQB5SnAtjAjZ3Q61A1
8zM8qW4bqE6Y5ojRH7yQ
=VPel
-----END PGP SIGNATURE-----

--gXx2FYK2AghGE4Yq--
