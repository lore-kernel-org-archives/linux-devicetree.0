From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: core: Introduce IIO_CHAN_INFO_CALIBREPETITIONS
Date: Sat, 18 Apr 2015 17:47:14 +0100
Message-ID: <55328A92.9020807@kernel.org>
References: <1429267830-13681-1-git-send-email-irina.tirdea@intel.com> <1429267830-13681-2-git-send-email-irina.tirdea@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429267830-13681-2-git-send-email-irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/04/15 11:50, Irina Tirdea wrote:
> Some magnetometers can perform a number of repetitions in HW
> for each measurement to increase accuracy. One example is
> Bosch BMC150:
> http://ae-bst.resource.bosch.com/media/products/dokumente/bmc150/BST-BMC150-DS000-04.pdf.
> 
> Introduce an interface to set the number of repetitions
> for these devices.
> 
> Signed-off-by: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio | 10 ++++++++++
>  drivers/iio/industrialio-core.c         |  1 +
>  include/linux/iio/iio.h                 |  1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 866b4ec..74c1444 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -1375,3 +1375,13 @@ Description:
>  		The emissivity ratio of the surface in the field of view of the
>  		contactless temperature sensor.  Emissivity varies from 0 to 1,
>  		with 1 being the emissivity of a black body.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_x_calibrepetitions
> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_y_calibrepetitions
> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_z_calibrepetitions
> +KernelVersion:	4.2
> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description:
> +		Hardware applied number of repetitions for acquiring one
> +		data point. The HW will do <type>[_name]_calibrepetitions
> +		measurements and return the average value as output data.
This is an interesting way of naming what is often referred to as oversampling.
I'd like to get some other opinions on naming before we go with the ABI for this..

We do have one driver in staging exporting oversampling_ratio which is probably
the same thing, but that ABI was never standardized so I have no problem with
ignoring that one case.  A couple of other drivers provide oversampling control
via platform data.   We must make sure we give a sensible default for this.

There is also the interesting question of whether sampling_frequency applies
before or after this...  I'd argue after, but again would like more opinions
before we dictate that.  However, whatever we choose should definitely be
documented here!

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 7c98bc1..9e0da7f 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -129,6 +129,7 @@ static const char * const iio_chan_info_postfix[] = {
>  	[IIO_CHAN_INFO_DEBOUNCE_COUNT] = "debounce_count",
>  	[IIO_CHAN_INFO_DEBOUNCE_TIME] = "debounce_time",
>  	[IIO_CHAN_INFO_CALIBEMISSIVITY] = "calibemissivity",
> +	[IIO_CHAN_INFO_CALIBREPETITIONS] = "calibrepetitions",
>  };
>  
>  /**
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index b1e46ae..07fbfb2 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -44,6 +44,7 @@ enum iio_chan_info_enum {
>  	IIO_CHAN_INFO_DEBOUNCE_COUNT,
>  	IIO_CHAN_INFO_DEBOUNCE_TIME,
>  	IIO_CHAN_INFO_CALIBEMISSIVITY,
> +	IIO_CHAN_INFO_CALIBREPETITIONS,
>  };
>  
>  enum iio_shared_by {
> 
