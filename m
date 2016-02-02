From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 02/14] clk: sunxi: Add apb0 gates for A83T
Date: Tue, 2 Feb 2016 14:12:26 +0100
Message-ID: <20160202131226.GO4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-3-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABYnUdqoGSokwVM+"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454203266-4450-3-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ABYnUdqoGSokwVM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 09:20:54AM +0800, Vishnu Patekar wrote:
> APB0 is part of PRCM, and is compatible with earlier SOCs.
> apb0 gates controls R_PIO, R_UART, R_RSB, etc clocks.
> This patch adds support for APB0 gates for A83T.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ABYnUdqoGSokwVM+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsKs6AAoJEBx+YmzsjxAgy9IQAJEw0Q1H+mFeYIk1yqlWWNqt
EYyOUdsDSyTxW28L37tN+NYvf1hlYTY5S82qyR+iVYgea229UuWiBIsRIvzIxGoy
XGfcZkRlMHOTY575q5CjwsSSoYFNU8scDOWY2lMlVYwZSOaW7RAwXO40Xns1qvjf
AoL/oMn4iXjhJyyHs/U+CfUpNWd5dJ2axGRQ5Mfy8sRdq/Hplix5esElx/CUhnS8
6cO6v6or0n4EPkPUpveN2BMamHShocve7FYZXaQtv8Eb7NQtAs1K0IeTIMsWr8P0
wj9E/theB0gIjRahodAVB+zzOU9iYHSCfGfwcTWBmo7r0igAV+dn6hbNPOMWiEpq
AOVDAKdI1PBxh0TNIoCMlTYh142ywQlFcqfRAC4RSvCq3bpw/4tRuKzJupCZNKbX
ZFl19zQPOlN1aUak8fg16VypouUycHNeDE035lt5wkkpWTmlpyFLAn+q8TS7sm4R
NfQ7nNrHhXhhBOvo8KDCej+FaTfE5kSwsdXU2qc1J3pVNiBiBa/GygSwae6E+vm8
4BkzBrXjQL6U+WHYq8YXxDrtbWMOCGuzS0y/qq1DGCtU28Pm+awOMuInkP7zwiYR
Bwm4LbLzYIkE9n4uAbuSQsHGcECHMzs1oqaNEMTMIUnwD9dSnz5DMaNyqsaRz/bW
tndOEhbgw4QvJ14BHV2G
=RzDP
-----END PGP SIGNATURE-----

--ABYnUdqoGSokwVM+--
