From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/5] iio: trigger: add set_trigger callback to notify
 device
Date: Sun, 9 Apr 2017 09:45:39 +0100
Message-ID: <98a89a18-a1e7-5e5b-663a-25b23c352444@kernel.org>
References: <1491495116-7209-1-git-send-email-fabrice.gasnier@st.com>
 <1491495116-7209-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491495116-7209-4-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/04/17 17:11, Fabrice Gasnier wrote:
> Add 'set_trigger' callback to iio info structure. This allows device
> to be notified when a trigger (or no trigger) has been assigned. This
> maybe useful for instance in non buffered mode (e.g. event triggered).
> This is called, after trigger and device side validate callbacks have
> been called.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Seems sensible to me...

J
> ---
> Changes in v2:
> - Added set_trigger callback used in remaining patches
> ---
>  drivers/iio/industrialio-trigger.c | 6 ++++++
>  include/linux/iio/iio.h            | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
> index 978e1592..010bdf2 100644
> --- a/drivers/iio/industrialio-trigger.c
> +++ b/drivers/iio/industrialio-trigger.c
> @@ -434,6 +434,12 @@ static ssize_t iio_trigger_write_current(struct device *dev,
>  			goto out_trigger_put;
>  	}
>  
> +	if (indio_dev->info->set_trigger) {
> +		ret = indio_dev->info->set_trigger(indio_dev, trig);
> +		if (ret)
> +			goto out_trigger_put;
> +	}
> +
>  	indio_dev->trig = trig;
>  
>  	if (oldtrig) {
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 3f5ea2e..9f51065 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -399,6 +399,7 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
>   * @write_event_value:	write a configuration value for the event.
>   * @validate_trigger:	function to validate the trigger when the
>   *			current trigger gets changed.
> + * @set_trigger:	function to notify current trigger gets changed.
>   * @update_scan_mode:	function to configure device and scan buffer when
>   *			channels have changed
>   * @debugfs_reg_access:	function to read or write register value of device
> @@ -478,6 +479,7 @@ struct iio_info {
>  
>  	int (*validate_trigger)(struct iio_dev *indio_dev,
>  				struct iio_trigger *trig);
> +	int (*set_trigger)(struct iio_dev *indio_dev, struct iio_trigger *trig);
>  	int (*update_scan_mode)(struct iio_dev *indio_dev,
>  				const unsigned long *scan_mask);
>  	int (*debugfs_reg_access)(struct iio_dev *indio_dev,
> 
