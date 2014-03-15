From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 8/9] iio: documentation: Add ABI documentation for *_mean_raw
Date: Sat, 15 Mar 2014 15:40:42 +0000
Message-ID: <5324747A.8030507@kernel.org>
References: <1394472329-15485-1-git-send-email-sre@debian.org> <1394472329-15485-9-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394472329-15485-9-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/03/14 17:25, Sebastian Reichel wrote:
> Add ABI documentation for in_*_mean_raw files, which are
> already supported and used in the kernel for some time.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
As this one stands fine on it's own...

Applied to the togreg branch of iio.git

Thanks
> ---
>   Documentation/ABI/testing/sysfs-bus-iio | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 6e02c50..58ba333 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -210,6 +210,14 @@ Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>   Description:
>   		Scaled humidity measurement in milli percent.
>
> +What:		/sys/bus/iio/devices/iio:deviceX/in_X_mean_raw
> +KernelVersion:	3.5
> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description:
> +		Averaged raw measurement from channel X. The number of values
> +		used for averaging is device specific. The converting rules for
> +		normal raw values also applies to the averaged raw values.
> +
>   What:		/sys/bus/iio/devices/iio:deviceX/in_accel_offset
>   What:		/sys/bus/iio/devices/iio:deviceX/in_accel_x_offset
>   What:		/sys/bus/iio/devices/iio:deviceX/in_accel_y_offset
>
