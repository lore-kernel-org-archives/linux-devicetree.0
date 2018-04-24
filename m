From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/5] ARM: dts: imx53-ppd: Remove unnecessary
 #address/#size-cells
Date: Tue, 24 Apr 2018 18:04:07 +0200
Message-ID: <20180424160407.rekalmti4cr7rbru@earth.universe>
References: <1524513033-21136-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5998510318145222528=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524513033-21136-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5998510318145222528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ut2tov4esn5sllze"
Content-Disposition: inline


--ut2tov4esn5sllze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 23, 2018 at 04:50:29PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>=20
> Remove unnecessary #address-cells/#size-cells to fix the following
> DTC warnings:
>=20
> arch/arm/boot/dts/imx53-ppd.dtb: Warning (avoid_unnecessary_addr_size): /=
power-gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or=
 child "reg" property
> arch/arm/boot/dts/imx53-ppd.dtb: Warning (avoid_unnecessary_addr_size): /=
touch-lock-key: unnecessary #address-cells/#size-cells without "ranges" or =
child "reg" property
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  arch/arm/boot/dts/imx53-ppd.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-pp=
d.dts
> index d5628af..c394857 100644
> --- a/arch/arm/boot/dts/imx53-ppd.dts
> +++ b/arch/arm/boot/dts/imx53-ppd.dts
> @@ -180,8 +180,6 @@
> =20
>  	power-gpio-keys {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		power-button {
>  			label =3D "Power button";
> @@ -192,8 +190,6 @@
> =20
>  	touch-lock-key {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> =20
>  		touch-lock-button {
>  			label =3D "Touch lock button";
> --=20
> 2.7.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--ut2tov4esn5sllze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlrfVXAACgkQ2O7X88g7
+pohVA//d9LbOAXXGhwmjklrIS8FPRtMIsP5f3ThQ2J/BuDyt/hcgL0pbXk1fz40
pnrZJgKINcEMSF3d9wQIS+/e/5GnOrDwcTGK9Nrkd+igu3LElv7jH3Hw/wxd48R8
Q/IwNJFfDTuUnCeH2iL2DBmbmmWVfcECj1EHGqJegbwhDT5TeBD5eagZRmt/ZKre
5laDtO5mTpN/dtdYqKVocavSJuv+opx5yde1YztjOqETKEcBBQTHrs9gwLSdkXiz
7kG1jztmXiI1kY1xAbVndHSpZlwof7IjqUe2vcJBcgX5//ddu1nAHZzKUrnC9WOE
RpYJIwLppiVkL9tAQeIfd8hQ06B+x8mAk2MU0QjYgZKupGO0IXQKtje2dXGEOUix
lnVMhEdMc/UGvAt/fhAdYkZaEeSmo6jaW+88vnZtggj8trBjqcs9AUQ1q2j/yOs9
QFA+VL/OjGm4/vo4pDgdKOtgVzaIm5KpylbQlsaymlnhy1bM1eo/0pOx3HXbmFN0
6u7Q5naNOxw3poJJzCDZJV/wuzGk/Ia90NyCL8WBz40Vuw3JMe22THo5ngno+/Jr
CcWRt/PsoK5X9qqUyVC26dQXw4ZvX16LCcP2KsWlWMI0tuAz3qOgJTd+9zqqE5tn
cGfZfClNWUteGyAqamUBagK0cq5aFy7lQzQUC6saeVE0qdcjatY=
=y6D1
-----END PGP SIGNATURE-----

--ut2tov4esn5sllze--


--===============5998510318145222528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5998510318145222528==--
