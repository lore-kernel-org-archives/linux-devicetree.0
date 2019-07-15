Return-Path: <SRS0=klvX=VM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731086AbfGOVKk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 15 Jul 2019 17:10:40 -0400
Date: Mon, 15 Jul 2019 23:10:33 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH 1/3] iio: imu: st_lsm6sdx: move some register definitions
 to sensor_settings struct
Message-ID: <20190715211033.GA23126@localhost.localdomain>
References: <20190715131919.31938-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20190715131919.31938-1-martin.kepplinger@puri.sm>
Sender: devicetree-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Move some register definitions to the per-device array of struct
> st_lsm6dsx_sensor_settings in order to simplify adding new sensor
> devices to the driver.
>=20
> Also, remove completely unused register definitions.
>=20

Hi Martin,

just few comments inline

Regards,
Lorenzo

> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  6 ++++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 31 ++++++++++++++------
>  2 files changed, 28 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st=
_lsm6dsx/st_lsm6dsx.h
> index c14bf533b66b..f072ac14f213 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> @@ -196,6 +196,9 @@ struct st_lsm6dsx_ext_dev_settings {
>  /**
>   * struct st_lsm6dsx_settings - ST IMU sensor settings
>   * @wai: Sensor WhoAmI default value.
> + * @reg_int1_addr: Control Register address for INT1
> + * @reg_int2_addr: Control Register address for INT2
> + * @reg_reset_addr: register address for reset/reboot
>   * @max_fifo_size: Sensor max fifo length in FIFO words.
>   * @id: List of hw id/device name supported by the driver configuration.
>   * @decimator: List of decimator register info (addr + mask).
> @@ -206,6 +209,9 @@ struct st_lsm6dsx_ext_dev_settings {
>   */
>  struct st_lsm6dsx_settings {
>  	u8 wai;
> +	u8 reg_int1_addr;
> +	u8 reg_int2_addr;
> +	u8 reg_reset_addr;

could you please rename them in int1_addr, int2_addr and reset_addr in orde=
r to
be inline with other st_lsm6dsx_settings fields?

>  	u16 max_fifo_size;
>  	struct {
>  		enum st_lsm6dsx_hw_id hw_id;
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/i=
mu/st_lsm6dsx/st_lsm6dsx_core.c
> index a6702a74570e..7a4fe70a8f20 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -49,17 +49,12 @@
> =20
>  #include "st_lsm6dsx.h"
> =20
> -#define ST_LSM6DSX_REG_INT1_ADDR		0x0d
> -#define ST_LSM6DSX_REG_INT2_ADDR		0x0e
>  #define ST_LSM6DSX_REG_FIFO_FTH_IRQ_MASK	BIT(3)
>  #define ST_LSM6DSX_REG_WHOAMI_ADDR		0x0f
> -#define ST_LSM6DSX_REG_RESET_ADDR		0x12
>  #define ST_LSM6DSX_REG_RESET_MASK		BIT(0)
>  #define ST_LSM6DSX_REG_BOOT_MASK		BIT(7)
>  #define ST_LSM6DSX_REG_BDU_ADDR			0x12
>  #define ST_LSM6DSX_REG_BDU_MASK			BIT(6)
> -#define ST_LSM6DSX_REG_INT2_ON_INT1_ADDR	0x13
> -#define ST_LSM6DSX_REG_INT2_ON_INT1_MASK	BIT(5)
> =20
>  #define ST_LSM6DSX_REG_ACC_OUT_X_L_ADDR		0x28
>  #define ST_LSM6DSX_REG_ACC_OUT_Y_L_ADDR		0x2a
> @@ -122,6 +117,9 @@ static const struct st_lsm6dsx_fs_table_entry st_lsm6=
dsx_fs_table[] =3D {
>  static const struct st_lsm6dsx_settings st_lsm6dsx_sensor_settings[] =3D=
 {
>  	{
>  		.wai =3D 0x69,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 1365,
>  		.id =3D {
>  			{
> @@ -172,6 +170,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_se=
nsor_settings[] =3D {
>  	},
>  	{
>  		.wai =3D 0x69,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 682,
>  		.id =3D {
>  			{
> @@ -222,6 +223,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_se=
nsor_settings[] =3D {
>  	},
>  	{
>  		.wai =3D 0x6a,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 682,
>  		.id =3D {
>  			{
> @@ -278,6 +282,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_se=
nsor_settings[] =3D {
>  	},
>  	{
>  		.wai =3D 0x6c,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 512,
>  		.id =3D {
>  			{
> @@ -349,6 +356,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_se=
nsor_settings[] =3D {
>  	},
>  	{
>  		.wai =3D 0x6b,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 512,
>  		.id =3D {
>  			{
> @@ -391,6 +401,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_se=
nsor_settings[] =3D {
>  	},
>  	{
>  		.wai =3D 0x6b,
> +		.reg_int1_addr =3D 0x0d,
> +		.reg_int2_addr =3D 0x0e,
> +		.reg_reset_addr =3D 0x12,
>  		.max_fifo_size =3D 512,
>  		.id =3D {
>  			{
> @@ -873,10 +886,10 @@ static int st_lsm6dsx_get_drdy_reg(struct st_lsm6ds=
x_hw *hw, u8 *drdy_reg)
> =20
>  	switch (drdy_pin) {
>  	case 1:
> -		*drdy_reg =3D ST_LSM6DSX_REG_INT1_ADDR;
> +		*drdy_reg =3D hw->settings->reg_int1_addr;
>  		break;
>  	case 2:
> -		*drdy_reg =3D ST_LSM6DSX_REG_INT2_ADDR;
> +		*drdy_reg =3D hw->settings->reg_int2_addr;
>  		break;
>  	default:
>  		dev_err(hw->dev, "unsupported data ready pin\n");
> @@ -976,7 +989,7 @@ static int st_lsm6dsx_init_device(struct st_lsm6dsx_h=
w *hw)
>  	int err;
> =20
>  	/* device sw reset */
> -	err =3D regmap_update_bits(hw->regmap, ST_LSM6DSX_REG_RESET_ADDR,
> +	err =3D regmap_update_bits(hw->regmap, hw->settings->reg_reset_addr,
>  				 ST_LSM6DSX_REG_RESET_MASK,
>  				 FIELD_PREP(ST_LSM6DSX_REG_RESET_MASK, 1));
>  	if (err < 0)
> @@ -985,7 +998,7 @@ static int st_lsm6dsx_init_device(struct st_lsm6dsx_h=
w *hw)
>  	msleep(50);
> =20
>  	/* reload trimming parameter */
> -	err =3D regmap_update_bits(hw->regmap, ST_LSM6DSX_REG_RESET_ADDR,
> +	err =3D regmap_update_bits(hw->regmap, hw->settings->reg_reset_addr,
>  				 ST_LSM6DSX_REG_BOOT_MASK,
>  				 FIELD_PREP(ST_LSM6DSX_REG_BOOT_MASK, 1));
>  	if (err < 0)
> --=20
> 2.20.1
>=20

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXSzrxgAKCRA6cBh0uS2t
rNs4AP9UHVjNZwyG6Wu4qCyOA8fMZ+EywxHf/SJRkN7D+ugvIAEAyNJYf5rK+G8B
Do3CM/eJdpiEJXrrLGRCtOXJINrhbAE=
=CqjW
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
