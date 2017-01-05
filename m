From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable spi1 and spi2 for Olimex A20 SOM
 EVB
Date: Thu, 5 Jan 2017 18:16:01 +0100
Message-ID: <20170105171601.us4wffupptilvvqp@lukather>
References: <20161226175349.17712-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3464946239068213998=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161226175349.17712-1-manu@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3464946239068213998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="adylcpmdhpp4u546"
Content-Disposition: inline


--adylcpmdhpp4u546
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 26, 2016 at 06:53:49PM +0100, Emmanuel Vadot wrote:
> Enable the spi1 and spi2 node since the pins are exposed on the UEXT
> connectors.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> ---
>  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/bo=
ot/dts/sun7i-a20-olimex-som-evb.dts
> index 669a1c338c76..fa8c6f60552b 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> @@ -300,12 +300,14 @@
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&spi1_pins_a>,
>  		    <&spi1_cs0_pins_a>;
> +	status =3D "okay";
>  };
> =20
>  &spi2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&spi2_pins_a>,
>  		    <&spi2_cs0_pins_a>;
> +	status =3D "okay";
>  };

Those nodes don't exist unfortunately. Maybe you forgot to send one
patch?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--adylcpmdhpp4u546
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbn9RAAoJEBx+YmzsjxAgUEQP/AmZr4qrlPMD0GmQfhdtMHJZ
yW6AvDysHB+7gG04FhiIxz/Fhi7eOiQyllbHpt2xOnkLkkmh98TVwHVG2CII+UB6
4zhc80WwMBam38SGY6SzEhY1q/WTvjxv5RAZmXdQtJmM88CxyJ0TcE8HTMo77P1B
2A63dUs/o2fwdlSEFxzJn2uGFr1C6o9jRKn8NB0YLkYrlH+OfVMnFYpyDGNkmorD
ZP7RtVtnzHkiyjh3iWxXPpalvn3QHcT+8i5kBqBaF3fLVpMVyjVpL06N4zlP/d6J
3Kfg9pPC8kU75sD8A4RxOF1oEK8hZ3AetrEeiNNMYX9kd3CrfgrVzBoSHwVbhe/k
Cuvz8p0X3CM4qZTMUOa2L1MWu2likr17bFwk3TFvbNn/afxYsPnJNmTbAno4WBzl
7x8tz/rKUddgRSE+CdVnnjjk6mnp7AnxpLaqclrOaDBSuCY4u4A3fjudEx98wNai
6DVryzq/Sfo2C5Y/vRx9v/cSmfGTp7x4eUnvHJQae3m2jolK4lByoijBVMQaMoLR
dNOKuLrPfO9OiTa6+50+CZYiOUUOOsItM7etLJNdVfkK2f3wKMeZjTYbrB2DWfdy
c2cDAR3yonOIihjg6fbLXw+xIEBT/TzGIEdZMLNeua6fIE2d0TSzoYjac4l7hu6b
WAWHyY2kymW4w/dVf5JU
=9mqd
-----END PGP SIGNATURE-----

--adylcpmdhpp4u546--


--===============3464946239068213998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3464946239068213998==--
