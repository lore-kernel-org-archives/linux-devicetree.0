From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] iio: accel: Add driver for the MiraMEMS DA311 3-axis
 12-bit digital accelerometer
Date: Mon, 10 Oct 2016 16:41:39 -0500
Message-ID: <20161010214139.GA15600@rob-hp-laptop>
References: <20161008123426.8991-1-hdegoede@redhat.com>
 <20161008123426.8991-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161008123426.8991-4-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 08, 2016 at 02:34:25PM +0200, Hans de Goede wrote:
> This driver is based on the DA311 Android driver which can be found here:
> https://git.matricom.net/Firmware/kernel_amlogic_meson-common/tree/1e70113a5befd07debb68f537156def84c5be57a/drivers/amlogic/input/sensor
> the mir3da_* files are the DA311 driver.
> 
> Unfortunately there is no datasheet.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Add proper prefix to patch Subject
> -Use i2c_smbus_read_word_data() instead of i2c_smbus_read_i2c_block_data()
> Changes in v3:
> -Express unit in m/s^2 instead of in "G"
> -Drop le16_to_cpu, i2c_smbus_read_word_data() already does this
> ---
>  .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/accel/Kconfig                          |  10 +
>  drivers/iio/accel/Makefile                         |   1 +
>  drivers/iio/accel/da311.c                          | 305 +++++++++++++++++++++
>  4 files changed, 317 insertions(+)
>  create mode 100644 drivers/iio/accel/da311.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
