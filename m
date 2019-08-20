Return-Path: <SRS0=tv79=WQ=puri.sm=martin.kepplinger@kernel.org>
Subject: Re: [PATCH v4 2/3] iio: imu: st_lsm6dsx: add support for accel/gyro
 unit of lsm9sd1
References: <20190813073533.8007-1-martin.kepplinger@puri.sm>
 <20190813073533.8007-3-martin.kepplinger@puri.sm>
 <20190819094845.GB17835@localhost.localdomain>
From: Martin Kepplinger <martin.kepplinger@puri.sm>
Message-ID: <6c739681-d46e-b4f7-9831-bdf1e9bcd540@puri.sm>
Date: Tue, 20 Aug 2019 17:06:32 +0200
In-Reply-To: <20190819094845.GB17835@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 19.08.19 11:48, Lorenzo Bianconi wrote:
>> The LSM9DS1's accelerometer / gyroscope unit and it's magnetometer (separately
>> supported in iio/magnetometer/st_magn*) are located on a separate i2c addresses
>> on the bus.
>>
>> For the datasheet, see https://www.st.com/resource/en/datasheet/lsm9ds1.pdf
>>
>> Treat it just like the LSM6* devices and, despite it's name, hook it up
>> to the st_lsm6dsx driver, using it's basic functionality.
>>
>> accelerometer and gyroscope are not independently clocked. It runs at the gyro
>> frequencies if both are enabled, see chapter 7.12 of the datasheet.
>> We could have handled this as a single IIO device but we have split
>> it up to be more consistent with the other more flexible devices.
>>
>> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> 
> Hi Martin,
> 
> most of comments are nitpicks (inline), the only issue I can see here is we can enable
> hw fifo for lsm6ds0/lsm9ds1 and read_fifo routine pointer is not currently
> initialized so we will end up with a NULL pointer dereference. Since we will
> need a different update FIFO routine for lsm6ds0/lsm9ds1 I am adding an
> update_fifo function pointer in fifo_ops in order to fix this issue.
> 
> Regards,
> Lorenzo
> 
>> ---
>>  drivers/iio/imu/st_lsm6dsx/Kconfig           |  2 +-
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  2 +
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 87 ++++++++++++++++++++
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c  |  5 ++
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c  |  5 ++
>>  5 files changed, 100 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
>> index 939058b27746..77aa0e77212d 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
>> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
>> @@ -12,7 +12,7 @@ config IIO_ST_LSM6DSX
>>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
>>  	  ism330dlc, lsm6dso, lsm6dsox, asm330lhh, lsm6dsr, lsm6ds3tr-c,
>> -	  ism330dhcx
>> +	  ism330dhcx and the accelerometer/gyroscope of lsm9ds1.
>>  
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called st_lsm6dsx.
>> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> index c8f333902eb7..d03b5a2d8549 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> @@ -24,6 +24,7 @@
>>  #define ST_LSM6DSR_DEV_NAME	"lsm6dsr"
>>  #define ST_LSM6DS3TRC_DEV_NAME	"lsm6ds3tr-c"
>>  #define ST_ISM330DHCX_DEV_NAME	"ism330dhcx"
>> +#define ST_LSM9DS1_DEV_NAME	"lsm9ds1"
> 
> should be called 'lsm9ds1_imu' since lsm9ds1 is a 9-axis device? what do you
> think?
> 
>>  
>>  enum st_lsm6dsx_hw_id {
>>  	ST_LSM6DS3_ID,
>> @@ -37,6 +38,7 @@ enum st_lsm6dsx_hw_id {
>>  	ST_LSM6DSR_ID,
>>  	ST_LSM6DS3TRC_ID,
>>  	ST_ISM330DHCX_ID,
>> +	ST_LSM9DS1_ID,
> 
> same here..ST_LSM9DS1_IMU_ID

I wouldn't add "imu" to the actual part name, see below...

> 
>>  	ST_LSM6DSX_MAX_ID,
>>  };
>>  
>> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
>> index 56e1c5262a2c..f038bb06f635 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
>> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
>> @@ -10,6 +10,8 @@
>>   * +-125/+-245/+-500/+-1000/+-2000 dps
>>   * LSM6DSx series has an integrated First-In-First-Out (FIFO) buffer
>>   * allowing dynamic batching of sensor data.
>> + * LSM9DSx series is similar but includes an additional magnetometer, handled
>> + * by a different driver.
>>   *
>>   * Supported sensors:
>>   * - LSM6DS3:
>> @@ -30,6 +32,13 @@
>>   *   - Gyroscope supported full-scale [dps]: +-125/+-245/+-500/+-1000/+-2000
>>   *   - FIFO size: 3KB
>>   *
>> + * - LSM9DS1:
>> + *   - Accelerometer supported ODR [Hz]: 10, 50, 119, 238, 476, 952
>> + *   - Accelerometer supported full-scale [g]: +-2/+-4/+-8/+-16
>> + *   - Gyroscope supported ODR [Hz]: 15, 60, 119, 238, 476, 952
>> + *   - Gyroscope supported full-scale [dps]: +-245/+-500/+-2000
>> + *   - FIFO size: 32
>> + *
>>   * Copyright 2016 STMicroelectronics Inc.
>>   *
>>   * Lorenzo Bianconi <lorenzo.bianconi@st.com>
>> @@ -70,7 +79,85 @@ static const struct iio_chan_spec st_lsm6dsx_gyro_channels[] = {
>>  	IIO_CHAN_SOFT_TIMESTAMP(3),
>>  };
>>  
>> +static const struct iio_chan_spec st_lsm9dsx_gyro_channels[] = {
>> +	ST_LSM6DSX_CHANNEL(IIO_ANGL_VEL, 0x18, IIO_MOD_X, 0),
>> +	ST_LSM6DSX_CHANNEL(IIO_ANGL_VEL, 0x1a, IIO_MOD_Y, 1),
>> +	ST_LSM6DSX_CHANNEL(IIO_ANGL_VEL, 0x1c, IIO_MOD_Z, 2),
>> +	IIO_CHAN_SOFT_TIMESTAMP(3),
>> +};
>> +
> 
> why not st_lsm6ds0_gyro_channels?

Would be ok with me. I'll remember this if I do a new iteration.

> 
>>  static const struct st_lsm6dsx_settings st_lsm6dsx_sensor_settings[] = {
>> +	{
>> +		.wai = 0x68,
>> +		.int1_addr = 0x0c,
>> +		.int2_addr = 0x0d,
>> +		.reset_addr = 0x22,
>> +		.max_fifo_size = 32,
>> +		.id = {
>> +			{
>> +				.hw_id = ST_LSM9DS1_ID,
>> +				.name = ST_LSM9DS1_DEV_NAME,
>> +			},
>> +		},
>> +		.channels = {
>> +			[ST_LSM6DSX_ID_ACC] = {
>> +				.chan = st_lsm6dsx_acc_channels,
>> +				.len = ARRAY_SIZE(st_lsm6dsx_acc_channels),
>> +			},
>> +			[ST_LSM6DSX_ID_GYRO] = {
>> +				.chan = st_lsm9dsx_gyro_channels,
>> +				.len = ARRAY_SIZE(st_lsm9dsx_gyro_channels),
>> +			},
>> +		},
>> +		.odr_table = {
>> +			[ST_LSM6DSX_ID_ACC] = {
>> +				.reg = {
>> +					.addr = 0x20,
>> +					.mask = GENMASK(7, 5),
>> +				},
>> +				.odr_avl[0] = {  10, 0x01 },
>> +				.odr_avl[1] = {  50, 0x02 },
>> +				.odr_avl[2] = { 119, 0x03 },
>> +				.odr_avl[3] = { 238, 0x04 },
>> +				.odr_avl[4] = { 476, 0x05 },
>> +				.odr_avl[5] = { 952, 0x06 },
>> +			},
>> +			[ST_LSM6DSX_ID_GYRO] = {
>> +				.reg = {
>> +					.addr = 0x10,
>> +					.mask = GENMASK(7, 5),
>> +				},
>> +				.odr_avl[0] = {  15, 0x01 },
>> +				.odr_avl[1] = {  60, 0x02 },
>> +				.odr_avl[2] = { 119, 0x03 },
>> +				.odr_avl[3] = { 238, 0x04 },
>> +				.odr_avl[4] = { 476, 0x05 },
>> +				.odr_avl[5] = { 952, 0x06 },
>> +			},
>> +		},
>> +		.fs_table = {
>> +			[ST_LSM6DSX_ID_ACC] = {
>> +				.reg = {
>> +					.addr = 0x20,
>> +					.mask = GENMASK(4, 3),
>> +				},
>> +				.fs_avl[0] = {  599, 0x0 },
>> +				.fs_avl[1] = { 1197, 0x2 },
>> +				.fs_avl[2] = { 2394, 0x3 },
>> +				.fs_avl[3] = { 4788, 0x1 },
>> +			},
>> +			[ST_LSM6DSX_ID_GYRO] = {
>> +				.reg = {
>> +					.addr = 0x10,
>> +					.mask = GENMASK(4, 3),
>> +				},
>> +				.fs_avl[0] = { IIO_DEGREE_TO_RAD(245), 0x0 },
>> +				.fs_avl[1] = { IIO_DEGREE_TO_RAD(500), 0x1 },
>> +				.fs_avl[2] = { IIO_DEGREE_TO_RAD(0), 0x2 },
>> +				.fs_avl[3] = { IIO_DEGREE_TO_RAD(2000), 0x3 },
>> +			},
>> +		},
>> +	},
>>  	{
>>  		.wai = 0x69,
>>  		.int1_addr = 0x0d,
>> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
>> index 15c6aa5b6caa..2f1b30ff083b 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
>> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
>> @@ -83,6 +83,10 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
>>  		.compatible = "st,ism330dhcx",
>>  		.data = (void *)ST_ISM330DHCX_ID,
>>  	},
>> +	{
>> +		.compatible = "st,lsm9ds1",
> 
> same here, what is the right compatible string? "st,lsm9ds1 or
> "st,lsm9ds1_imu"?

well, I'm open for this change, but "imu" doesn't really mean much
technically, so I would stick with the device name. "imu" is not part of
the "part" name...

> 
>> +		.data = (void *)ST_LSM9DS1_ID,
>> +	},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
>> @@ -99,6 +103,7 @@ static const struct i2c_device_id st_lsm6dsx_i2c_id_table[] = {
>>  	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
>>  	{ ST_LSM6DS3TRC_DEV_NAME, ST_LSM6DS3TRC_ID },
>>  	{ ST_ISM330DHCX_DEV_NAME, ST_ISM330DHCX_ID },
>> +	{ ST_LSM9DS1_DEV_NAME, ST_LSM9DS1_ID },
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(i2c, st_lsm6dsx_i2c_id_table);
>> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
>> index a8430ee11310..421ce704f346 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
>> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
>> @@ -83,6 +83,10 @@ static const struct of_device_id st_lsm6dsx_spi_of_match[] = {
>>  		.compatible = "st,ism330dhcx",
>>  		.data = (void *)ST_ISM330DHCX_ID,
>>  	},
>> +	{
>> +		.compatible = "st,lsm9ds1",
>> +		.data = (void *)ST_LSM9DS1_ID,
>> +	},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, st_lsm6dsx_spi_of_match);
>> @@ -99,6 +103,7 @@ static const struct spi_device_id st_lsm6dsx_spi_id_table[] = {
>>  	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
>>  	{ ST_LSM6DS3TRC_DEV_NAME, ST_LSM6DS3TRC_ID },
>>  	{ ST_ISM330DHCX_DEV_NAME, ST_ISM330DHCX_ID },
>> +	{ ST_LSM9DS1_DEV_NAME, ST_LSM9DS1_ID },
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(spi, st_lsm6dsx_spi_id_table);
>> -- 
>> 2.20.1
>>
