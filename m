From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 5/8] clk: bcm2835: add the dsi clocks
Date: Thu, 17 Mar 2016 10:27:41 -0700
Message-ID: <87oaadj9pu.fsf@eliezer.anholt.net>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-6-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456760642-2412-6-git-send-email-kernel@martin.sperl.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Add the missing dsi clocks using the currently "best known"
> parent-mux available for these clocks.

Having been working on DSI support, there is definitely no point in DSI0
and DSI1 pixel clocks without their proper parents and this patch would
just get in the way.  The esc clocks look fine, though.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6ukNAAoJELXWKTbR/J7o+oMP/1/IiQ5co+GYh+nVeveNWYEE
ZiN507TD+2P5B8+OqL8HEwSezLox18bnZA72kB0IlDx0y76FHNhRwcfaNsrJ/X55
As1UWZb/iPtRCQ4wjHzW+PZGAmlLzmaMTMEs6VNcx1q9RYzr5w8/fU0GYViMr/HP
bgIRuWjv1SuZhri8WPvhUUaJAeB/Vj66z2Rwt+bflQX6YkdzwOUib0xhzIBMoXs8
g+zUeRq/5jYnigvSbdV7dGw4SArkCeUkWp958EUV1jvfg2grqqrSKL/MLlYmyLda
ujGNQMvgUS3fkDfRwjBgHYHvxvKVb+wWILsw+vO6ZQtVlqIBQDZbEyNdvX2fpCrs
OpmMC3ovAWE2HKDP3dLO63BwboZoS4Nv0ohpxsK0Itw8rHhJG5NuzkEk8/fpTy+z
7z/FqhYq7A36HSiLV8MxIVhcrhxKWbCz6Un1+jdz5WOHU/L6AwMNBwCTZV3DXK+q
A2P4N5W+92e37jkeATYxO5rAXXItZLar1GvzRocTQISdRHmhHsOP4J0Lvbz/phrX
Rx8rlL2rLuoB0mL6wSU64PHyfUhs7xNKpdn/xCesDre2swvmj2519Y0li1DRa6hl
I/qIcdlcJT1KXob9LcLRUnLQcaN1/jbodrSG3FqX+Eq93aEuqK2IR2UMpqQiqDI1
aEWTcStzzsfdUegL0Px6
=HgTZ
-----END PGP SIGNATURE-----
--=-=-=--
