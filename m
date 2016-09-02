From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mfd: arizona: Add DT options for max_channels_clocked
 and PDM speaker config
Date: Fri, 2 Sep 2016 10:34:59 -0500
Message-ID: <20160902153458.GA28352@rob-hp-laptop>
References: <1472635543-21577-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472635543-21577-1-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 10:25:43AM +0100, Richard Fitzgerald wrote:
> This patch adds DT settings for the max_channels_clocked, spk_fmt and
> spk_mute pdata.
> 
> Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 11 ++++++++

Binding looks fine, but...

>  drivers/mfd/arizona-core.c                        | 31 +++++++++++++++++++++++
>  2 files changed, 42 insertions(+)

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index b95ff2d..36a9633 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -816,6 +816,37 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
>  		count++;
>  	}
>  
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node,
> +				 "wlf,max-channels-clocked",
> +				 prop, cur, val) {
> +		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
> +			break;
> +
> +		pdata->max_channels_clocked[count] = val;
> +		count++;
> +	}

of_property_read_u32_array doesn't work for you?

> +
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-fmt", prop,
> +				 cur, val) {
> +		if (count == ARRAY_SIZE(pdata->spk_fmt))
> +			break;
> +
> +		pdata->spk_fmt[count] = val;
> +		count++;
> +	}
> +
> +	count = 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-mute", prop,
> +				 cur, val) {
> +		if (count == ARRAY_SIZE(pdata->spk_mute))
> +			break;
> +
> +		pdata->spk_mute[count] = val;
> +		count++;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
