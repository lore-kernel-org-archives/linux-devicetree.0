From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: update the Allwinner GPADC device
 tree binding for H3 & A83T
Date: Wed, 31 Jan 2018 18:40:59 +0100
Message-ID: <20180131174058.f7gog7yahcu67sqr@qschulz>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-2-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cinr2hcuoq4lp4p4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128232919.12639-2-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cinr2hcuoq4lp4p4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Mon, Jan 29, 2018 at 12:29:04AM +0100, Philipp Rossak wrote:
> Allwinner H3 features a thermal sensor like the one in A33, but has its
> register re-arranged, the clock divider moved to CCU (originally the
> clock divider is in ADC) and added a pair of bus clock and reset.
>=20
> Allwinner A83T features a thermal sensor similar to the H3, the ths clock,
> the bus clock and the reset was removed from the CCU. The THS in A83T
> has a clock that is directly connected and runs with 24 MHz.
>=20
> Update the binding document to cover H3 and A83T.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 50 ++++++++++++++++=
++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Docu=
mentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> index 86dd8191b04c..22df0c5c23d4 100644
> --- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
> @@ -4,12 +4,35 @@ The Allwinner SoCs all have an ADC that can also act as=
 a thermal sensor
>  and sometimes as a touchscreen controller.
> =20
>  Required properties:
> -  - compatible: "allwinner,sun8i-a33-ths",
> +  - compatible: must contain one of the following compatibles:
> +		- "allwinner,sun8i-a33-ths"
> +		- "allwinner,sun8i-h3-ths"
> +		- "allwinner,sun8i-a83t-ths"
>    - reg: mmio address range of the chip,
> -  - #thermal-sensor-cells: shall be 0,
> +  - #thermal-sensor-cells: shall be 0 or 1,

Well, thermal-sensor-cells is either 0 or 1 :)

Better to point to the documentation describing this
thermal-sensor-cells IMHO.

>    - #io-channel-cells: shall be 0,
> =20
> -Example:
> +Required properties for the following compatibles:
> +		- "allwinner,sun8i-h3-ths"
> +		- "allwinner,sun8i-a83t-ths"
> +  - interrupts: the sampling interrupt of the ADC,
> +
> +Required properties for the following compatibles:
> +		- "allwinner,sun8i-h3-ths"
> +  - clocks: the bus clock and the input clock of the ADC,
> +  - clock-names: should be "bus" and "mod",
> +  - resets: the bus reset of the ADC,
> +
> +Optional properties for the following compatibles:
> +		- "allwinner,sun8i-h3-ths"
> +  - nvmem-cells: A phandle to the calibration data provided by a nvmem d=
evice.
> +		If unspecified default values shall be used. The size should
> +		be 0x2 * sensorcount.

"twice the number of sensors" ?

> +  - nvmem-cell-names: Should be "calibration".
> +
> +Details see: bindings/nvmem/nvmem.txt
> +
> +Example for A33:
>  	ths: ths@1c25000 {
>  		compatible =3D "allwinner,sun8i-a33-ths";
>  		reg =3D <0x01c25000 0x100>;
> @@ -17,6 +40,27 @@ Example:
>  		#io-channel-cells =3D <0>;
>  	};
> =20
> +Example for H3:
> +	ths: thermal-sensor@1c25000 {
> +		compatible =3D "allwinner,sun8i-h3-ths";
> +		reg =3D <0x01c25000 0x400>;
> +		clocks =3D <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
> +		clock-names =3D "bus", "mod";
> +		resets =3D <&ccu RST_BUS_THS>;
> +		interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +		#thermal-sensor-cells =3D <0>;
> +		#io-channel-cells =3D <0>;
> +	};
> +
> +Example for A83T:
> +	ths: thermal-sensor@1f04000 {
> +		compatible =3D "allwinner,sun8i-a83t-ths";
> +		reg =3D <0x01f04000 0x100>;
> +		interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +		#thermal-sensor-cells =3D <1>;
> +		#io-channel-cells =3D <0>;
> +	};
> +

Aside from Maxime's comment on how we would like to refactor GPADC/THS,
I'm not sure we really want an example for each an every thermal sensor
supported.

Quentin

--cinr2hcuoq4lp4p4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJacf+nAAoJEIS4mnU+4PGj74oQAIoUg6DY/r/AEbZmlPptIJ9b
aBi8OCOKDhpYI4roSMxtKNSmqsmQEooyEiisUNIVxJ178ZOaoT82X5gJNj6fLg2t
rW/H51Eile4ThT9jwyPU+ht+DGocH6mkoSykJypZHhzHHNOpaQPkClhrT8Yi0/25
9pgqBhMgBtzORBa1oZnTwR0j5lCmYzxY0izhuTnxsI92geqsjUWoOyJQIbUAymya
xG7TeBkFeKuR0tMgLb9Q9s3GXlzrMvESWsT1D3DRZYF8+rD/Z5ivO3ypK0+n3WzW
GKZHWtmSFXxF8kkqrvp3oxleSu+t7/F4My3lrfhsYhYUGELYH1IJKaSp/2i6AIMB
A9XswCfySEw3ef6g54BkcAbHfqT5eyMBLF+JRcQrteiRV7QtpT5HweHPYHX5pZIZ
9QZxsiMSIe9dEz4M1MMkSeUL0/SvU7uzGjMO2FA23RmRbhtOnq6Qdd2NycAY/8xf
jg9gRZaiC1/6LwVWmF4QFA+Au4IWU3WsD6Q04aQmufat5Gw1t9w8L5PVmxwEeqSK
U7wcZ7xkQgct83zfj8WL7cX1p3bZASxASB5WbhtLVaUf3WOXVhuMMH0d11/iEUVZ
5Wn2rRAJRt92dYdy1Noj8xUyfr7F5h3dNO6zGcsbgsSzOJ3xTqfJcC7cYrVenNXU
+QIMW79fbDxyp8LP9/z6
=Bn5q
-----END PGP SIGNATURE-----

--cinr2hcuoq4lp4p4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
