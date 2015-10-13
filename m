From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v7 1/7] ARM: dts: imx: imx7d-sbd remove fixed can2-3v3
 regulator
Date: Tue, 13 Oct 2015 14:25:12 +0200
Message-ID: <561CF828.7050609@pengutronix.de>
References: <1443477401-17238-1-git-send-email-aalonso@freescale.com>
 <CAA+hA=Tuj6xTvcPB7xFi6jghBJZAMNTkMheR8HBz8-bfBdRn8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="I6HsxU4LGLx9je0dJlpsriDPhG3NhJh2C"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAA+hA=Tuj6xTvcPB7xFi6jghBJZAMNTkMheR8HBz8-bfBdRn8g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>, Adrian Alonso <aalonso@freescale.com>
Cc: devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, lznuaa@gmail.com, Shawn Guo <shawn.guo@linaro.org>, shawnguo@kernel.org, Anson.Huang@freescale.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I6HsxU4LGLx9je0dJlpsriDPhG3NhJh2C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/13/2015 02:04 PM, Dong Aisheng wrote:
> On Tue, Sep 29, 2015 at 5:56 AM, Adrian Alonso <aalonso@freescale.com> =
wrote:
>> Remove incorrect can2-3v3 fixed regulator, imx7d-sdb doesn't
>> have a dedicated can2 fixed regulator instead it shares PERI_3V3
>> fixed regulator (RT8070ZS) which is enabled by default (hardwired)
>> from pmic pfuze3000 NVCC_3V3 power rail.
>>
>> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
>> ---
>> Changes for V7: New patch in series
>>
>=20
> It is a correct regulator here, but i have to admit that it's a bit con=
fusing.
> Here the regulator is an abstract regulator which is actually used to
> control CAN
> transceiver STBY signals, it is introduced by below patch:
> commit b7c4114b07bbacfe0aee1d04ad1ade9e42309620
> Author: Fabio Estevam <fabio.estevam@freescale.com>
> Date:   Mon Jun 10 23:12:57 2013 -0300
>=20
>     can: flexcan: Use a regulator to control the CAN transceiver
>=20
>     Instead of using a GPIO to turn on/off the CAN transceiver, it is b=
etter to
>     use a regulator as some systems may use a PMIC to power the CAN tra=
nsceiver.
>=20
>     Acked-by: Shawn Guo <shawn.guo@linaro.org>
>     Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>     Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
>=20
> From the commit messages, it should be likely to control the
> transceiver external suppy,
> not control signals, but it does do that unproper work currently.
>=20
> Besides the unproperly handling control signals, this solution also can=
't handle
> multiple CAN transceiver control signals ways.

You can chain several transceivers together if you need to control more
than one GPIO line.

> I was trying to write a common transceiver driver to handling this issu=
e.
> But get interrupted by a few other FSL official works, will resume soon=
=2E

Have a look at drivers/phy.

> I would suggest keep the regulator first until the new solution got in.=


Marc


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--I6HsxU4LGLx9je0dJlpsriDPhG3NhJh2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJWHPgpAAoJEP5prqPJtc/H1wsIAJW8cPHvCd7feuSc+lmLWY/V
RaXxume6iPtRieWbe8MJAb45Tvf1Xo7TS3U7IQZEDh9ug7iiDSUsE6PkdENiYiS4
Pe9KhWf0g8s5AlGYoaU5O2PBo8SyOWsMe9Y2fQ2TEMZR7Twgqk9C17cqaQTdJI5C
GMCesrpH/2yXktuo3TccDz+L/ii+pHVaZMmXDKjM/GIFKd4NC77nibFx9lxl2y45
E8zEEhkDi8R2x/BQbQ1NR9QWYtjV8h7beMtstmNLv+OaRcSd1PUTVaSLANXY38lo
xoyQ+lE5pTG/w3U981eCmlxWkgWtygcUDDGtIbwTmsOUx4IqjkimSVmZRV09v2c=
=MB+r
-----END PGP SIGNATURE-----

--I6HsxU4LGLx9je0dJlpsriDPhG3NhJh2C--
