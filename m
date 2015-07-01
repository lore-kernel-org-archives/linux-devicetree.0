From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v1 01/10] of/platform: Set fwnode field for new devices
Date: Thu, 02 Jul 2015 01:32:17 +0200
Message-ID: <2474190.tMuKjeazpI@vostro.rjw.lan>
References: <1435676108-20590-1-git-send-email-tomeu.vizoso@collabora.com> <1435676108-20590-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435676108-20590-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, June 30, 2015 04:54:59 PM Tomeu Vizoso wrote:
> When allocating a new platform device, set the fwnode field in the
> struct device to point to the device_node.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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

What about using set_primary_fwnode() instead of the direct assignment?

Or even having a macro analogous to ACPI_COMPANION_SET() for this purpose?

>  	dev->dev.parent = parent ? : &platform_bus;
>  
>  	if (bus_id)
> 

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
