From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: aspeed-romulus: Add I2C devices
Date: Wed, 04 Oct 2017 15:32:19 +1030
Message-ID: <1507093339.5452.13.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-5-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-DIe9cIUZcKX06Co5J6bn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-5-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-DIe9cIUZcKX06Co5J6bn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> Enable the buses that are in use and the devices that are attached.
> Currently that is just the battery backed RTC.
>=C2=A0
> Some of these buses are for hotplugged cards, such as PCIe cards. Others
> do not yet have upstream drivers, so there are no devices attached.
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 54 +++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 54 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 1190fec1b5d0..f79c1d21c47f 100644
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
> +	status =3D "enabled";

This is not okay. Neither are those below.

Cheers,

Andrew

> +};
> +
> +&i2c7 {
> +	/* PCIe slot 2 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c8 {
> +	/* PCIe slot 3 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c9 {
> +	/* PCIe slot 4 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c10 {
> +	/* PCIe slot 5 (x8) */
> +	status =3D "enabled";
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
--=-DIe9cIUZcKX06Co5J6bn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1GtbAAoJEJ0dnzgO5LT52HEQAKtcX0gAubwT8IviKTj8V3j3
B7rbyFQia7e3+Wbyd6HULStxTnoli6BpY7X0F/1OetKoNTqX5qk/APHIu4DsGoBv
pKV4LB8RQX8uYvFVs3u8b6QCAts99/gK5LeQ/DZg4FueqgirlK1MXC1XKCMInA/S
TtRCAbQtagWj8ED2XlfJP+KYgDpW20WklLxPSeINEaGR9fnMMquFUaiaDfBE0wwL
eYemgbSeBc0RICy3HpKpLeWA3BXuFmXUFmLzibmq0A9G4OUIdPEWbGWinR4lF4h8
cCDahwS1zSzC1lBvAhdoNHu5PJSWt66gnqqT4MS8+5S+QHLPbof06D/2W7mT9GL0
G2A69iKj7htdPj5KnroQYafRewaEN0TvzmcLnm665kRNMBM0npdLJhgZTv2hArul
2Be4x4U219NRysloB8HlmSOfqptuqWpMIZLLnYx3sQ3ovwYQAqB1U9b+lDFxzHu/
AiYEn71CUM8ofkn/W/FCvA0Ln/6ILHTEiu2WoKinCGbCKwzRwUUotlaVyOotuyCY
wo3vLR50CK4atTbJmiQxY6od3oSktbZb0aCCLLGvFq+jnbT47AhzLuxkVlMDkUkQ
xd7VzLwqgwmidqVEKbOIDIhiN6aW+RfZdKcaL5am5/g1B7FssK2/v4sFUW3JAIyS
O81BVOSMg9u3R5qx5oft
=0fNQ
-----END PGP SIGNATURE-----

--=-DIe9cIUZcKX06Co5J6bn--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
