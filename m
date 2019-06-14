From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] regulator: rk808: add RK809 and RK817 support.
Date: Fri, 14 Jun 2019 19:24:21 +0100
Message-ID: <20190614182421.GI5316@sirena.org.uk>
References: <20190614031425.15741-1-tony.xie@rock-chips.com>
 <20190614031425.15741-4-tony.xie@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="je2i5r69C8+2chMc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190614031425.15741-4-tony.xie@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Xie <tony.xie@rock-chips.com>
Cc: heiko@sntech.de, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org


--je2i5r69C8+2chMc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 11:14:22PM -0400, Tony Xie wrote:
>     Add support for the rk809 and rk817 regulator driver.
>     Their specifications are as follows=EF=BC=9A
>     1. The RK809 and RK809 consist of 5 DCDCs, 9 LDOs
>        and have the same registers for these components except dcdc5.
>     2. The dcdc5 is a boost dcdc for RK817 and is a buck for RK809.
>     3. The RK817 has one switch but The Rk809 has two.
>=20
>     The output voltages are configurable and are meant to supply power
>     to the main processor and other components.

Acked-by: Mark Brown <broonie@kernel.org>

--je2i5r69C8+2chMc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0D5lQACgkQJNaLcl1U
h9Cg3gf+PI+oNUSN6SISGiEj0NLwGYqM6Zuaotd0ItoKH0gSxFrTbuNhIGdsI/mN
fjDHx3QiGEsRBgKLaae3GP35+L2B7d4sUs7+ZpVC0DrldSFUQ3G6xbsez1CKm5wB
o3u5dBWZSKGHHxjJV/VH27wu6BonLndiAbFuwA/vjB2tTr7003bRMYeVDoI3uPik
o7vU+ZwFhCGUuh4TmPusYRWepB5cyGCuo9j/IX+HfWnLeVvcOlz0qtIVcr0DARzF
ZPAxMHqtm2lvyldzgU456YAA1wTVihRwRvhSyz3hAKgZLzlngjGxPrrgszbJJ05I
SUAgVqBJ/phpgaL6BBLqlGNDtUXPmg==
=Qfnw
-----END PGP SIGNATURE-----

--je2i5r69C8+2chMc--
