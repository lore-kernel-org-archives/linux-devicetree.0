From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 01/10] iio: Allow to read mount matrix from ACPI
Date: Sun, 3 Mar 2019 14:59:31 +0000
Message-ID: <20190303145931.31b7ad65@archlinux>
References: <cover.1550768574.git.hns@goldelico.com>
        <9a71e39afb40900d79b833cb413d9d018e1d7d4b.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a71e39afb40900d79b833cb413d9d018e1d7d4b.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Feb 2019 18:02:46 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Currently mount matrix is allowed in Device Tree, though there is
> no technical issue to extend it to support ACPI.
> 
> Convert the function to use device_property_read_string_array() and
> thus allow to read mount matrix from ACPI if available.
> 
> Example of use in _DSD method:
> 
>   Name (_DSD, Package ()
>   {
>      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>      Package ()
>      {
>         Package () { "mount-matrix", Package() {
>                 "1", "0",     "0",
>                 "0", "0.866", "0.5",
>                 "0", "-0.5",  "0.866",
>         } },
>      }
>   })
> 
> At the same time drop the "of" prefix from its name and
> convert current users.
> 
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
I'm not so very fussed about this one as Andy had posted it to the
list previously, but in theory you should have added your signed-off-by
as an intermediate person who handled the patch.

Otherwise, great and applied to the togreg branch of iio.git and
pushed out as testing for the autobuilders to see if we got anything
wrong.

Thanks,

Jonathan

> ---
>  drivers/iio/accel/kxsd9.c                  |  4 +-
>  drivers/iio/gyro/mpu3050-core.c            |  3 +-
>  drivers/iio/imu/inv_mpu6050/inv_mpu_core.c |  4 +-
>  drivers/iio/industrialio-core.c            | 46 +++++++++-------------
>  drivers/iio/magnetometer/ak8974.c          |  5 +--
>  drivers/iio/magnetometer/ak8975.c          |  5 +--
>  include/linux/iio/iio.h                    |  4 +-
>  7 files changed, 28 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/iio/accel/kxsd9.c b/drivers/iio/accel/kxsd9.c
> index 0c0df4fce420..70c60db62247 100644
> --- a/drivers/iio/accel/kxsd9.c
> +++ b/drivers/iio/accel/kxsd9.c
> @@ -420,9 +420,7 @@ int kxsd9_common_probe(struct device *dev,
>  	indio_dev->available_scan_masks = kxsd9_scan_masks;
>  
>  	/* Read the mounting matrix, if present */
> -	ret = of_iio_read_mount_matrix(dev,
> -				       "mount-matrix",
> -				       &st->orientation);
> +	ret = iio_read_mount_matrix(dev, "mount-matrix", &st->orientation);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
> index 77fac81a3adc..8200e48f561b 100644
> --- a/drivers/iio/gyro/mpu3050-core.c
> +++ b/drivers/iio/gyro/mpu3050-core.c
> @@ -1149,8 +1149,7 @@ int mpu3050_common_probe(struct device *dev,
>  	mpu3050->divisor = 99;
>  
>  	/* Read the mounting matrix, if present */
> -	ret = of_iio_read_mount_matrix(dev, "mount-matrix",
> -				       &mpu3050->orientation);
> +	ret = iio_read_mount_matrix(dev, "mount-matrix", &mpu3050->orientation);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> index 1e428c196a82..533d1f8321ac 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
> @@ -990,8 +990,8 @@ int inv_mpu_core_probe(struct regmap *regmap, int irq, const char *name,
>  
>  	pdata = dev_get_platdata(dev);
>  	if (!pdata) {
> -		result = of_iio_read_mount_matrix(dev, "mount-matrix",
> -						  &st->orientation);
> +		result = iio_read_mount_matrix(dev, "mount-matrix",
> +					       &st->orientation);
>  		if (result) {
>  			dev_err(dev, "Failed to retrieve mounting matrix %d\n",
>  				result);
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 4f5cd9f60870..0a40f1df49c7 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -19,6 +19,7 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/poll.h>
> +#include <linux/property.h>
>  #include <linux/sched.h>
>  #include <linux/wait.h>
>  #include <linux/cdev.h>
> @@ -525,8 +526,8 @@ ssize_t iio_show_mount_matrix(struct iio_dev *indio_dev, uintptr_t priv,
>  EXPORT_SYMBOL_GPL(iio_show_mount_matrix);
>  
>  /**
> - * of_iio_read_mount_matrix() - retrieve iio device mounting matrix from
> - *                              device-tree "mount-matrix" property
> + * iio_read_mount_matrix() - retrieve iio device mounting matrix from
> + *                           device "mount-matrix" property
>   * @dev:	device the mounting matrix property is assigned to
>   * @propname:	device specific mounting matrix property name
>   * @matrix:	where to store retrieved matrix
> @@ -536,40 +537,29 @@ EXPORT_SYMBOL_GPL(iio_show_mount_matrix);
>   *
>   * Return: 0 if success, or a negative error code on failure.
>   */
> -#ifdef CONFIG_OF
> -int of_iio_read_mount_matrix(const struct device *dev,
> -			     const char *propname,
> -			     struct iio_mount_matrix *matrix)
> +int iio_read_mount_matrix(struct device *dev, const char *propname,
> +			  struct iio_mount_matrix *matrix)
>  {
> -	if (dev->of_node) {
> -		int err = of_property_read_string_array(dev->of_node,
> -				propname, matrix->rotation,
> -				ARRAY_SIZE(iio_mount_idmatrix.rotation));
> +	size_t len = ARRAY_SIZE(iio_mount_idmatrix.rotation);
> +	int err;
>  
> -		if (err == ARRAY_SIZE(iio_mount_idmatrix.rotation))
> -			return 0;
> +	err = device_property_read_string_array(dev, propname,
> +						matrix->rotation, len);
> +	if (err == len)
> +		return 0;
>  
> -		if (err >= 0)
> -			/* Invalid number of matrix entries. */
> -			return -EINVAL;
> +	if (err >= 0)
> +		/* Invalid number of matrix entries. */
> +		return -EINVAL;
>  
> -		if (err != -EINVAL)
> -			/* Invalid matrix declaration format. */
> -			return err;
> -	}
> +	if (err != -EINVAL)
> +		/* Invalid matrix declaration format. */
> +		return err;
>  
>  	/* Matrix was not declared at all: fallback to identity. */
>  	return iio_setup_mount_idmatrix(dev, matrix);
>  }
> -#else
> -int of_iio_read_mount_matrix(const struct device *dev,
> -			     const char *propname,
> -			     struct iio_mount_matrix *matrix)
> -{
> -	return iio_setup_mount_idmatrix(dev, matrix);
> -}
> -#endif
> -EXPORT_SYMBOL(of_iio_read_mount_matrix);
> +EXPORT_SYMBOL(iio_read_mount_matrix);
>  
>  static ssize_t __iio_format_value(char *buf, size_t len, unsigned int type,
>  				  int size, const int *vals)
> diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
> index 93be1f4c0f27..f4d0a6c0fde7 100644
> --- a/drivers/iio/magnetometer/ak8974.c
> +++ b/drivers/iio/magnetometer/ak8974.c
> @@ -733,9 +733,8 @@ static int ak8974_probe(struct i2c_client *i2c,
>  	ak8974->i2c = i2c;
>  	mutex_init(&ak8974->lock);
>  
> -	ret = of_iio_read_mount_matrix(&i2c->dev,
> -				       "mount-matrix",
> -				       &ak8974->orientation);
> +	ret = iio_read_mount_matrix(&i2c->dev, "mount-matrix",
> +				    &ak8974->orientation);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
> index d430b80808ef..db7214ac514c 100644
> --- a/drivers/iio/magnetometer/ak8975.c
> +++ b/drivers/iio/magnetometer/ak8975.c
> @@ -911,9 +911,8 @@ static int ak8975_probe(struct i2c_client *client,
>  	data->eoc_irq = 0;
>  
>  	if (!pdata) {
> -		err = of_iio_read_mount_matrix(&client->dev,
> -					       "mount-matrix",
> -					       &data->orientation);
> +		err = iio_read_mount_matrix(&client->dev, "mount-matrix",
> +					    &data->orientation);
>  		if (err)
>  			return err;
>  	} else
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index a74cb177dc6f..bb10c1bee301 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -130,8 +130,8 @@ struct iio_mount_matrix {
>  
>  ssize_t iio_show_mount_matrix(struct iio_dev *indio_dev, uintptr_t priv,
>  			      const struct iio_chan_spec *chan, char *buf);
> -int of_iio_read_mount_matrix(const struct device *dev, const char *propname,
> -			     struct iio_mount_matrix *matrix);
> +int iio_read_mount_matrix(struct device *dev, const char *propname,
> +			  struct iio_mount_matrix *matrix);
>  
>  typedef const struct iio_mount_matrix *
>  	(iio_get_mount_matrix_t)(const struct iio_dev *indio_dev,
