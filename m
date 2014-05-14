From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 2/7] reset: sunxi: allow MFD subdevices probe
Date: Wed, 14 May 2014 16:13:33 +0200
Message-ID: <1400076813.13056.10.camel@paszta.hi.pengutronix.de>
References: <1400071101-30553-1-git-send-email-boris.brezillon@free-electrons.com>
	 <1400071101-30553-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400071101-30553-3-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 14.05.2014, 14:38 +0200 schrieb Boris BREZILLON:
> The current implementation uses sunxi_reset_init function for both early
> init and platform device probe.
> 
> The sunxi_reset_init function uses DT to retrieve device resources, which
> will be an issue if reset controllers are registered from an MFD device
> that define resources from mfd_cell definition.
> 
> Moreover, we can make of devm functions when we're in the probe context.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/reset/reset-sunxi.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
> index 695bd34..a94e7a7 100644
> --- a/drivers/reset/reset-sunxi.c
> +++ b/drivers/reset/reset-sunxi.c
> @@ -145,7 +145,24 @@ MODULE_DEVICE_TABLE(of, sunxi_reset_dt_ids);
>  
>  static int sunxi_reset_probe(struct platform_device *pdev)
>  {
> -	return sunxi_reset_init(pdev->dev.of_node);
> +	struct sunxi_reset_data *data;
> +	struct resource *res;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	data->membase = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->membase))
> +		return PTR_ERR(data->membase);
> +
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.nr_resets = resource_size(res) * 32;
> +	data->rcdev.ops = &sunxi_reset_ops;
> +	data->rcdev.of_node = pdev->dev.of_node;
> +
> +	return reset_controller_register(&data->rcdev);
>  }
>  
>  static int sunxi_reset_remove(struct platform_device *pdev)
> @@ -153,8 +170,6 @@ static int sunxi_reset_remove(struct platform_device *pdev)
>  	struct sunxi_reset_data *data = platform_get_drvdata(pdev);
>  
>  	reset_controller_unregister(&data->rcdev);
> -	iounmap(data->membase);
> -	kfree(data);
>  
>  	return 0;
>  }


