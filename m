Return-Path: <SRS0=3KNm=VL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728106AbfGNQ20 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 14 Jul 2019 12:28:26 -0400
Date: Sun, 14 Jul 2019 17:27:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: imu: st_lsm6dsx: add support to LSM6DS3TR-C
Message-ID: <20190714172727.5b2a31a0@archlinux>
In-Reply-To: <c0cf032e04524d20f646993e61d5b8696b9d2fa8.1561802767.git.lorenzo@kernel.org>
References: <cover.1561802767.git.lorenzo@kernel.org>
        <c0cf032e04524d20f646993e61d5b8696b9d2fa8.1561802767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Sat, 29 Jun 2019 12:13:53 +0200
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Add support to STM LSM6DS3TR-C 6-axis (acc + gyro) Mems sensor
> https://www.st.com/resource/en/datasheet/lsm6ds3tr-c.pdf
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to poke at it.

Thanks,

Jonathan

> ---
>  drivers/iio/imu/st_lsm6dsx/Kconfig             | 2 +-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h        | 2 ++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 8 ++++----
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c   | 5 ++++-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c    | 5 +++++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c    | 5 +++++
>  6 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> index 9e592973a8a6..b254d03e2043 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -9,7 +9,7 @@ config IIO_ST_LSM6DSX
>  	help
>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> -	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh, lsm6dsr
> +	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh, lsm6dsr, lsm6ds3tr-c
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called st_lsm6dsx.
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> index cd1642bb4ec0..ffa8402763c5 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> @@ -23,6 +23,7 @@
>  #define ST_ASM330LHH_DEV_NAME	"asm330lhh"
>  #define ST_LSM6DSOX_DEV_NAME	"lsm6dsox"
>  #define ST_LSM6DSR_DEV_NAME	"lsm6dsr"
> +#define ST_LSM6DS3TRC_DEV_NAME	"lsm6ds3tr-c"
>  
>  enum st_lsm6dsx_hw_id {
>  	ST_LSM6DS3_ID,
> @@ -34,6 +35,7 @@ enum st_lsm6dsx_hw_id {
>  	ST_ASM330LHH_ID,
>  	ST_LSM6DSOX_ID,
>  	ST_LSM6DSR_ID,
> +	ST_LSM6DS3TRC_ID,
>  	ST_LSM6DSX_MAX_ID,
>  };
>  
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> index 793598ee960a..61b20fa64108 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> @@ -1,10 +1,10 @@
>  /*
>   * STMicroelectronics st_lsm6dsx FIFO buffer library driver
>   *
> - * LSM6DS3/LSM6DS3H/LSM6DSL/LSM6DSM/ISM330DLC: The FIFO buffer can be
> - * configured to store data from gyroscope and accelerometer. Samples are
> - * queued without any tag according to a specific pattern based on
> - * 'FIFO data sets' (6 bytes each):
> + * LSM6DS3/LSM6DS3H/LSM6DSL/LSM6DSM/ISM330DLC/LSM6DS3TR-C:
> + * The FIFO buffer can be configured to store data from gyroscope and
> + * accelerometer. Samples are queued without any tag according to a
> + * specific pattern based on 'FIFO data sets' (6 bytes each):
>   *  - 1st data set is reserved for gyroscope data
>   *  - 2nd data set is reserved for accelerometer data
>   * The FIFO pattern changes depending on the ODRs and decimation factors
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index 04233928d23e..dc479e139cfc 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -17,7 +17,7 @@
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
>   *   - FIFO size: 8KB
>   *
> - * - LSM6DS3H/LSM6DSL/LSM6DSM/ISM330DLC:
> + * - LSM6DS3H/LSM6DSL/LSM6DSM/ISM330DLC/LSM6DS3TR-C:
>   *   - Accelerometer/Gyroscope supported ODR [Hz]: 13, 26, 52, 104, 208, 416
>   *   - Accelerometer supported full-scale [g]: +-2/+-4/+-8/+-16
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
> @@ -234,6 +234,9 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_sensor_settings[] = {
>  			}, {
>  				.hw_id = ST_ISM330DLC_ID,
>  				.name = ST_ISM330DLC_DEV_NAME,
> +			}, {
> +				.hw_id = ST_LSM6DS3TRC_ID,
> +				.name = ST_LSM6DS3TRC_DEV_NAME,
>  			},
>  		},
>  		.decimator = {
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> index 47581a4e456e..0542f64fb673 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> @@ -76,6 +76,10 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
>  		.compatible = "st,lsm6dsr",
>  		.data = (void *)ST_LSM6DSR_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6ds3tr-c",
> +		.data = (void *)ST_LSM6DS3TRC_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
> @@ -90,6 +94,7 @@ static const struct i2c_device_id st_lsm6dsx_i2c_id_table[] = {
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
>  	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
>  	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> +	{ ST_LSM6DS3TRC_DEV_NAME, ST_LSM6DS3TRC_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, st_lsm6dsx_i2c_id_table);
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> index facf66978a4b..4e160dcb0d7d 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> @@ -76,6 +76,10 @@ static const struct of_device_id st_lsm6dsx_spi_of_match[] = {
>  		.compatible = "st,lsm6dsr",
>  		.data = (void *)ST_LSM6DSR_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6ds3tr-c",
> +		.data = (void *)ST_LSM6DS3TRC_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_spi_of_match);
> @@ -90,6 +94,7 @@ static const struct spi_device_id st_lsm6dsx_spi_id_table[] = {
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
>  	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
>  	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> +	{ ST_LSM6DS3TRC_DEV_NAME, ST_LSM6DS3TRC_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, st_lsm6dsx_spi_id_table);
