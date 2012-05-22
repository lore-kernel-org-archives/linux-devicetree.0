From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/12] ARM: imx6q: add config-on-boot gpios
Date: Tue, 22 May 2012 11:17:12 +0800
Message-ID: <20120522031709.GH8140@S2101-09.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-8-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337592237-5090-8-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Apart from my comments below, we really need to know Rob and Grant's
opinion on this.

On Mon, May 21, 2012 at 05:23:52PM +0800, Richard Zhao wrote:
> Sometimes, boards have gpios that don't own by any driver or owner
> by a generic driver that don't like hacks. Such gpios is normally
> output and need setup once on boot. So I introduce the config-on-boot
> gpios.
> 
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-sabrelite.dts |    7 ++++++
>  arch/arm/mach-imx/mach-imx6q.c        |   35 +++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q-sabrelite.dts b/arch/arm/boot/dts/imx6q-sabrelite.dts
> index e0ec929..1dd2261 100644
> --- a/arch/arm/boot/dts/imx6q-sabrelite.dts
> +++ b/arch/arm/boot/dts/imx6q-sabrelite.dts
> @@ -17,6 +17,13 @@
>  	model = "Freescale i.MX6 Quad SABRE Lite Board";
>  	compatible = "fsl,imx6q-sabrelite", "fsl,imx6q";
>  
> +	config-on-boot {
> +		output-gpios = <
> +				&gpio3 22 0>;	/* vbus reset */
> +		output-gpio-values = <
> +				1>;		/* vbus reset */
> +	};
> +

So it looks like something not specific to imx board but generic to
other boards.  If so, we may need to come up with a generic binding
document for this.

Is this only used to configure output pin?  Will there be any pin that
needs to be configured as input but not owned by any driver?  Hopefully
not.

>  	memory {
>  		reg = <0x10000000 0x40000000>;
>  	};
> diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
> index b47e98b..577cf19 100644
> --- a/arch/arm/mach-imx/mach-imx6q.c
> +++ b/arch/arm/mach-imx/mach-imx6q.c
> @@ -19,6 +19,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/machine.h>
> @@ -113,6 +114,38 @@ static void __init imx6q_sabrelite_init(void)
>  	imx6q_sabrelite_cko1_setup();
>  }
>  
> +static void __init imx6q_config_on_boot(void)

Do you intend to make this function non-gpio-config only.  Otherwise,
we may need to have "gpio" in the function name, as well as the
"config-on-boot" node name.

Also, if we define the binding as generic one, we may need to find a
common place to implement the function.

> +{
> +	struct device_node *np;
> +	struct property *pp;
> +	int cnt, len, i;
> +	int gpio;
> +
> +	np = of_find_node_by_path("/config-on-boot");
> +	if (!np)
> +		return;
> +	cnt = of_gpio_named_count(np, "output-gpios");
> +	pp = of_find_property(np, "output-gpio-values", &len);
> +	if (!pp || cnt != len / sizeof(u32)) {
> +		pr_err("Invalid config-on-boot gpios!\n");
> +		of_node_put(np);
> +		return;
> +	}
> +	for (i = 0; i < cnt; i++) {
> +		gpio = of_get_named_gpio(np, "output-gpios", i);
> +		if (gpio_is_valid(gpio))
> +			gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH,
> +					"config-on-boot");

So all the gpios will use the same name.

And doesn't the reset generally need a pulse or edge signal, e.g. pull
down for a msec and pull up?

Regards,
Shawn

> +	}
> +
> +	of_node_put(np);
> +}
> +
> +static void __init imx6q_post_populate(void)
> +{
> +	imx6q_config_on_boot();
> +}
> +
>  static void __init imx6q_init_machine(void)
>  {
>  	/*
> @@ -126,6 +159,8 @@ static void __init imx6q_init_machine(void)
>  
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>  
> +	imx6q_post_populate();
> +
>  	imx6q_pm_init();
>  }
>  
> -- 
> 1.7.5.4
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
