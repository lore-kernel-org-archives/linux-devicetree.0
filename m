From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH RFC v4 2/2] clk: Add handling of clk parent and rate
 assigned from DT
Date: Mon, 31 Mar 2014 13:06:20 -0700
Message-ID: <20140331200620.GA13881@kroah.com>
References: <1396284116-19178-1-git-send-email-s.nawrocki@samsung.com>
 <1396284116-19178-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396284116-19178-3-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 06:41:56PM +0200, Sylwester Nawrocki wrote:
> This function adds a helper function to configure clock parents and rates
> as specified in clock-parents, clock-rates DT properties for a consumer
> device and a call to it before driver is bound to a device.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v3:
>  - added detailed description of the assigned-clocks subnode,
>  - clk-conf.c is now excluded when CONFIG_OF is not set,
>  - s/of_clk_device_setup/of_clk_device_init,
>  - added missing 'static inline' to the function stub definition.
> 
> Changes since v2:
>  - edited in clock-bindings.txt, added note about 'assigned-clocks'
>    subnode which may be used to specify "global" clocks configuration
>    at a clock provider node,
>  - moved of_clk_device_setup() function declaration from clk-provider.h
>    to clk-conf.h so required function stubs are available when
>    CONFIG_COMMON_CLK is not enabled,
> 
> Changes since v1:
>  - the helper function to parse and set assigned clock parents and
>    rates made public so it is available to clock providers to call
>    directly;
>  - dropped the platform bus notification and call of_clk_device_setup()
>    is is now called from the driver core, rather than from the
>    notification callback;
>  - s/of_clk_get_list_entry/of_clk_get_by_property.
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt   |   42 ++++++++++
>  drivers/base/dd.c                                  |    7 ++
>  drivers/clk/Makefile                               |    3 +
>  drivers/clk/clk-conf.c                             |   87 ++++++++++++++++++++
>  drivers/clk/clk.c                                  |   10 ++-
>  include/linux/clk/clk-conf.h                       |   19 +++++
>  6 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/clk-conf.c
>  create mode 100644 include/linux/clk/clk-conf.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index 700e7aa..59fbb4e 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -132,3 +132,45 @@ clock signal, and a UART.
>    ("pll" and "pll-switched").
>  * The UART has its baud clock connected the external oscillator and its
>    register clock connected to the PLL clock (the "pll-switched" signal)
> +
> +==Assigned clock parents and rates==
> +
> +Some platforms require static initial configuration of parts of the clocks
> +controller. Such a configuration can be specified in a clock consumer node
> +through clock-parents and clock-rates DT properties. The former should
> +contain a list of parent clocks in form of phandle and clock specifier pairs,
> +the latter the list of assigned clock frequency values (one cell each).
> +
> +    uart@a000 {
> +        compatible = "fsl,imx-uart";
> +        reg = <0xa000 0x1000>;
> +        ...
> +        clocks = <&clkcon 0>, <&clkcon 3>;
> +        clock-names = "baud", "mux";
> +
> +        clock-parents = <0>, <&pll 1>;
> +        clock-rates = <460800>;
> +    };
> +
> +In this example the pll is set as parent of "mux" clock and frequency of "baud"
> +clock is specified as 460800 Hz.
> +
> +Configuring a clock parent and rate through the device node that uses
> +the clock can be done only for clocks that have a single user. Specifying
> +conflicting parent or rate configuration in multiple consumer nodes for
> +a shared clock is forbidden.
> +
> +Configuration of common clocks, which affect multiple consumer devices
> +can be specified in a dedicated 'assigned-clocks' subnode of a clock
> +provider node, e.g.:
> +
> +    clkcon {
> +        ...
> +        #clock-cells = <1>;
> +
> +        assigned-clocks {
> +            clocks = <&clkcon 16>, <&clkcon 17>;
> +            clock-parents = <0>, <&clkcon 1>;
> +            clock-rates = <200000>;
> +        };
> +    };
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0605176..4c633e7 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -25,6 +25,7 @@
>  #include <linux/async.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pinctrl/devinfo.h>
> +#include <linux/clk/clk-conf.h>
> 
>  #include "base.h"
>  #include "power/power.h"
> @@ -278,6 +279,12 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>  	if (ret)
>  		goto probe_failed;
> 
> +	if (dev->of_node) {
> +		ret = of_clk_device_init(dev->of_node);
> +		if (ret)
> +			goto probe_failed;
> +	}
> +
>  	if (driver_sysfs_add(dev)) {
>  		printk(KERN_ERR "%s: driver_sysfs_add(%s) failed\n",
>  			__func__, dev_name(dev));


I don't understand why you need the driver core to initialize this one
type of thing?  That should be in a driver, or in a class, or at worse
case, the platform code.

What makes clocks so "unique" here?

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
