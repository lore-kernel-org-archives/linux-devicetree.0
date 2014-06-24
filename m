Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/6] of: platform: Fix and export
 of_platform_device_destroy
In-Reply-To: 
 <1403430039-15085-4-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1403430039-15085-4-git-send-email-pantelis.antoniou@konsulko.com>
Date: Tue, 24 Jun 2014 15:23:11 +0100
Message-Id: <20140624142311.95803C40B84@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, 22 Jun 2014 12:40:36 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> of_platform_destroy did not work properly, since the tree
> population test was iterating on all devices having a parent
> a given platform device.
> 
> The check was intended to check whether any other *platform*
> devices were still populated, but instead checked for every
> kind of device. This is wrong, since platform devices typically
> create a subsystem regular device and set themselves as parents.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

The commit text says nothing about why it is being exported. Regardless,
the notifier code needs to be moved into drivers/of/platform.c, which
removes the need for the export.

> ---
>  drivers/of/platform.c       | 11 ++++++++++-
>  include/linux/of_platform.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 500436f..4f60060 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -506,10 +506,18 @@ int of_platform_populate(struct device_node *root,
>  }
>  EXPORT_SYMBOL_GPL(of_platform_populate);
>  
> -static int of_platform_device_destroy(struct device *dev, void *data)
> +int of_platform_device_destroy(struct device *dev, void *data)
>  {
>  	bool *children_left = data;
>  
> +	/* if the device is not a platform device, do nothing */
> +	if (dev->bus != &platform_bus_type
> +#ifdef CONFIG_ARM_AMBA
> +		&& dev->bus != &amba_bustype
> +#endif
> +	   )
> +		return 0;
> +

Yes, this looks right. I'll pick up the patch as a fix and push it out
to Linus (without the export bit).

g.

>  	/* Do not touch devices not populated from the device tree */
>  	if (!dev->of_node || !of_node_check_flag(dev->of_node, OF_POPULATED)) {
>  		*children_left = true;
> @@ -537,6 +545,7 @@ static int of_platform_device_destroy(struct device *dev, void *data)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(of_platform_device_destroy);
>  
>  /**
>   * of_platform_depopulate() - Remove devices populated from device tree
> diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
> index d96e1ba..61c7e8c 100644
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -64,6 +64,8 @@ extern struct platform_device *of_platform_device_create(struct device_node *np,
>  						   const char *bus_id,
>  						   struct device *parent);
>  
> +extern int of_platform_device_destroy(struct device *dev, void *data);
> +
>  extern int of_platform_bus_probe(struct device_node *root,
>  				 const struct of_device_id *matches,
>  				 struct device *parent);
> -- 
> 1.7.12
> 
