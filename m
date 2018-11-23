From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: mcp16502: add regulator driver for
 MCP16502
Date: Fri, 23 Nov 2018 13:44:11 +0000
Message-ID: <20181123134411.GG2089@sirena.org.uk>
References: <1542108563-10108-1-git-send-email-andrei.stefanescu@microchip.com>
 <1542108563-10108-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181113174539.GB2089@sirena.org.uk>
 <03b902d9-49a8-9acd-6f98-048f117b1e93@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OMIeU0UG8ajn+69Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03b902d9-49a8-9acd-6f98-048f117b1e93@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--OMIeU0UG8ajn+69Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 03:44:31PM +0000, Andrei.Stefanescu@microchip.com w=
rote:

> Thank you for your review. While working on the next version I realized t=
hat
> the implementation should change a bit. The mcp16502 PMIC has separate=20
> registers
> for each of its operating modes (Performance, Active, Low-power, Hibernat=
e).
> So, it is possible to setup the values for Low-power (Linux standby) and
> Hibernate (Linux suspend-to-ram) and these values would not be affected by
> changes made during runtime (which are made to the ACTIVE registers).

This is totally normal for regulators, it's the only way that suspend
modes can function sensibly since suspend mode configuration is
typically not capable off supplying the processor.  If your driver is
currently trying to use the normal operating registers then it's buggy.

> This means that the calls to suspend_set_* are not necessary to be made e=
ach
> time the board suspends. My idea is to add three functions to the=20
> regulator_ops
> (setup_suspend_standby/mem/max) which would be called after the regulator=
 is
> registered and which would set the values found inside the devicetree
> in the regulator-state-standby/mem/disk subnodes.

There is no need to add new operations, we already have a number of
suspend specific operations covering enable state, modes and voltage.
You should just use those, there's already code to call them.

--OMIeU0UG8ajn+69Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlv4BCsACgkQJNaLcl1U
h9D3lgf+MSPw3VUd37AGGy6UX8e9wrtZWONnJ9xKEgagrfT1n9PgKR3WOAdGfUJP
WIzVHqG6cMpkr6aYaxrBuQwv/65WH+6oZKowe3+JWBZOjdFeNABdWVwNZpTH2U/m
fZlC0tjL8trJX+qA7ARsUlb2e6p3eRfAwYUiIdzTR+D//B7nB47bqvNG1WROB9ui
mt9rf8u16YlCqzgzNPM44CkUdykA+MPzbSr7oTW2GI9/+olP9oBXJvDghHLcJJdl
DHuzZmzjEler3Ne7cgVY6RV5zlaaqL296QAGYO2ObG9Qln1YMiESuGo/hwSyKO6M
BFqN/69OsA3HYGct4Hwt2ZYAetXiIQ==
=LKzK
-----END PGP SIGNATURE-----

--OMIeU0UG8ajn+69Z--
