From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] iio: mma8452: add support for FXLS8471Q
Date: Sat, 12 Mar 2016 10:51:15 +0000
Message-ID: <56E3F4A3.7030708@kernel.org>
References: <1457514014-19032-1-git-send-email-martink@posteo.de>
 <1457521289-32717-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457521289-32717-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, teodora.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, tiberiu.a.breana-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/03/16 11:01, Martin Kepplinger wrote:
> This adds support for Freescale's (now NXP's) FXLS8471Q accelerometer.
> 
> We use MMA8451Q's configuration because for what the driver supports,
> FXLS8471Q is the same.
> 
> Support for FXLS8471Q's features (fast SPI interface and a larger FIFO,
> among others) can be added to this driver anytime.
> 
> See it's datasheet for the details:
> http://cache.nxp.com/files/sensors/doc/data_sheet/FXLS8471Q.pdf
> 
> Signed-off-by: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Applied to the togreg branch of iio.git.  Initially pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
> revision history:
> v2:
> 	forgot to add i2c_device_id to table, for consistency
> 
> 
>  .../devicetree/bindings/iio/accel/mma8452.txt      |  3 ++-
>  drivers/iio/accel/Kconfig                          |  3 ++-
>  drivers/iio/accel/mma8452.c                        | 22 ++++++++++++++++++++++
>  3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> index 165937e..45f5c5c 100644
> --- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> +++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> @@ -1,4 +1,4 @@
> -Freescale MMA8451Q, MMA8452Q, MMA8453Q, MMA8652FC or MMA8653FC
> +Freescale MMA8451Q, MMA8452Q, MMA8453Q, MMA8652FC, MMA8653FC or FXLS8471Q
>  triaxial accelerometer
>  
>  Required properties:
> @@ -9,6 +9,7 @@ Required properties:
>      * "fsl,mma8453"
>      * "fsl,mma8652"
>      * "fsl,mma8653"
> +    * "fsl,fxls8471"
>  
>    - reg: the I2C address of the chip
>  
> diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
> index b0d3ecf..c0f56f4 100644
> --- a/drivers/iio/accel/Kconfig
> +++ b/drivers/iio/accel/Kconfig
> @@ -143,7 +143,8 @@ config MMA8452
>  	select IIO_TRIGGERED_BUFFER
>  	help
>  	  Say yes here to build support for the following Freescale 3-axis
> -	  accelerometers: MMA8451Q, MMA8452Q, MMA8453Q, MMA8652FC, MMA8653FC.
> +	  accelerometers: MMA8451Q, MMA8452Q, MMA8453Q, MMA8652FC, MMA8653FC,
> +	  FXLS8471Q.
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called mma8452.
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 5ca0d16..305ed0e 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -6,6 +6,7 @@
>   * MMA8453Q (10 bit)
>   * MMA8652FC (12 bit)
>   * MMA8653FC (10 bit)
> + * FXLS8471Q (14 bit)
>   *
>   * Copyright 2015 Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
>   * Copyright 2014 Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> @@ -92,6 +93,7 @@
>  #define MMA8453_DEVICE_ID			0x3a
>  #define MMA8652_DEVICE_ID			0x4a
>  #define MMA8653_DEVICE_ID			0x5a
> +#define FXLS8471_DEVICE_ID			0x6a
>  
>  #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
>  
> @@ -1055,6 +1057,7 @@ enum {
>  	mma8453,
>  	mma8652,
>  	mma8653,
> +	fxls8471,
>  };
>  
>  static const struct mma_chip_info mma_chip_info_table[] = {
> @@ -1146,6 +1149,22 @@ static const struct mma_chip_info mma_chip_info_table[] = {
>  		.ev_ths_mask = MMA8452_FF_MT_THS_MASK,
>  		.ev_count = MMA8452_FF_MT_COUNT,
>  	},
> +	[fxls8471] = {
> +		.chip_id = FXLS8471_DEVICE_ID,
> +		.channels = mma8451_channels,
> +		.num_channels = ARRAY_SIZE(mma8451_channels),
> +		.mma_scales = { {0, 2394}, {0, 4788}, {0, 9577} },
> +		.ev_cfg = MMA8452_TRANSIENT_CFG,
> +		.ev_cfg_ele = MMA8452_TRANSIENT_CFG_ELE,
> +		.ev_cfg_chan_shift = 1,
> +		.ev_src = MMA8452_TRANSIENT_SRC,
> +		.ev_src_xe = MMA8452_TRANSIENT_SRC_XTRANSE,
> +		.ev_src_ye = MMA8452_TRANSIENT_SRC_YTRANSE,
> +		.ev_src_ze = MMA8452_TRANSIENT_SRC_ZTRANSE,
> +		.ev_ths = MMA8452_TRANSIENT_THS,
> +		.ev_ths_mask = MMA8452_TRANSIENT_THS_MASK,
> +		.ev_count = MMA8452_TRANSIENT_COUNT,
> +	},
>  };
>  
>  static struct attribute *mma8452_attributes[] = {
> @@ -1275,6 +1294,7 @@ static const struct of_device_id mma8452_dt_ids[] = {
>  	{ .compatible = "fsl,mma8453", .data = &mma_chip_info_table[mma8453] },
>  	{ .compatible = "fsl,mma8652", .data = &mma_chip_info_table[mma8652] },
>  	{ .compatible = "fsl,mma8653", .data = &mma_chip_info_table[mma8653] },
> +	{ .compatible = "fsl,fxls8471", .data = &mma_chip_info_table[fxls8471] },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mma8452_dt_ids);
> @@ -1312,6 +1332,7 @@ static int mma8452_probe(struct i2c_client *client,
>  	case MMA8453_DEVICE_ID:
>  	case MMA8652_DEVICE_ID:
>  	case MMA8653_DEVICE_ID:
> +	case FXLS8471_DEVICE_ID:
>  		if (ret == data->chip_info->chip_id)
>  			break;
>  	default:
> @@ -1518,6 +1539,7 @@ static const struct i2c_device_id mma8452_id[] = {
>  	{ "mma8453", mma8453 },
>  	{ "mma8652", mma8652 },
>  	{ "mma8653", mma8653 },
> +	{ "fxls8471", fxls8471 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mma8452_id);
> 
