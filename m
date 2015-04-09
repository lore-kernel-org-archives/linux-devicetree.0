From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] iio: mlx90614: Add devicetree bindings documentation
Date: Thu, 09 Apr 2015 15:05:24 +0100
Message-ID: <55268724.1040102@kernel.org>
References: <1427704502-22347-1-git-send-email-vianney.leclement@essensium.com> <1427704502-22347-3-git-send-email-vianney.leclement@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427704502-22347-3-git-send-email-vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Vmlhbm5leSBsZSBDbMOpbWVudCBkZSBTYWludC1NYXJjcQ==?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Arnout Vandecappelle (Essensium/Mind)" <arnout-agwphqFHkxc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/03/15 09:34, Vianney le Cl=C3=A9ment de Saint-Marcq wrote:
> Also introduce "melexis" as a vendor prefix for device tree bindings.
>=20
> Signed-off-by: Vianney le Cl=C3=A9ment de Saint-Marcq <vianney.leclem=
ent-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout-agwphqFHkxc@public.gmane.org>
Nothing even remotely controversial in here so applied to the togreg br=
anch of iio.git
initially pushed out as testing.  Thanks,

Jonathan
>=20
> ---
>=20
> v3: new patch split out from v2 patch 6 (power management)
> ---
>  .../devicetree/bindings/iio/temperature/mlx90614.txt      | 15 +++++=
++++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt     |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature=
/mlx90614.txt
>=20
> diff --git a/Documentation/devicetree/bindings/iio/temperature/mlx906=
14.txt b/Documentation/devicetree/bindings/iio/temperature/mlx90614.txt
> new file mode 100644
> index 0000000..4c959f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/mlx90614.txt
> @@ -0,0 +1,15 @@
> +* Melexis MLX90614 contactless IR temperature sensor
> +
> +http://melexis.com/Infrared-Thermometer-Sensors/Infrared-Thermometer=
-Sensors/MLX90614-615.aspx
> +
> +Required properties:
> +
> +  - compatible: should be "melexis,mlx90614"
> +  - reg: the I2C address of the sensor
> +
> +Example:
> +
> +mlx90614@5a {
> +	compatible =3D "melexis,mlx90614";
> +	reg =3D <0x5a>;
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index fae26d0..c8db30c 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -110,6 +110,7 @@ lltc	Linear Technology Corporation
>  marvell	Marvell Technology Group Ltd.
>  maxim	Maxim Integrated Products
>  mediatek	MediaTek Inc.
> +melexis	Melexis N.V.
>  merrii	Merrii Technology Co., Ltd.
>  micrel	Micrel Inc.
>  microchip	Microchip Technology Inc.
>=20
