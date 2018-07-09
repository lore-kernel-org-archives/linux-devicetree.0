From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel: simple: Add support for Rocktech
 RK070ER9427 LCD panel
Date: Mon, 9 Jul 2018 19:16:32 +0200
Message-ID: <20180709171632.GG26651@ulmo>
References: <20180607134648.2902-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180607134648.2902-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio maggi <fabio.mauri@bticino.it>, lamiaposta71@gmail.com, Andrea CORTESE <andrea.cortese@bticino.it>, Davide Bonfanti <davide.bonfanti@bticino.it>, Shyam Saini <shyam.saini@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 07:16:48PM +0530, Jagan Teki wrote:
> This adds support for the Rocktech Display Ltd. RK070ER9427
> 800(RGB)x480 TFT LCD panel, which can be supported by the
> simple panel driver.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v2:
> - collect Rob r-w-b tag
>=20
>  .../display/panel/rocktech,rk070er9427.txt         | 25 ++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 33 ++++++++++++++++=
++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,rk070er9427.txt

checkpatch warns about the rocktech vendor prefix not being documented.
Can you send a patch which adds it to

	Documentation/devicetree/bindings/vendor-prefixes.txt

Thanks,
Thierry

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDmHAACgkQ3SOs138+
s6HYdhAAhynfztVQmvGwykaLzw5Kc3pgHt7wjVbnXkM504tjImRQ2O49LFS+HQGC
w8tBkAUB/omsqqmfGF5OiTxG14FjmlmA9qAnfFLcwjhZhFZ4eIIIqGQQpnif4Dbu
MEU0ZsH4wYYG3qiuO0YwV+ft+0y/aPVHV0Xhtf4+QxHfIBAySMWm3PPHVdvxHSU2
vWNxcJyoqmjthgPdqDV8F5iWPB6TO7t7sfK0Lux09Y2Bzye/NvOXiepJBlqirzRF
b+kO5UtC3Gxj4eGLYIIjNdxjPmMcDBI2FVLb9mkXiSwQlKVugfZh7QmYj4QDgDLW
eb91mG1FViPWTneHFYYATgubHUIRZgM9GnA4uL4aRG5oQNGdQvDT7ccS9c6gn1/0
r+u9DqxLkY7bOiXyelsdQFgOeBIFV6Y0MWLywSAJmkF3KXqKc+4PD+Ed4dL3WI+l
qyB9LTwJc5n4daDvfihXdBJ1GhnCI9Th/D/Vy7LpheBoT1i2yUNfIpoE9A6fvvQM
v0UOP+ImU81GKsvHZ/jGd8mnnyJtz3eCPk8qRbFQPwDW/CepIgEZQoAq7eHFFboR
tvi9E7DXolFtwQ0MbRndQ7EAnHqmtsqACeCn+HPfhqAEqmXrIWplBb9ttITvy+rO
SUO/D0+3jsuM2yzAFsxw9G8mUvm9RVzR91Wh2WSD5CpmUAdZfPo=
=2CEH
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--
