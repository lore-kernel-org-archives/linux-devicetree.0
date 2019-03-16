Return-Path: <SRS0=sfcU=RT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfCPQph (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Mar 2019 12:45:37 -0400
Date: Sat, 16 Mar 2019 16:45:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: imu: st_lsm6dsx: add support to LSM6DSOX
Message-ID: <20190316164531.5ee59121@archlinux>
In-Reply-To: <c483e74a9bb420a06f2c1d94f5d9f764a4960bc3.1552643968.git.lorenzo@kernel.org>
References: <cover.1552643968.git.lorenzo@kernel.org>
        <c483e74a9bb420a06f2c1d94f5d9f764a4960bc3.1552643968.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Fri, 15 Mar 2019 11:08:24 +0100
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Add support to STM LSM6DSOX 6-axis (acc + gyro) Mems sensor
> https://www.st.com/resource/en/datasheet/lsm6dsox.pdf
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

thanks,

Jonathan

> ---
>  drivers/iio/imu/st_lsm6dsx/Kconfig             | 2 +-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h        | 2 ++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 4 ++--
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c   | 3 ++-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c    | 5 +++++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c    | 5 +++++
>  6 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> index 36048bf0455a..8dcf5137b8da 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -9,7 +9,7 @@ config IIO_ST_LSM6DSX
>  	help
>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> -	  ism330dlc, lsm6dso, asm330lhh
> +	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called st_lsm6dsx.
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> index de2a0dc39353..0a0c56c1701d 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> @@ -21,6 +21,7 @@
>  #define ST_ISM330DLC_DEV_NAME	"ism330dlc"
>  #define ST_LSM6DSO_DEV_NAME	"lsm6dso"
>  #define ST_ASM330LHH_DEV_NAME	"asm330lhh"
> +#define ST_LSM6DSOX_DEV_NAME	"lsm6dsox"
>  
>  enum st_lsm6dsx_hw_id {
>  	ST_LSM6DS3_ID,
> @@ -30,6 +31,7 @@ enum st_lsm6dsx_hw_id {
>  	ST_ISM330DLC_ID,
>  	ST_LSM6DSO_ID,
>  	ST_ASM330LHH_ID,
> +	ST_LSM6DSOX_ID,
>  	ST_LSM6DSX_MAX_ID,
>  };
>  
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> index 8f443bdb5b51..2da8c5ff699a 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> @@ -13,7 +13,7 @@
>   * (e.g. Gx, Gy, Gz, Ax, Ay, Az), then data are repeated depending on the
>   * value of the decimation factor and ODR set for each FIFO data set.
>   *
> - * LSM6DSO/ASM330LHH: The FIFO buffer can be configured to store data
> + * LSM6DSO/LSM6DSOX/ASM330LHH: The FIFO buffer can be configured to store data
>   * from gyroscope and accelerometer. Each sample is queued with a tag (1B)
>   * indicating data source (gyroscope, accelerometer, hw timer).
>   *
> @@ -506,7 +506,7 @@ st_lsm6dsx_push_tagged_data(struct st_lsm6dsx_hw *hw, u8 tag,
>  }
>  
>  /**
> - * st_lsm6dsx_read_tagged_fifo() - LSM6DSO/ASM330LHH read FIFO routine
> + * st_lsm6dsx_read_tagged_fifo() - LSM6DSO/LSM6DSOX/ASM330LHH read FIFO routine
>   * @hw: Pointer to instance of struct st_lsm6dsx_hw.
>   *
>   * Read samples from the hw FIFO and push them to IIO buffers.
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index 50cab3531b11..c167ae2c21ab 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -23,7 +23,7 @@
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
>   *   - FIFO size: 4KB
>   *
> - * - LSM6DSO/ASM330LHH
> + * - LSM6DSO/LSM6DSOX/ASM330LHH
>   *   - Accelerometer/Gyroscope supported ODR [Hz]: 13, 26, 52, 104, 208, 416
>   *   - Accelerometer supported full-scale [g]: +-2/+-4/+-8/+-16
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
> @@ -287,6 +287,7 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_sensor_settings[] = {
>  		.max_fifo_size = 512,
>  		.id = {
>  			[0] = ST_LSM6DSO_ID,
> +			[1] = ST_LSM6DSOX_ID,
>  		},
>  		.batch = {
>  			[ST_LSM6DSX_ID_ACC] = {
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> index 00b4b702645a..0bfc66d2d772 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> @@ -69,6 +69,10 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
>  		.compatible = "st,asm330lhh",
>  		.data = (void *)ST_ASM330LHH_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6dsox",
> +		.data = (void *)ST_LSM6DSOX_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
> @@ -81,6 +85,7 @@ static const struct i2c_device_id st_lsm6dsx_i2c_id_table[] = {
>  	{ ST_ISM330DLC_DEV_NAME, ST_ISM330DLC_ID },
>  	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
> +	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, st_lsm6dsx_i2c_id_table);
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> index 836256c2ac7d..9f46d4ce9fc1 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> @@ -69,6 +69,10 @@ static const struct of_device_id st_lsm6dsx_spi_of_match[] = {
>  		.compatible = "st,asm330lhh",
>  		.data = (void *)ST_ASM330LHH_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6dsox",
> +		.data = (void *)ST_LSM6DSOX_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_spi_of_match);
> @@ -81,6 +85,7 @@ static const struct spi_device_id st_lsm6dsx_spi_id_table[] = {
>  	{ ST_ISM330DLC_DEV_NAME, ST_ISM330DLC_ID },
>  	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
> +	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, st_lsm6dsx_spi_id_table);
