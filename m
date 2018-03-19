From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I
 laptop
Date: Mon, 19 Mar 2018 22:27:42 +0100
Message-ID: <20180319212742.wttebbgoh2la63o5@flea>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-6-harald@ccbib.org>
 <20180318202251.5gpv6sblfr4edxmj@flea>
 <20180319071723.GA854@afzalpc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0758717822939081843=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180319071723.GA854@afzalpc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, info@olimex.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Harald Geyer <harald@ccbib.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0758717822939081843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="awdiv4e6447f6xgn"
Content-Disposition: inline


--awdiv4e6447f6xgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Mon, Mar 19, 2018 at 12:47:23PM +0530, afzal mohammed wrote:
> On Sun, Mar 18, 2018 at 09:22:51PM +0100, Maxime Ripard wrote:
> > The first part is supposed to be the name of the boards. I did sed
> > s/leds/teres-i/, and applied, together with all the patches but the
> > PWM (so I had to drop the backlight node as well).
> >=20
> > Please coordinate with Andre about who should send the PWM support.
>=20
> Assuming that these patches were applied to your sunxi/dt64-for-4.17
> branch, since PWM support patch is missing, there is a build error,
>=20
> arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts:129.1-5 Label or pat=
h pwm not found
>=20
> Diff at the end cures it.
>=20
> (there is another H6 pine 64 DT build error related to header file
> missing)
>=20
> afzal
>=20
>=20
> --->8---
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> index b3c7ef6b6fe5..d9baab3dc96b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> @@ -126,12 +126,6 @@
>         status =3D "okay";
>  };
> =20
> -&pwm {
> -       pinctrl-names =3D "default";
> -       pinctrl-0 =3D <&pwm_pin>;
> -       status =3D "okay";
> -};
> -
>  &ohci1 {
>         status =3D "okay";
>  };
>=20

Thanks for noticing and sending a patch. I've fixed the original
commit.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--awdiv4e6447f6xgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqwK00ACgkQ0rTAlCFN
r3TgxA/+N2TI5N5LYpBfh0tnBCVLwAmmoltLS0PqOnKegZjyr2Uj2GCxrBX72nQ4
C0WMHQbCp7NMtBXejzcLQX8vP17bspnae7/6MSO8Rqh7skCqHX4j8q6WCb0wm5ce
QXVmrx+SBjIHqsECyMunDcfEcocpAazOnVtC/H7XeQRsdSPHJEB9Xg9+mbJhtxuV
ImmvzfujYPdXr9TQwulAG3+93YPaqoMajs4f4tebcpwfiR6acybYrZzCb4vsB9Bv
IFeFXts9DyVHFhMSWZ3EANEyNpDTikP6MquXNNx9WbK4sRctCJMOy4gxs0Q4qeoo
+TRYqvYDzOeDaNEOFjDL3UNzhMqab94ZC0eti8p0j6w6bhAWqzyFMRzixdEy2JXw
PBcTyRGZhhFL+nN1wr2O0p6D9WARHOIYz8wzbDS1JfLKdkb+xOlziKpXfYowyfUl
DJsh7Kd10RHsYFGpTP5b27zH+PkAzXX8rZaJN/+QDDeIDmFCMb4SFMZ4s8FSiAai
pQQgdomKlN+3QvNJWb36Q5z6lCAR/S+b5cXHvu0E+mdfEk6rD7lDRGVMOfHYXggL
V/+eMdlZDqgw0O0QLtPhVbZHoLhSbWPf5OxRejJrKzVia7k4d/GQ+kqtbt0kIIG4
N+J6V0Jc6wmlv96c1B8xrALN8fj9KquSAnuTPGukHoaqWh5YWxo=
=4Ytv
-----END PGP SIGNATURE-----

--awdiv4e6447f6xgn--


--===============0758717822939081843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0758717822939081843==--
