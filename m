From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] iio: humidity: hdc100x: document compatible
 HDC10xx devices
Date: Tue, 20 Jun 2017 17:48:09 +0100
Message-ID: <20170620174809.7c3bd480@kernel.org>
References: <1497888066-12652-1-git-send-email-m-stecklein@ti.com>
        <1497888066-12652-2-git-send-email-m-stecklein@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497888066-12652-2-git-send-email-m-stecklein-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Jun 2017 11:01:05 -0500
Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org> wrote:

> Include datasheet links, add i2c_device_id entries, and update
> kconfig help for compatible HDC10xx devices: HDC1000, HDC1008,
> HDC1010, HDC1050, and HDC1080.
> 
> Signed-off-by: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Applied to the togreg branch of iio.git. Initially pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/iio/humidity/Kconfig   |  3 ++-
>  drivers/iio/humidity/hdc100x.c | 11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
> index 14b9ce4..2c0fc9a 100644
> --- a/drivers/iio/humidity/Kconfig
> +++ b/drivers/iio/humidity/Kconfig
> @@ -31,7 +31,8 @@ config HDC100X
>  	select IIO_TRIGGERED_BUFFER
>  	help
>  	  Say yes here to build support for the Texas Instruments
> -	  HDC1000 and HDC1008 relative humidity and temperature sensors.
> +	  HDC1000, HDC1008, HDC1010, HDC1050, and HDC1080 relative
> +	  humidity and temperature sensors.
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called hdc100x.
> diff --git a/drivers/iio/humidity/hdc100x.c b/drivers/iio/humidity/hdc100x.c
> index aa17115..6778bc7 100644
> --- a/drivers/iio/humidity/hdc100x.c
> +++ b/drivers/iio/humidity/hdc100x.c
> @@ -13,6 +13,12 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>   * GNU General Public License for more details.
>   *
> + * Datasheets:
> + * http://www.ti.com/product/HDC1000/datasheet
> + * http://www.ti.com/product/HDC1008/datasheet
> + * http://www.ti.com/product/HDC1010/datasheet
> + * http://www.ti.com/product/HDC1050/datasheet
> + * http://www.ti.com/product/HDC1080/datasheet
>   */
>  
>  #include <linux/delay.h>
> @@ -414,6 +420,11 @@ static int hdc100x_remove(struct i2c_client *client)
>  
>  static const struct i2c_device_id hdc100x_id[] = {
>  	{ "hdc100x", 0 },
> +	{ "hdc1000", 0 },
> +	{ "hdc1008", 0 },
> +	{ "hdc1010", 0 },
> +	{ "hdc1050", 0 },
> +	{ "hdc1080", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, hdc100x_id);
