From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [v5,1/8] dt-bindings: mfd: Add retu/tahvo ASIC chips bindings
Date: Wed, 19 Apr 2017 21:39:33 +0200
Message-ID: <20170419193933.ocnhxdfojanp5324@ninjato>
References: <20170412172800.23035-2-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7sey23xxqp5mnjvx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170412172800.23035-2-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7sey23xxqp5mnjvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2017 at 02:27:52PM -0300, Javier Martinez Canillas wrote:
> There are Device Tree source files defining a device node for the
> retu/tahvo I2C chip, but there isn't a DT binding document for it.
>=20
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
> Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>=20
> Changes in v5:
> - Add missing properties for interrupts to DT binding doc (Rob Herring).
> - Add Rob Herring's Acked-by tag.
> - Add Aaro Koskinen's Acked-by tag.
> - Add Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>'s Acked-by tag.
> - Add Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>'s Acked-by tag.
>=20
> Changes in v4:
> - Use "dt-bindings: mfd:" prefix in subject line (Rob Herring).
> - Add information about what functions the device serve (Lee Jones).
> - Avoid using MFD in Device Tree (Lee Jones).
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  Documentation/devicetree/bindings/mfd/retu.txt | 23 ++++++++++++++++++++=
+++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentati=
on/devicetree/bindings/mfd/retu.txt
> new file mode 100644
> index 000000000000..e1ea3a36a038
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/retu.txt
> @@ -0,0 +1,23 @@
> +* Device tree bindings for Nokia Retu and Tahvo multi-function device
> +
> +Retu and Tahvo are a multi-function devices found on Nokia Internet
> +Tablets (770, N800 and N810). The Retu chip provides watchdog timer
> +and power button control functionalities while Tahvo chip provides
> +USB transceiver functionality.
> +
> +Required properties:
> +- compatible:		"nokia,retu" or "nokia,tahvo"
> +- reg:			Specifies the I2C slave address of the ASIC chip

This should be "CBUS slave address". CBUS is a strange subset of I2C,
yet I'd like the distinction because 0x1 is not a valid I2C address.

> +- interrupts: 		The interrupt line the device is connected to
> +- interrupt-parent:	The parent interrupt controller
> +
> +Example:
> +
> +i2c0 {

To make it super clear, we are talking CBUS here, it might make sense to
add here:
+	compatible =3D "i2c-cbus-gpio";
+	...

? It could be argued that the above "i2c0" should be "cbus0" as well but
that is a separate issue, I'd think.

> +	retu: retu@1 {
> +		compatible =3D "nokia,retu";
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <12 IRQ_TYPE_EDGE_RISING>;
> +		reg =3D <0x1>;
> +	};
> +};

--7sey23xxqp5mnjvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj3vPUACgkQFA3kzBSg
KbYTdhAAoiQaQHJMlLp0mJADYOqK6kwSFkF9N7+OHaBEw41dDsmasQMwFFf+kI0h
c0KFhN0jjh0YZtWgjMnEeBs+E2bP5VZ5AvOY9pTTK4qYOnaQ/N8fIFD0i/OwW9VP
yGkfGZBlLcxIQKmJqY+VOwlnmnJpR3WP+V1RTZSwHWjz9+83L/AyKrg56jDrBhV3
dvpglg/TJjoP5vIxP43Osfmo2Ot9HDDmI7re1yvevFkVgwxhUjw+5RR79rNmF7Ly
S6vio+xfGpkM61RlaCE3mebmoC/3nO6qNTtCrrJaE/P0wREijaISLqcwVngibTI0
sey2cJMw/QRTxXQZ8IbKza5uP56EDrUReMB58fNvpsFDnhkQeqpuG1/pfoc+Iz7P
r0MBgSSgRBy1RNuaOBa68qiH8L7p8leT/rsw7vP4v/DmDdv9ijB6iTIm7oXOeOa8
N1gZjeH1XAdnJkVpPyhdjGpOiuXE8gDcwYkYFsj801V+5NDjpgcDnL0Ik9PJZash
lsJQh0JSOgYsTBR9XAV3Dxww0+akDdXCtwCxLWYmJJWp/NL8N2uM/68TT+pjdNKV
b/DfAgUpCyUA+30wPZpArECLIVIQeGVdWF3UTDSSX+x0bH2sYC/H9SxMY7NU7cbW
ZT2qxeENtW68wqvFNKXCL8qgk2INthXPDwpYQSLvS43pHb7zEUE=
=zl6M
-----END PGP SIGNATURE-----

--7sey23xxqp5mnjvx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
