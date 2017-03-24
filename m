From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/5] firmware: google memconsole: Add ARM/ARM64 support
Date: Fri, 24 Mar 2017 12:28:59 +0000
Message-ID: <20170324122858.GF22771@leverpostej>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-6-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490303069-13230-6-git-send-email-thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 10:04:29PM +0100, Thierry Escande wrote:
> This patch expands the Google firmware memory console driver to also
> work on certain tree based platforms running coreboot, such as ARM/ARM64
> Chromebooks. This patch now adds another path to find the coreboot table
> through the device tree. In order to find that, a second level
> bootloader must have installed the 'coreboot' compatible device tree
> node that describes its base address and size.

What exactly is the "memory console"? Is it a log that coreboot writes into?

[...]

> +static const struct of_device_id coreboot_of_match[] = {
> +	{ .compatible = "coreboot" },
> +	{},
> +};
> +
> +static struct platform_driver coreboot_table_of_driver = {
> +	.probe = coreboot_table_of_probe,
> +	.remove = coreboot_table_of_remove,
> +	.driver = {
> +		.name = "coreboot_table_of",
> +		.of_match_table = coreboot_of_match,
> +	},
> +};
> +
> +static int __init platform_coreboot_table_of_init(void)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *of_node;
> +
> +	/* Limit device creation to the presence of /firmware/coreboot node */
> +	of_node = of_find_node_by_path("/firmware/coreboot");
> +	if (!of_node)
> +		return -ENODEV;
> +

I don't beleive that you need this module init function. Please use the
usual DT probing infrastrucutre instead, e.g. add:

MODULE_DEVICE_TABLE(of, coreboot_of_match);
module_platform_driver(coreboot_table_of_driver);

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
