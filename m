From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] iio: st-sensors: add support for lis3lv02d
 accelerometer
Date: Wed, 18 Mar 2015 15:39:48 +0000
Message-ID: <20150318153948.GQ3318@x1>
References: <1426672326-6292-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426672326-6292-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Mar 2015, Linus Walleij wrote:

> This adds support for the LIS3LV02 accelerometer found in the
> ST Microelectronics Nomadik board series.
>=20
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> I'm not giving up on this. I think the st-sensors driver should
> support this variant as its framework is way better than the misc
> driver. The other driver is anyway not even in the right subsystem.

I'm not sure what the historical issues are, but the code looks fine
to me.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/iio/st-sensors.txt         |  1 +
>  drivers/iio/accel/st_accel.h                       |  1 +
>  drivers/iio/accel/st_accel_core.c                  | 81 ++++++++++++=
++++++++++
>  drivers/iio/accel/st_accel_i2c.c                   |  4 ++
>  4 files changed, 87 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/D=
ocumentation/devicetree/bindings/iio/st-sensors.txt
> index a7a0a15913ad..d2aaca974531 100644
> --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> @@ -23,6 +23,7 @@ standard bindings from pinctrl/pinctrl-bindings.txt=
=2E
>  Valid compatible strings:
> =20
>  Accelerometers:
> +- st,lis3lv02dl-accel
>  - st,lsm303dlh-accel
>  - st,lsm303dlhc-accel
>  - st,lis3dh-accel
> diff --git a/drivers/iio/accel/st_accel.h b/drivers/iio/accel/st_acce=
l.h
> index fa9646034305..7ee9724b1428 100644
> --- a/drivers/iio/accel/st_accel.h
> +++ b/drivers/iio/accel/st_accel.h
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  #include <linux/iio/common/st_sensors.h>
> =20
> +#define LIS3LV02DL_ACCEL_DEV_NAME	"lis3lv02dl_accel"
>  #define LSM303DLHC_ACCEL_DEV_NAME	"lsm303dlhc_accel"
>  #define LIS3DH_ACCEL_DEV_NAME		"lis3dh"
>  #define LSM330D_ACCEL_DEV_NAME		"lsm330d_accel"
> diff --git a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st=
_accel_core.c
> index 53f32629283a..58d1d13d552a 100644
> --- a/drivers/iio/accel/st_accel_core.c
> +++ b/drivers/iio/accel/st_accel_core.c
> @@ -129,6 +129,30 @@
>  #define ST_ACCEL_3_IG1_EN_MASK			0x08
>  #define ST_ACCEL_3_MULTIREAD_BIT		false
> =20
> +/* CUSTOM VALUES FOR SENSOR 4 */
> +#define ST_ACCEL_4_WAI_EXP			0x3a
> +#define ST_ACCEL_4_ODR_ADDR			0x20
> +#define ST_ACCEL_4_ODR_MASK			0x30 /* DF1 and DF0 */
> +#define ST_ACCEL_4_ODR_AVL_40HZ_VAL		0x00
> +#define ST_ACCEL_4_ODR_AVL_160HZ_VAL		0x01
> +#define ST_ACCEL_4_ODR_AVL_640HZ_VAL		0x02
> +#define ST_ACCEL_4_ODR_AVL_2560HZ_VAL		0x03
> +#define ST_ACCEL_4_PW_ADDR			0x20
> +#define ST_ACCEL_4_PW_MASK			0xc0
> +#define ST_ACCEL_4_FS_ADDR			0x21
> +#define ST_ACCEL_4_FS_MASK			0x80
> +#define ST_ACCEL_4_FS_AVL_2_VAL			0X00
> +#define ST_ACCEL_4_FS_AVL_6_VAL			0X01
> +#define ST_ACCEL_4_FS_AVL_2_GAIN		IIO_G_TO_M_S_2(1024)
> +#define ST_ACCEL_4_FS_AVL_6_GAIN		IIO_G_TO_M_S_2(340)
> +#define ST_ACCEL_4_BDU_ADDR			0x21
> +#define ST_ACCEL_4_BDU_MASK			0x40
> +#define ST_ACCEL_4_DRDY_IRQ_ADDR		0x21
> +#define ST_ACCEL_4_DRDY_IRQ_INT1_MASK		0x04
> +#define ST_ACCEL_4_IG1_EN_ADDR			0x21
> +#define ST_ACCEL_4_IG1_EN_MASK			0x08
> +#define ST_ACCEL_4_MULTIREAD_BIT		true
> +
>  static const struct iio_chan_spec st_accel_12bit_channels[] =3D {
>  	ST_SENSORS_LSM_CHANNELS(IIO_ACCEL,
>  			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
> @@ -373,6 +397,63 @@ static const struct st_sensor_settings st_accel_=
sensors_settings[] =3D {
>  		.multi_read_bit =3D ST_ACCEL_3_MULTIREAD_BIT,
>  		.bootime =3D 2,
>  	},
> +	{
> +		.wai =3D ST_ACCEL_4_WAI_EXP,
> +		.sensors_supported =3D {
> +			[0] =3D LIS3LV02DL_ACCEL_DEV_NAME,
> +		},
> +		.ch =3D (struct iio_chan_spec *)st_accel_12bit_channels,
> +		.odr =3D {
> +			.addr =3D ST_ACCEL_4_ODR_ADDR,
> +			.mask =3D ST_ACCEL_4_ODR_MASK,
> +			.odr_avl =3D {
> +				{ 40, ST_ACCEL_4_ODR_AVL_40HZ_VAL },
> +				{ 160, ST_ACCEL_4_ODR_AVL_160HZ_VAL, },
> +				{ 640, ST_ACCEL_4_ODR_AVL_640HZ_VAL, },
> +				{ 2560, ST_ACCEL_4_ODR_AVL_2560HZ_VAL, },
> +			},
> +		},
> +		.pw =3D {
> +			.addr =3D ST_ACCEL_4_PW_ADDR,
> +			.mask =3D ST_ACCEL_4_PW_MASK,
> +			.value_on =3D ST_SENSORS_DEFAULT_POWER_ON_VALUE,
> +			.value_off =3D ST_SENSORS_DEFAULT_POWER_OFF_VALUE,
> +		},
> +		.enable_axis =3D {
> +			.addr =3D ST_SENSORS_DEFAULT_AXIS_ADDR,
> +			.mask =3D ST_SENSORS_DEFAULT_AXIS_MASK,
> +		},
> +		.fs =3D {
> +			.addr =3D ST_ACCEL_4_FS_ADDR,
> +			.mask =3D ST_ACCEL_4_FS_MASK,
> +			.fs_avl =3D {
> +				[0] =3D {
> +					.num =3D ST_ACCEL_FS_AVL_2G,
> +					.value =3D ST_ACCEL_4_FS_AVL_2_VAL,
> +					.gain =3D ST_ACCEL_4_FS_AVL_2_GAIN,
> +				},
> +				[1] =3D {
> +					.num =3D ST_ACCEL_FS_AVL_6G,
> +					.value =3D ST_ACCEL_4_FS_AVL_6_VAL,
> +					.gain =3D ST_ACCEL_4_FS_AVL_6_GAIN,
> +				},
> +			},
> +		},
> +		.bdu =3D {
> +			.addr =3D ST_ACCEL_4_BDU_ADDR,
> +			.mask =3D ST_ACCEL_4_BDU_MASK,
> +		},
> +		.drdy_irq =3D {
> +			.addr =3D ST_ACCEL_4_DRDY_IRQ_ADDR,
> +			.mask_int1 =3D ST_ACCEL_4_DRDY_IRQ_INT1_MASK,
> +			.ig1 =3D {
> +				.en_addr =3D ST_ACCEL_4_IG1_EN_ADDR,
> +				.en_mask =3D ST_ACCEL_4_IG1_EN_MASK,
> +			},
> +		},
> +		.multi_read_bit =3D ST_ACCEL_4_MULTIREAD_BIT,
> +		.bootime =3D 2, /* guess */
> +	},
>  };
> =20
>  static int st_accel_read_raw(struct iio_dev *indio_dev,
> diff --git a/drivers/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_=
accel_i2c.c
> index c7246bdd30b9..6b720c190b2d 100644
> --- a/drivers/iio/accel/st_accel_i2c.c
> +++ b/drivers/iio/accel/st_accel_i2c.c
> @@ -21,6 +21,10 @@
>  #ifdef CONFIG_OF
>  static const struct of_device_id st_accel_of_match[] =3D {
>  	{
> +		.compatible =3D "st,lis3lv02dl-accel",
> +		.data =3D LIS3LV02DL_ACCEL_DEV_NAME,
> +	},
> +	{
>  		.compatible =3D "st,lsm303dlh-accel",
>  		.data =3D LSM303DLH_ACCEL_DEV_NAME,
>  	},

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
