From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 6/6] ARM: zynq: DT: Add OCM controller node
Date: Sun, 16 Nov 2014 11:51:54 +0100
Message-ID: <546881CA.2020801@suse.de>
References: <cover.1415962281.git.michal.simek@xilinx.com> <0a88d52b5e71fb220ca619180ec9ca746edad2b1.1415962281.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="QVnTDSNGMLh4LkFHhFJSbbIDXqvpHP3ln"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0a88d52b5e71fb220ca619180ec9ca746edad2b1.1415962281.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, monstr@monstr.eu, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QVnTDSNGMLh4LkFHhFJSbbIDXqvpHP3ln
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Am 14.11.2014 um 11:52 schrieb Michal Simek:
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
> index ce2ef5bec4f2..e217fb1c1169 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -150,6 +150,13 @@
>  			reg =3D <0xf8006000 0x1000>;
>  		};
>=20
> +		ocmc: memory-controller@f800c000 {
> +			compatible =3D "xlnx,zynq-ocmc-1.0";
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 3 4>;
> +			reg =3D <0xf800c000 0x1000>;
> +		};
> +
>  		uart0: serial@e0000000 {
>  			compatible =3D "xlnx,xuartps", "cdns,uart-r1p8";
>  			status =3D "disabled";

Not directly related to this patch: As one can see here, the node order
is quite a mess... According to Olof, nodes should be ordered by unit
address, whereas here some but not all seem ordered by node name. Would
you welcome a cleanup patch, or can you fix that yourself?

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrnbe=
rg


--QVnTDSNGMLh4LkFHhFJSbbIDXqvpHP3ln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUaIHQAAoJEPou0S0+fgE/+o4P/17swao7VtdOUDwnEB4XUHML
fOwKfuz0vwOyt8caopXBu0vRm2PDuwGKHXpV43Gi98prRa4KquRps6AIGb7reCbC
BEMMLzv4cR8CpMQegIYq5201WcYj8JJPJ4m0iopZC5LwjiEAVJZ3sUTIrodQh3Ft
1HhWHJMgX5PwnshnsISOw70HEkaBrmfPnSZlj9Zw/Qfa4Nw+yGX5bhEJe+ILpcbH
id01BN04NbFn4p1XEn5hYv5R8xkh9jh71H/qvBeqSoI+MRQt3MJLWF45xiAD6/JR
zGcdHF4R8MnbMy0EOV8k1GCbnc7cgcRwVZeaX3EcMtu3pQFM3p45zJhQ5Q0c1NSf
KmNXYIBQ3BXesU93yQoBVs6HqVlf1f1N/vSLJCk5aIkNziyCW2CysTa9k2WOvtb4
XCHHw2MfbtKQ9lxHOelhRkLM6TzpLFkZ0LUzTW3x3rOsmVTFUJoRPHg0p+JjYOua
FhkFGBRWb7Ru5thrmXAnW8XalMZk0ISOrCl714nQ0N2MMAjWVejcGgFZqWNHHib9
TpWVdcxwp2L7WcGPxygeM9xV2SbZdHYddH1bcCXyhTWbqaMcrfl0kD95xuAgxNpg
8j0yF2Xts/Nc2uEwwgVWiSRuXCiyHspHQnk4VHWWwM4teLRteK+rgowQsoKKsVyC
WdXdlvG2HpBcce1GyES8
=Lovr
-----END PGP SIGNATURE-----

--QVnTDSNGMLh4LkFHhFJSbbIDXqvpHP3ln--
