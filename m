From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 03/10] pinctrl: axp209: use drv_data of
 pinctrl_pin_desc to store pin reg
Date: Tue, 26 Sep 2017 15:01:08 +0200
Message-ID: <20170926130108.uibnri32b73elfy6@flea>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <7993a30fbc2e50a2d228fa0c8fad643c4034b101.1506428208.git-series.quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xcnhxbzwbfsiulu2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7993a30fbc2e50a2d228fa0c8fad643c4034b101.1506428208.git-series.quentin.schulz@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, lee.jones@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org


--xcnhxbzwbfsiulu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 12:17:13PM +0000, Quentin Schulz wrote:
> Instead of using a function to retrieve each pin's correct control
> register, use drv_data within pinctrl_pin_desc to store the ctrl reg.
>=20
> Remove axp20x_gpio_get_reg and replace every occurrence by a get from
> drv_data.

Why do you need to do that? This should be explained.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xcnhxbzwbfsiulu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyk+UAAoJEBx+YmzsjxAg6AwP/R4vBxjKUB+aMJfyAPv2oLoQ
mMxZTK7syyuZ8WMNiDB0I/dPVnvR8qRqiPUDpZwO2XBJfhb2QvrKN/I2YYomdiQB
dgWzuCkkKSKnlKiASPW86fi7M3MbT3HAr+7jOwPIiYJYYwh7xtQGEBpQMXOW1oaH
Bhs/jxCfRK42CqF2dlaEpMCgZMNjbOREqzx5gWmCgoDs+HbwVNEVK62poI+ATRnS
A6che+T8GRX9qbY9K/VHg81sX40x6AAOzA6Kt36Pd34/MGmATn1u/MnWluQBRzfV
nfsx0o8pIn9d1nN5HzKYfcli16b/n3iNMRVqKl60acmLdEVCPUtlAllxgInYJec4
PqZ7J2+6qukUBVHNr5vd2ncJscvC5UIODyUmYRQoR0Uu4ddsuSuSm5Nrk0PZ8uas
G34/jEmUY/g2mJiG/Y8WpuiCKamoExr6IZocXmRRVApZkYPY2U919Ur0ilb6WIBN
jOXPa4cUVS9H1QZTRXZBNRoWfcUeaT//jOQHSQRSkb+xkfVoeiDyPSkwEGQnb1cd
2oi3IM7pJOMJxdiX2WvvdrjdarImBWozSOLY+GsGVAcQ9aJMfgvVYa1buNjGMpdb
hgyWhkP6wlRGnpS5M3H5dl9WvXQZnlog6thTPxBJquVD6dz+iRlDo74UWeX+t5JC
I9LrkE5iL40o8jiQ/qMk
=JSNs
-----END PGP SIGNATURE-----

--xcnhxbzwbfsiulu2--
