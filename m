From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 3/3] MIPS: ath79: Fix the USB PHY reset names
Date: Sat, 11 Feb 2017 22:01:29 +0000
Message-ID: <20170211220129.GG24226@jhogan-linux.le.imgtec.org>
References: <1486324352-15188-1-git-send-email-albeu@free.fr>
 <1486324352-15188-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486324352-15188-3-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alban,

On Sun, Feb 05, 2017 at 08:52:32PM +0100, Alban wrote:
> From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
>=20
> The binding for the USB PHY went thru before the driver. However the
> new version of the driver now use the PHY core support for reset, and
> this expect the reset to be named "phy". So remove the "usb-" prefix
> from the the reset names.
>=20
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/phy/phy-ath79-usb.txt | 4 ++--
>  arch/mips/boot/dts/qca/ar9132.dtsi                      | 2 +-

<snip>

> diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/=
ar9132.dtsi
> index 302f0a8..808c2bb 100644
> --- a/arch/mips/boot/dts/qca/ar9132.dtsi
> +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> @@ -160,7 +160,7 @@
>  	usb_phy: usb-phy {
>  		compatible =3D "qca,ar7100-usb-phy";
> =20
> -		reset-names =3D "usb-phy", "usb-suspend-override";
> +		reset-names =3D "phy", "suspend-override";

Does arch/mips/boot/dts/qca/ar9331.dtsi need updating too?

Cheers
James

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYn4m5AAoJEGwLaZPeOHZ6XkYP/3a3EJjcO6KRWAcUXp4vm5wR
yCmBsyBfzKJUWqbHO/XmHir5ERVrySuE5iDDEHzqWjgD9E/o1VF0m9N4/BlHdiy+
OUhGm5j88wN6S99tXUrIaJGy93kIrMnQT1gxrYqIcDB+/kywfKUUH5exWAlFfXW0
mcN6YWrPSkw8At65pml2an5JmJRX0ROIhwTonBO+18WX6UyUg3CyoxESNcnkb6Hi
fWUi6em8cOYFTZF3jgSvBMe/PGIBxDGHvzJsre4TzzguP6a4OSe28lC+IJda08d7
jIek8Tcc1Nyvu64Lc4uomdcBMzHPrThW35DfuvtjEDf/fYgSGH5/7qpt2FXvDOVN
ofPAgzB7eRzayi8HjDx1F1CUbEkkjK7G90xN72onDMBhVYlxQUvOW8lKJevVMA5U
Dq2L0eHfVzkZVrJNbz8lE18d4BtsMCfwCYpeIdmaVEUTfU6e+H9U22j/2NagnaiK
8mvhFOZISDWukUnxoxgbpwFp4i1TSCAmx97FaGeakO8lNwrX77ltH9mODf2gmThh
V7qZDcLE/e3M0g9S7vuN+/IK+ERQlx6qWA3WIbGKC236CPRHvpv4Hbl6iWoDs6T4
3sZ88YRsKwio4ONQKqY4cbrlzXVt6cFjdSHdw2Mm0c5LTPVQ51WQlIsce1yowMDT
JqM7QnZznw/MPUU5Wbtf
=RsVl
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
