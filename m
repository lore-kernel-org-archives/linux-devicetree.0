From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: fpga: add xilinx slave-serial
 binding description
Date: Thu, 16 Mar 2017 12:01:57 +0100
Message-ID: <10677530-3c57-d3d9-ae9d-e29a6fcf4de7@monstr.eu>
References: <1488300022-30150-1-git-send-email-agust@denx.de>
 <1488300022-30150-2-git-send-email-agust@denx.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="WDP0eXEs3pgArodcpT5nXvm1pWosEWVAX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488300022-30150-2-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WDP0eXEs3pgArodcpT5nXvm1pWosEWVAX
Content-Type: multipart/mixed; boundary="D3FU5wQChTBJ2Xn28LWtQFKEXOHhCQADs";
 protected-headers="v1"
From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>,
 Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Message-ID: <10677530-3c57-d3d9-ae9d-e29a6fcf4de7-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: fpga: add xilinx slave-serial
 binding description
References: <1488300022-30150-1-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
 <1488300022-30150-2-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
In-Reply-To: <1488300022-30150-2-git-send-email-agust-ynQEQJNshbs@public.gmane.org>

--D3FU5wQChTBJ2Xn28LWtQFKEXOHhCQADs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 28.2.2017 17:40, Anatolij Gustschin wrote:
> Add dt binding documentation details for Xilinx FPGA configuration
> over slave serial interface.
>=20
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> Acked-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Changes in v4:
>=20
>  - add Acked-by tags
> =20
> Changes in v3:
>=20
>  - extend example to show the usage in SPI master node, connected
>    to the fpga-region node
>=20
> Changes in v2:
>=20
>  - correct gpios properties in example to match above description
>=20
>  - use fpga-mgr@0 instead of fpga-spi@0 in example
>=20
>  .../bindings/fpga/xilinx-slave-serial.txt          | 44 ++++++++++++++=
++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave=
-serial.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial=
=2Etxt b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
> new file mode 100644
> index 0000000..9766f74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
> @@ -0,0 +1,44 @@
> +Xilinx Slave Serial SPI FPGA Manager
> +
> +Xilinx Spartan-6 FPGAs support a method of loading the bitstream over
> +what is referred to as "slave serial" interface.
> +The slave serial link is not technically SPI, and might require extra
> +circuits in order to play nicely with other SPI slaves on the same bus=
=2E
> +
> +See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf=

> +
> +Required properties:
> +- compatible: should contain "xlnx,fpga-slave-serial"
> +- reg: spi chip select of the FPGA
> +- prog_b-gpios: config pin (referred to as PROGRAM_B in the manual)
> +- done-gpios: config status pin (referred to as DONE in the manual)
> +
> +Example for full FPGA configuration:
> +
> +	fpga-region0 {
> +		compatible =3D "fpga-region";
> +		fpga-mgr =3D <&fpga_mgr_spi>;
> +		#address-cells =3D <0x1>;
> +		#size-cells =3D <0x1>;
> +	};
> +
> +	spi1: spi@10680 {
> +		compatible =3D "marvell,armada-xp-spi", "marvell,orion-spi";
> +		pinctrl-0 =3D <&spi0_pins>;
> +		pinctrl-names =3D "default";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		cell-index =3D <1>;
> +		interrupts =3D <92>;
> +		clocks =3D <&coreclk 0>;
> +		status =3D "okay";
> +
> +		fpga_mgr_spi: fpga-mgr@0 {
> +			compatible =3D "xlnx,fpga-slave-serial";
> +			spi-max-frequency =3D <60000000>;
> +			spi-cpha;
> +			reg =3D <0>;
> +			done-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> +			prog_b-gpios =3D <&gpio0 29 GPIO_ACTIVE_LOW>;
> +		};
> +	};
>=20

Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--D3FU5wQChTBJ2Xn28LWtQFKEXOHhCQADs--

--WDP0eXEs3pgArodcpT5nXvm1pWosEWVAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAljKcKYACgkQykllyylKDCFIKgCfdrEwOgR9HntCt4QGXXct2cGb
AEAAnjxhWgOa2xe5vql5No5nXtUAN2sZ
=YUed
-----END PGP SIGNATURE-----

--WDP0eXEs3pgArodcpT5nXvm1pWosEWVAX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
