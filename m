From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: spi-nand: add devicetree binding
Date: Thu, 8 Jan 2015 14:35:42 +0000
Message-ID: <20150108143542.GF10537@leverpostej>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB425@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A04AB425-xjs9rfTec9KBtk7LW/CC8tTcztV8WXajQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?= <peterpandong-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qi Wang =?utf-8?B?546L6LW3IChxaXdhbmcp?= <qiwang-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>, Frank Liu =?utf-8?B?5YiY576kIChmcmFua2xpdSk=?= <frankliu-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>, Melanie Zhang =?utf-8?B?5byg54eVIChtZWxhbmllemhhbmcp?= <melaniezhang-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 08, 2015 at 12:52:26AM +0000, Peter Pan =E6=BD=98=E6=A0=8B =
(peterpandong) wrote:
> This commit adds the devicetree binding document that specifies the
> spi nand devices support.
>=20
> Signed-off-by: Peter Pan <peterpandong-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/spi-nand.txt | 22 ++++++++++++=
++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/spi-nand.txt
> new file mode 100644
> index 0000000..9dd3efd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> @@ -0,0 +1,22 @@
> +* NAND driver for MT29F, GD5F and similar SPI NAND flash chips
> +
> +Required properties:
> +- #address-cells, #size-cells : Must be present if the device has su=
b-nodes
> +  representing partitions.

Can we refer to the binding document for that?

> +- compatible : Should be the manufacturer and the name of the chip. =
Bear in mind
> +               the DT binding is not Linux-only, but in case of Linu=
x, see the
> +               "spi_nand_id_table" array in drivers/mtd/spi-nand/spi=
-nand-device.c
> +               for the list of supported chips.

NAK for referring to Linux internals from a binding document.

The list of compatible string should be defined in this binding
document.

> +- reg : Chip-Select number
> +- spi-max-frequency : Maximum frequency of the SPI bus the chip can =
operate at
> +
> +Example:
> +
> +	flash: flash@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;

These aren't necessary as no partitions are defined here.

Otherwise, this looks ok.

Thanks,
Mark.

> +		compatible =3D "micron,mt29f";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <50000000>;
> +	};
> +
> --=20
> 1.9.1
> N=E5=AB=A5=E5=8F=89=E9=9D=A3=E7=AC=A1y=EE=8C=B7=E6=B0=8Ab=E7=9E=82=EE=
=83=91=E5=8D=83v=E8=B1=9D?=E8=97=93{.n?=E5=A3=8F=E6=BC=BD=E9=B4=BEz=E8=B0=
=B5z)=E9=9F=B0=E9=AA=85w*=1Fjg=EE=83=8C?=E7=A7=B9=E6=AE=A0=E5=A8=B8=EE=95=
=90/=E4=BE=81=E9=8B=A4=E7=BD=90=E6=9E=88?=E5=A8=B9=E6=AB=92=E7=92=80??=E6=
=91=BA=E7=8E=9C=E5=9B=A4=7F=EE=92=BF=1E=E7=93=BD=E7=8F=B4=E9=96=94?=E9=8E=
=97:+v=E5=A2=BE=E5=A6=9B=E9=91=B6=E4=BD=B6
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
