From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATVH v2 0/4] arm64: dts: allwinner: h6: Enable CPU
Date: Fri, 15 Feb 2019 16:13:57 +0100
Message-ID: <20190215151357.noovkx3r6ia4boag@flea>
References: <20190215134937.10259-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="om2f4swtpe4optgl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215134937.10259-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--om2f4swtpe4optgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 08:49:33AM -0500, Yangtao Li wrote:
> Add the cpufreq support of h6, source of information is as follows.
>=20
> h6 cpu opp info:
> https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/arch/arm6=
4/boot/dts/sunxi/sun50iw6p1.dtsi
>=20
> axp805 spec:
> http://linux-sunxi.org/images/b/bc/AXP805_Datasheet_V1.0_en.pdf

Was that tested on the two H6 boards this time?

Adding a changelog between version is nice as well so that we can see
what you changed.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--om2f4swtpe4optgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGbXNQAKCRDj7w1vZxhR
xYxkAP9kUMkZaTrK23zivcyuBxMBvnEttPQW5ZUNNelMTWvr5wD/Vg6TAuWXUOQ8
6NQLJne5OBfdUYosfymIYyMamN2pMwY=
=Uep5
-----END PGP SIGNATURE-----

--om2f4swtpe4optgl--
