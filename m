From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun8i: Extend Orange Pi PC dt to also
 handle the PC Plus
Date: Mon, 25 Jul 2016 08:40:33 +0200
Message-ID: <20160725064033.GA7419@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <20160713084505.GE4761@lukather>
 <bce2b340-a930-8771-4560-dc61bf5828d5@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bce2b340-a930-8771-4560-dc61bf5828d5-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 13, 2016 at 12:01:41PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 13-07-16 10:45, Maxime Ripard wrote:
> >On Sat, Jul 09, 2016 at 10:21:55PM +0200, Hans de Goede wrote:
> >>There is a new Orange Pi PC Plus available now, rather then adding
> >>yet another dts file for this variant, extend the existing
> >>Orange Pi PC to support the sdio wifi and emmc found on this variant.
> >>
> >>Downside of this approach is the following messages in dmesg when run
> >>on the non Plus Orange Pi PC:
> >>
> >>sunxi-mmc 1c10000.mmc: fatal err update clk timeout
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 8, RTO !!
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> >>sunxi-mmc 1c11000.mmc: smc 2 err, cmd 1, RTO !!
> >>
> >>Note these are completely harmless and there is no adverse effect
> >>to the functioning of the non Plus Orange Pi PC.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >> arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 40 ++++++++++++++++++++++=
+++++++-
> >> 1 file changed, 39 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot=
/dts/sun8i-h3-orangepi-pc.dts
> >>index b8340f7..f9bf260 100644
> >>--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> >>+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> >>@@ -49,11 +49,13 @@
> >> #include <dt-bindings/pinctrl/sun4i-a10.h>
> >>
> >> / {
> >>-	model =3D "Xunlong Orange Pi PC";
> >>+	model =3D "Xunlong Orange Pi PC / PC Plus";
> >> 	compatible =3D "xunlong,orangepi-pc", "allwinner,sun8i-h3";
> >>
> >> 	aliases {
> >> 		serial0 =3D &uart0;
> >>+		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
> >>+		ethernet1 =3D &rtl8189ftv;
> >> 	};
> >>
> >> 	chosen {
> >>@@ -118,6 +120,42 @@
> >> 	status =3D "okay";
> >> };
> >>
> >>+/* Note only present on orangepi pc *plus* */
> >>+&mmc1 {
> >>+	pinctrl-names =3D "default";
> >>+	pinctrl-0 =3D <&mmc1_pins_a>;
> >>+	vmmc-supply =3D <&reg_vcc3v3>;
> >>+	bus-width =3D <4>;
> >>+	non-removable;
> >>+	status =3D "okay";
> >>+
> >>+	/*
> >>+	 * Explicitly define the sdio device, so that we can add an ethernet
> >>+	 * alias for it (which e.g. makes u-boot set a mac-address).
> >>+	 */
> >>+	rtl8189ftv: sdio_wifi@1 {
> >>+		reg =3D <1>;
> >>+	};
> >>+};
> >
> >Nothing prevents you from including the orange pi pc dts, from the
> >orange pi plus dts.
> >
> >It prevents the duplication you were trying to avoid, and it doesn't
> >create all those spurious errors and devices.
>=20
> That would solve the copy paste problem on the kernel side, but that
> would still mean adding a new u-boot defconfig for this, which means that
> all the distro's which ship with prebuild u-boot binaries need to build
> for yet another board, something which I would like to avoid.

Still, registering devices that are not present on the board is not an
option.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlbRhAAoJEBx+YmzsjxAgNmsP/jUuoSLsLBnoGMJn3/B83+uD
8k8WW+9H8aZvBweuEal0k0PH+4qblKatY1odA1OR7bZyYN445zzKe11GaO7A17a/
MF1zzBDb978pOYgE2ycVsaQpV7DdBKRJWb7HM99cCGbKAdqchnJgrqw5VtvnUNvA
fZh5ht5rU7sQzDDzp8CEQA7Kda2Gzs3VU7fo7R8+cjevBDu+bSdKc5JkvcCw4SpK
35D7W7vuy3w2AvommEfqdYz346mQLnrTBkDVEhSWTKSQiewRT1GCrTFX/psooGa/
QqN0jrr3reRjbYPVrks0gvZLpgs9nUFWbIq2nrbj37m2neqeXQVvJzzmjYEoSjWv
baOccnwMbwLd5ChYtyGu/JDwNSVqaS03kRcEu/ljxgwd48Hnws0G2/o8MV1LgvzQ
HoZ4nMM6smJ9Bc+uLV7z1zXYQiEeRX3Qklxry1FucOE023BKRzZYYEZVkiL//N2s
xOg/w7XgK0OkV7y91+0nQhwMF0mYn8JzKw4REPTFlRzIO3lDVmTjieeYUBu/LmKB
3awzHY/leAkBkDwmwaBnvlOj3nxKehjDLzCXTo+9AztRYssok68ddpMLTiOLhxdh
y28+K3DggQPv1pjZ8ogJk9fU/EdEmPsoL/SeMD9oUQZ/zvlc1RlCZxN0sbowKugZ
G1uzDFRHe29bMnFtbsiS
=5O3t
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
