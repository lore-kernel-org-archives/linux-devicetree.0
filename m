From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 04/10] staging: iio: tsl2583: remove redundant power_state
 sysfs attribute
Date: Sun, 30 Oct 2016 17:51:53 +0000
Message-ID: <a689e20d-1f76-cd1d-d3f3-aea3a41dfe0c@kernel.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
 <1477648821-3786-5-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477648821-3786-5-git-send-email-masneyb@onstation.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Brian Masney <masneyb@onstation.org>, linux-iio@vger.kernel.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, Mark.Rutland@arm.com
List-Id: devicetree@vger.kernel.org

On 28/10/16 11:00, Brian Masney wrote:
> IIO devices have a /sys/bus/iio/devices/iio:deviceX/power/ directory
> that allows viewing and controling various power parameters. The tsl2583
> driver also has an additional custom sysfs attribute named power_state
> that is not needed. This patch removes the redundant power_state sysfs
> attribute.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
Applied. etc.
> ---
>  drivers/staging/iio/light/tsl2583.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/tsl2583.c b/drivers/staging/iio/light/tsl2583.c
> index 47fd373..f8ccb4d 100644
> --- a/drivers/staging/iio/light/tsl2583.c
> +++ b/drivers/staging/iio/light/tsl2583.c
> @@ -511,33 +511,6 @@ static int taos_chip_off(struct iio_dev *indio_dev)
>  
>  /* Sysfs Interface Functions */
>  
> -static ssize_t taos_power_state_show(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> -{
> -	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> -	struct tsl2583_chip *chip = iio_priv(indio_dev);
> -
> -	return sprintf(buf, "%d\n", chip->taos_chip_status);
> -}
> -
> -static ssize_t taos_power_state_store(struct device *dev,
> -				      struct device_attribute *attr,
> -				      const char *buf, size_t len)
> -{
> -	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> -	int value;
> -
> -	if (kstrtoint(buf, 0, &value))
> -		return -EINVAL;
> -
> -	if (!value)
> -		taos_chip_off(indio_dev);
> -	else
> -		taos_chip_on(indio_dev);
> -
> -	return len;
> -}
> -
>  static ssize_t taos_gain_show(struct device *dev,
>  			      struct device_attribute *attr, char *buf)
>  {
> @@ -785,9 +758,6 @@ static ssize_t taos_luxtable_store(struct device *dev,
>  	return len;
>  }
>  
> -static DEVICE_ATTR(power_state, S_IRUGO | S_IWUSR,
> -		taos_power_state_show, taos_power_state_store);
> -
>  static DEVICE_ATTR(illuminance0_calibscale, S_IRUGO | S_IWUSR,
>  		taos_gain_show, taos_gain_store);
>  static DEVICE_ATTR(illuminance0_calibscale_available, S_IRUGO,
> @@ -810,7 +780,6 @@ static DEVICE_ATTR(illuminance0_lux_table, S_IRUGO | S_IWUSR,
>  		taos_luxtable_show, taos_luxtable_store);
>  
>  static struct attribute *sysfs_attrs_ctrl[] = {
> -	&dev_attr_power_state.attr,
>  	&dev_attr_illuminance0_calibscale.attr,			/* Gain  */
>  	&dev_attr_illuminance0_calibscale_available.attr,
>  	&dev_attr_illuminance0_integration_time.attr,	/* I time*/
> 
