From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: nop: device tree documentation for vbus
Date: Fri, 21 Nov 2014 09:45:06 -0600
Message-ID: <20141121154506.GG7508@saruman>
References: <1415538138-24434-1-git-send-email-robert.jarzmik@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415538138-24434-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2014 at 02:02:18PM +0100, Robert Jarzmik wrote:
> Enhance the phy documentation by adding 2 new optional bindings :
>  - the vbus gpio, which detects usb insertion
>  - the vbus regulator, which provides current drawn from the usb cable
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt b/Do=
cumentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> index 1bd37fa..65dfe4b 100644
> --- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> @@ -17,6 +17,11 @@ Optional properties:
> =20
>  - reset-gpios: Should specify the GPIO for reset.
> =20
> +- vbus-gpios: should specify the GPIO detecting a VBus insertion
> +              (see Documentation/devicetree/bindings/gpio/gpio.txt)
> +- vbus-regulator : should specifiy the regulator supplying current drawn=
 from
> +  the VBus line (see Documentation/devicetree/bindings/regulator/regulat=
or.txt).
> +
>  Example:
> =20
>  	hsusb1_phy {
> @@ -26,8 +31,11 @@ Example:
>  		clock-names =3D "main_clk";
>  		vcc-supply =3D <&hsusb1_vcc_regulator>;
>  		reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> +		vbus-gpios =3D <&gpio2 13 GPIO_ACTIVE_HIGH>;
> +		vbus-regulator =3D <&vbus_regulator>;

not sure why you need vbus-gpios here. You can pass the gpio to the
regulator as enable-gpio, right ?

--=20
balbi

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUb14CAAoJEIaOsuA1yqREuewP/ixWqGSxrumNKPzM7r2/R6i2
ONs1LQm9mAcss06xtHxgaVtNQk9Y+s82ZhLTyr8p5eZNfQgirSMX+EsKj7XBqqHn
aulpBY1EDHOpVPHRr1fxG+G5X5QmpHYxqUz2T5TPLTsZsQWdORnEnMgqacR+kpQi
rxvNpxSSm9AiXascQGqZsT2TJWr87EwNzcAwS4e37czZnBuTbJUHJUc1LjKos6fe
VXMXYWn6uN54VnyY1FpALJ/2fn9PvO+USXnJfwg3P/S2IYaGczlb5KAwH02DrXeZ
KYKe8GAyqKRQ0laX40CV0kyMAzwWdpQoIDM7n9mLmLSiPKkwsG3DfON9mE4U2lKa
JZSKx9G9w77KpDJM/pgMbnoLTmP8d0OVOaHCJrRAuORWT91q8zjA3nSsIrWT0daG
n8+9MGj0OnSd24/M/nxyzh5XzAGt/fhw/4/3bHwbfi/phstFQWXzfo50c49A39sq
hpJdatQ8pzWCt8MC6vspCyYOICFsbUdulKIgH0RHE5+g1YTAyB4XSAdNdnmAkJM+
YlH2Yr5eRh2OFDhtS1RNkbrds5S78spAQDSG2pBgI28GNlxCwmJWJDI+QWUxJelz
Z+X+MQydtZ6pE5ZfHDTNxqvMX/oGlnnT/vWahtfLnTlfLhG50nwe6oD2K8U8dea3
64mgonJ/YYL/+NETvEHO
=sx6A
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
