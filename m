Return-Path: <SRS0=e9d6=SJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfDGKab (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 7 Apr 2019 06:30:31 -0400
Date: Sun, 7 Apr 2019 11:30:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: imu: st_lsm6dsx: add support to LSM6DSR
Message-ID: <20190407113025.503eb17e@archlinux>
In-Reply-To: <2a21506435aae3cd733a585432bdf4acbcd779cd.1554393394.git.lorenzo@kernel.org>
References: <cover.1554393393.git.lorenzo@kernel.org>
        <2a21506435aae3cd733a585432bdf4acbcd779cd.1554393394.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

On Thu,  4 Apr 2019 18:02:34 +0200
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> Add support to STM LSM6DSR 6-axis (acc + gyro) Mems sensor
> https://www.st.com/resource/en/datasheet/lsm6dsr.pdf
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/imu/st_lsm6dsx/Kconfig            |  2 +-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  2 +
>  .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    |  8 +--
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 67 ++++++++++++++++++-
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |  5 ++
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |  5 ++
>  6 files changed, 83 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> index 8dcf5137b8da..9e592973a8a6 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -9,7 +9,7 @@ config IIO_ST_LSM6DSX
>  	help
>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> -	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh
> +	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh, lsm6dsr
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called st_lsm6dsx.
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> index 0a0c56c1701d..004a8a1a0027 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
> @@ -22,6 +22,7 @@
>  #define ST_LSM6DSO_DEV_NAME	"lsm6dso"
>  #define ST_ASM330LHH_DEV_NAME	"asm330lhh"
>  #define ST_LSM6DSOX_DEV_NAME	"lsm6dsox"
> +#define ST_LSM6DSR_DEV_NAME	"lsm6dsr"
>  
>  enum st_lsm6dsx_hw_id {
>  	ST_LSM6DS3_ID,
> @@ -32,6 +33,7 @@ enum st_lsm6dsx_hw_id {
>  	ST_LSM6DSO_ID,
>  	ST_ASM330LHH_ID,
>  	ST_LSM6DSOX_ID,
> +	ST_LSM6DSR_ID,
>  	ST_LSM6DSX_MAX_ID,
>  };
>  
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> index 2da8c5ff699a..ef1728528e2f 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> @@ -13,9 +13,9 @@
>   * (e.g. Gx, Gy, Gz, Ax, Ay, Az), then data are repeated depending on the
>   * value of the decimation factor and ODR set for each FIFO data set.
>   *
> - * LSM6DSO/LSM6DSOX/ASM330LHH: The FIFO buffer can be configured to store data
> - * from gyroscope and accelerometer. Each sample is queued with a tag (1B)
> - * indicating data source (gyroscope, accelerometer, hw timer).
> + * LSM6DSO/LSM6DSOX/ASM330LHH/LSM6DSR: The FIFO buffer can be configured to
> + * store data from gyroscope and accelerometer. Each sample is queued with
> + * a tag (1B) indicating data source (gyroscope, accelerometer, hw timer).
>   *
>   * FIFO supported modes:
>   *  - BYPASS: FIFO disabled
> @@ -506,7 +506,7 @@ st_lsm6dsx_push_tagged_data(struct st_lsm6dsx_hw *hw, u8 tag,
>  }
>  
>  /**
> - * st_lsm6dsx_read_tagged_fifo() - LSM6DSO/LSM6DSOX/ASM330LHH read FIFO routine
> + * st_lsm6dsx_read_tagged_fifo() - tagged hw FIFO read routine
>   * @hw: Pointer to instance of struct st_lsm6dsx_hw.
>   *
>   * Read samples from the hw FIFO and push them to IIO buffers.
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index c167ae2c21ab..04124cc277dd 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -23,7 +23,7 @@
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
>   *   - FIFO size: 4KB
>   *
> - * - LSM6DSO/LSM6DSOX/ASM330LHH
> + * - LSM6DSO/LSM6DSOX/ASM330LHH/LSM6DSR
>   *   - Accelerometer/Gyroscope supported ODR [Hz]: 13, 26, 52, 104, 208, 416
>   *   - Accelerometer supported full-scale [g]: +-2/+-4/+-8/+-16
>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
> @@ -387,6 +387,71 @@ static const struct st_lsm6dsx_settings st_lsm6dsx_sensor_settings[] = {
>  			},
>  		},
>  	},
> +	{
> +		.wai = 0x6b,
> +		.max_fifo_size = 512,
> +		.id = {
> +			[0] = ST_LSM6DSR_ID,
> +		},
> +		.batch = {
> +			[ST_LSM6DSX_ID_ACC] = {
> +				.addr = 0x09,
> +				.mask = GENMASK(3, 0),
> +			},
> +			[ST_LSM6DSX_ID_GYRO] = {
> +				.addr = 0x09,
> +				.mask = GENMASK(7, 4),
> +			},
> +		},
> +		.fifo_ops = {
> +			.read_fifo = st_lsm6dsx_read_tagged_fifo,
> +			.fifo_th = {
> +				.addr = 0x07,
> +				.mask = GENMASK(8, 0),
> +			},
> +			.fifo_diff = {
> +				.addr = 0x3a,
> +				.mask = GENMASK(8, 0),
> +			},
> +			.th_wl = 1,
> +		},
> +		.ts_settings = {
> +			.timer_en = {
> +				.addr = 0x19,
> +				.mask = BIT(5),
> +			},
> +			.decimator = {
> +				.addr = 0x0a,
> +				.mask = GENMASK(7, 6),
> +			},
> +		},
> +		.shub_settings = {
> +			.page_mux = {
> +				.addr = 0x01,
> +				.mask = BIT(6),
> +			},
> +			.master_en = {
> +				.addr = 0x14,
> +				.mask = BIT(2),
> +			},
> +			.pullup_en = {
> +				.addr = 0x14,
> +				.mask = BIT(3),
> +			},
> +			.aux_sens = {
> +				.addr = 0x14,
> +				.mask = GENMASK(1, 0),
> +			},
> +			.wr_once = {
> +				.addr = 0x14,
> +				.mask = BIT(6),
> +			},
> +			.shub_out = 0x02,
> +			.slv0_addr = 0x15,
> +			.dw_slv0_addr = 0x21,
> +			.batch_en = BIT(3),
> +		}
> +	},
>  };
>  
>  static const struct iio_chan_spec st_lsm6dsx_acc_channels[] = {
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> index 0bfc66d2d772..f54370196098 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
> @@ -73,6 +73,10 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
>  		.compatible = "st,lsm6dsox",
>  		.data = (void *)ST_LSM6DSOX_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6dsr",
> +		.data = (void *)ST_LSM6DSR_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
> @@ -86,6 +90,7 @@ static const struct i2c_device_id st_lsm6dsx_i2c_id_table[] = {
>  	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
>  	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
> +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, st_lsm6dsx_i2c_id_table);
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> index 9f46d4ce9fc1..4a4abb2935da 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
> @@ -73,6 +73,10 @@ static const struct of_device_id st_lsm6dsx_spi_of_match[] = {
>  		.compatible = "st,lsm6dsox",
>  		.data = (void *)ST_LSM6DSOX_ID,
>  	},
> +	{
> +		.compatible = "st,lsm6dsr",
> +		.data = (void *)ST_LSM6DSR_ID,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_spi_of_match);
> @@ -86,6 +90,7 @@ static const struct spi_device_id st_lsm6dsx_spi_id_table[] = {
>  	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
>  	{ ST_ASM330LHH_DEV_NAME, ST_ASM330LHH_ID },
>  	{ ST_LSM6DSOX_DEV_NAME, ST_LSM6DSOX_ID },
> +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, st_lsm6dsx_spi_id_table);
