From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] misc: Add initial Digital Timing Engine (DTE) driver for cygnus
Date: Thu, 23 Apr 2015 10:04:35 +0200
Message-ID: <6346218.3x3hbSlxMs@wuerfel>
References: <1429744923-2007-1-git-send-email-jonathar@broadcom.com> <1429744923-2007-3-git-send-email-jonathar@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429744923-2007-3-git-send-email-jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Darren Edamura <dedamura-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 22 April 2015 16:22:03 Jonathan Richardson wrote:
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Tested-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

No description at all?

You are introducing a new subsystem here, which means you get to put
a lot of thought into the API design, to ensure that it works with
other drivers of the same type, and that we don't already have
a subsystem that does what you need here.

Please write a few pages of text about the tradeoffs that went into
the internal and user-facing API design, and explain the differences
to the existing infrastructure we have for the clocksource, clockevent,
k_clock, posix timers, posix timers, timerfd, rtc, and ptp frameworks,
in particular why your hardware cannot fit into the existing frameworks
and has to have a new one.

> +struct bcm_cygnus_dte *dte_get_dev_from_devname(const char *devname)
> +{
> +	struct bcm_cygnus_dte *cygnus_dte = NULL;
> +	bool found = false;
> +
> +	if (!devname)
> +		return NULL;
> +
> +	list_for_each_entry(cygnus_dte, &dtedev_list, node) {
> +		if (!strcmp(dev_name(&cygnus_dte->pdev->dev), devname)) {
> +			/* Matched on device name */
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	return found ? cygnus_dte : NULL;
> +}
> +EXPORT_SYMBOL(dte_get_dev_from_devname);

No, don't match on a device name. If you must have a reference, use
a phandle in DT.

> +int dte_get_timestamp(
> +		struct bcm_cygnus_dte *cygnus_dte,
> +		enum dte_client client,
> +		struct timespec *ts)

Please use timespec64 or ktime_t for internal interfaces.

> +	case DTE_IOCTL_SET_DIVIDER:

For the IOCTLs, please write a documentation in man-page form. No need
for troff formatting, plain text is fine.

> +/**
> + * DTE Client
> + */
> +enum dte_client {
> +	DTE_CLIENT_MIN = 0,
> +	DTE_CLIENT_I2S0_BITCLOCK = 0,
> +	DTE_CLIENT_I2S1_BITCLOCK,
> +	DTE_CLIENT_I2S2_BITCLOCK,
> +	DTE_CLIENT_I2S0_WORDCLOCK,
> +	DTE_CLIENT_I2S1_WORDCLOCK,
> +	DTE_CLIENT_I2S2_WORDCLOCK,
> +	DTE_CLIENT_LCD_CLFP,
> +	DTE_CLIENT_LCD_CLLP,
> +	DTE_CLIENT_GPIO14,
> +	DTE_CLIENT_GPIO15,
> +	DTE_CLIENT_GPIO22,
> +	DTE_CLIENT_GPIO23,
> +	DTE_CLIENT_MAX,
> +};

Make this more abstract, so we can reuse the API for other vendors.

> +#define DTE_IOCTL_BASE          'd'
> +#define DTE_IO(nr)              _IO(DTE_IOCTL_BASE, nr)
> +#define DTE_IOR(nr, type)       _IOR(DTE_IOCTL_BASE, nr, type)
> +#define DTE_IOW(nr, type)       _IOW(DTE_IOCTL_BASE, nr, type)
> +#define DTE_IOWR(nr, type)      _IOWR(DTE_IOCTL_BASE, nr, type)
> +
> +#define DTE_IOCTL_SET_DIVIDER       DTE_IOW(0x00, struct dte_data)
> +#define DTE_IOCTL_ENABLE_TIMESTAMP  DTE_IOW(0x01, struct dte_data)
> +#define DTE_IOCTL_SET_IRQ_INTERVAL  DTE_IOW(0x02, struct dte_data)
> +#define DTE_IOCTL_GET_TIMESTAMP     DTE_IOWR(0x03, struct dte_timestamp)
> +#define DTE_IOCTL_SET_TIME          DTE_IOW(0x04, struct timespec)
> +#define DTE_IOCTL_GET_TIME          DTE_IOR(0x05, struct timespec)

Instead of timespec, use a pair of '__u64' values, or alternatively
just a '__u64' for nanoseconds if the API does not have to cover
times before 1970 or after 2262.

> +#define DTE_IOCTL_ADJ_TIME          DTE_IOW(0x06, int64_t)
> +#define DTE_IOCTL_ADJ_FREQ          DTE_IOW(0x07, int32_t)

Maybe 'struct timex' for the adjustment?

Also, how about adding new syscalls along the lines of
the timerfd stuff instead of using ioctl?

> +struct dte_data {
> +	enum dte_client client;
> +	unsigned int data;
> +};

No 'enum' in ioctl data, always use '__u32' etc.

> +
> +struct dte_timestamp {
> +	enum dte_client client;
> +	struct timespec ts;
> +};

Instead of timespec, use a pair of '__u64' values, or alternatively
just a '__u64' for nanoseconds if the API does not have to cover
times before 1970 or after 2262.

> +struct bcm_cygnus_dte;
> +
> +extern struct bcm_cygnus_dte *dte_get_dev_from_devname(
> +		const char *devname);
> +extern int dte_enable_timestamp(
> +		struct bcm_cygnus_dte *cygnus_dte,
> +		enum dte_client client,
> +		int enable);


Put the internal declarations into one header in include/linux, and the
user space facing ones in another one in include/uapi/linux.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
