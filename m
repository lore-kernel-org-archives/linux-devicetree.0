From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/4] iio: Documentation: Add max9611 sysfs
 documentation
Date: Sat, 8 Apr 2017 17:00:48 +0100
Message-ID: <ca3b2b44-56ca-6bb3-cd8d-40c0a11a4073@kernel.org>
References: <1491488454-22468-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491488454-22468-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491488454-22468-3-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/04/17 15:20, Jacopo Mondi wrote:
> Add documentation for max9611 driver.
> Document attributes describing value of shunt resistor installed between
> RS+ and RS- voltage sense inputs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Looks good to me.  There is the small matter that when we generalize this
we will probably loose some detail, but such is life.

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> ---
>  Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
> new file mode 100644
> index 0000000..6d2d2b0
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
> @@ -0,0 +1,17 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_power_shunt_resistor
> +Date:		March 2017
> +KernelVersion:	4.12
> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description: 	The value of the shunt resistor used to compute power drain on
> +                common input voltage pin (RS+). In Ohms.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_current_shunt_resistor
> +Date:		March 2017
> +KernelVersion:	4.12
> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +Description: 	The value of the shunt resistor used to compute current flowing
> +                between RS+ and RS- voltage sense inputs. In Ohms.
> +
> +These attributes describe a single physical component, exposed as two distinct
> +attributes as it is used to calculate two different values: power load and
> +current flowing between RS+ and RS- inputs.
> 
