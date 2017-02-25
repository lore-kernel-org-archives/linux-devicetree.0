From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: Documentation: Add max961x sysfs documentation
Date: Sat, 25 Feb 2017 15:54:45 +0000
Message-ID: <56b35a65-a23d-68ac-17d6-cf46f9352ab7@kernel.org>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487948756-25172-3-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, meerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/02/17 15:05, Jacopo Mondi wrote:
> Add documentation for max961x driver.
> The only attribute to document is the current sense shunt resistor
> value.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Interestingly generic as it only applies to some of the channels.
We might need to have the channel where it is effecting the output specified in the
name, even if we end up with several repeats of the same thing for different
computed channels.

Jonathan
> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-max961x | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x b/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> new file mode 100644
> index 0000000..dbd5e75
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
> @@ -0,0 +1,5 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_shunt_resistor
> +Date:		February 2017
> +KernelVersion:	4.10
> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description: 	The value of the shunt resistor in micro Ohms.
> 
