From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH resend 1/6] clk: sunxi: Add DRAM gates support for
 sun4i-a10
Date: Mon, 7 Dec 2015 09:58:56 +0100
Message-ID: <20151207085856.GA27957@lukather>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
 <1449321407-4531-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449321407-4531-2-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2015 at 09:16:42PM +0800, Chen-Yu Tsai wrote:
> The A10/A20 share the same set of DRAM clock gates, which controls
> direct memory access for some peripherals.
>=20
> On the A10, bit 15 controls the system's DRAM clock output (possibly
> to the DRAM chips), which we need to keep on.
>=20
> On the A20 this has been moved to the DRAM controller, becoming a no-op.
> However it is still listed in the user manual, so add it anyway.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZUpQAAoJEBx+YmzsjxAgn40P/jfbEewuOA/2wCFxM6oBCvjD
ieJw1Hi+1rQnXpsHgEqe8DN+rkkhC3JtN3NlX5dnJEQGrdLihQajBBA35yf54ncC
DIZZt4wC34J53a5WgFNB/caDKuy754TUGHuai0UloRNIw4u+ttbOtoxi6L3ckIws
maVjgtv5OkMYltb36LUNMxYmOb0GYq1k6MNIqwa4EAZd7cnN2MlNxO4NJ53UHxGe
sGWSDW65tHYZLjmHoTGDX7doX03BFCpYfnA5DOC9rh8W7iunf8vd1YLDPhV03DKm
e4ZbAASF0xzew+Ai1mQTRED90E/c8N+WlOwWY0IoluDTIKUUK/WD9EE893lT1M4A
V8hXvANdUdRYUZSTbr57tlJKBxCau32gFIBA2Y6z6GH7EgwHnCOX5nQTtNsDGnP8
hikgbGS6/vUIkHEXCMTY6wtFmvosTME/ujtpd8kRIhLHpkHnkgJGnEZ4a9luSIWL
41U+btvnpWxl7nvswqtl7AYNGzRH9PTwd7bvPihG8dF3fcTGegwr1O6YDTbBpzT7
lpe/P+TD3pJjVncb4o1yCqUgeCijEyfwkw4Mioldo7VICuwFgEajLbgJyQl8EnDy
ryRfT6/mKNu0KF9wFlB+CO7cGSJoEoA//BOJ1NYaUHxd79s8ulARY9MR23qN+HPa
PCCoFfg/c1R+BrVyxorm
=MmlA
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
