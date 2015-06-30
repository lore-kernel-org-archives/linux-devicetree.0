From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v1 01/10] of/platform: Set fwnode field for new devices
Date: Tue, 30 Jun 2015 19:24:19 +0100
Message-ID: <20150630182419.79B03C4086C@trevor.secretlab.ca>
References: <1435676108-20590-1-git-send-email-tomeu.vizoso@collabora.com>
	<1435676108-20590-2-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435676108-20590-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Brown <broonie@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jun 2015 16:54:59 +0200
, Tomeu Vizoso <tomeu.vizoso@collabora.com>
 wrote:
> When allocating a new platform device, set the fwnode field in the
> struct device to point to the device_node.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Acked-by: Grant Likely <grant.likely@linaro.org>

g.

> ---
> 
>  drivers/of/platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index ddf8e42..e880f55 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -139,6 +139,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  	}
>  
>  	dev->dev.of_node = of_node_get(np);
> +	dev->dev.fwnode = &dev->dev.of_node->fwnode;
>  	dev->dev.parent = parent ? : &platform_bus;
>  
>  	if (bus_id)
> -- 
> 2.4.1
> 
