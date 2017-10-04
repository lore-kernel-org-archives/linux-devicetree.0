From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: aspeed-romulus: Add I2C devices
Date: Thu, 05 Oct 2017 10:05:03 +1030
Message-ID: <1507160103.5452.35.camel@aj.id.au>
References: <20171004064917.2498-1-joel@jms.id.au>
         <20171004064917.2498-5-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-o23tIIDcCr0o0Z10Jg6v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171004064917.2498-5-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-o23tIIDcCr0o0Z10Jg6v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 17:19 +1030, Joel Stanley wrote:
> Enable the buses that are in use and the devices that are attached.
> Currently that is just the battery backed RTC.
>=C2=A0
> Some of these buses are for hotplugged cards, such as PCIe cards. Others
> do not yet have upstream drivers, so there are no devices attached.
>=C2=A0
> Reviewed-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> v2:
> =C2=A0- Use okay not enabled for the status
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 54 +++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 54 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 1190fec1b5d0..8b96baf7c4de 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -79,3 +79,57 @@
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&pinctrl_rmii1_default>;
> =C2=A0};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	/* PCIe slot 1 (x8) */
> +	status =3D "okay";
> +};
> +
> +&i2c7 {
> +	/* PCIe slot 2 (x16) */
> +	status =3D "okay";
> +};
> +
> +&i2c8 {
> +	/* PCIe slot 3 (x16) */
> +	status =3D "okay";
> +};
> +
> +&i2c9 {
> +	/* PCIe slot 4 (x16) */
> +	status =3D "okay";
> +};
> +
> +&i2c10 {
> +	/* PCIe slot 5 (x8) */
> +	status =3D "okay";
> +};
> +
> +&i2c11 {
> +	status =3D "okay";
> +
> +	rtc@32 {
> +		compatible =3D "epson,rx8900";
> +		reg =3D <0x32>;
> +	};
> +};
> +
> +&i2c12 {
> +	status =3D "okay";
> +};
--=-o23tIIDcCr0o0Z10Jg6v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1XAnAAoJEJ0dnzgO5LT5S8AP/02EhFhMopSnlXjEXI0YPK8X
pXvw2aN5PLsvvmOCaeEFKs2+vjjoVbuI3NBDxsmc/4XHfQLfHqiqACEMyEXW2GIT
UmK9pXDlSyluLqnx/vnsCwbz/4xJNYP2VkkBx2L36JTWcR8pV3DiL9UJ8DlU5DL5
npj0VlF2Nxl/a9CV1j9/rQq0E1t8CAwRLLURuqjgi6GWf1ORv7RiCYiNvOMkp5on
4MNFIiqOAKWsBdtkkz0SlZVxd6PYlo6Xi+NZ6V8ofijRlBh3Ep0LMoYejIy1SJOb
9Xa99xTmA2Gyql5pKhzKKpQRDoBirPlaQFTy7OUcCSxnf1aXZc/WuTDsWGdZm0VJ
tOeHHeVruaqM2gwnLLUgMPfIDYffS3wat0YiaAJu7wF6gFr3ZUdEDIFz0e62uddF
HwlVasBXnYhPc9wxvMIt6olYLWB90rIjfGNxNZyXrkLPOmpw3zpfjr+PiPw6q0u5
A1MuH4lNZ4djqtO5SXkJQDXNW0uQx2zOhANMO0FBej/MdUfCy2hf37fEUVjmQMyN
srdPCC1HusLY10cmCGssVriknbJayeUT3E9xw6flUNJXj0ZxiWVacxQBbZ1yYrDD
uThU/boXLVsPfTDDs85C1hhHuJH+ugKv9xLbYjA6g5AOgoB5QpGqOK/I66APsf70
o6WvxBIDuVu5SMl/6ltV
=8aku
-----END PGP SIGNATURE-----

--=-o23tIIDcCr0o0Z10Jg6v--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
