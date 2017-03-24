From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 3/7] coresight: refactor with function
 of_coresight_get_cpu
Date: Fri, 24 Mar 2017 11:14:21 -0700
Message-ID: <20170324181421.GB25840@codeaurora.org>
References: <1489762943-25849-1-git-send-email-leo.yan@linaro.org>
 <1489762943-25849-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489762943-25849-4-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/17, Leo Yan wrote:
> diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
> index 917ca39..7a60f2b 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -101,15 +101,38 @@ static int of_coresight_alloc_memory(struct device *dev,
>  	return 0;
>  }
>  
> +int of_coresight_get_cpu(struct device_node *node)

const node?

> +{
> +	int cpu;
> +	bool found;
> +	struct device_node *dn, *np;
> +
> +	dn = of_parse_phandle(node, "cpu", 0);
> +
> +	/* Affinity defaults to CPU0 */
> +	if (!dn)
> +		return 0;
> +
> +	for_each_possible_cpu(cpu) {
> +		np = of_get_cpu_node(cpu, NULL);

of_cpu_device_node_get()?

> +		found = (dn == np);
> +		of_node_put(np);
> +		if (found)
> +			break;
> +	}
> +	of_node_put(dn);
> +
> +	/* Affinity to CPU0 if no cpu nodes are found */
> +	return found ? cpu : 0;
> +}
> +
>  struct coresight_platform_data *of_get_coresight_platform_data(
>  				struct device *dev, struct device_node *node)
>  {
> -	int i = 0, ret = 0, cpu;
> +	int i = 0, ret = 0;
>  	struct coresight_platform_data *pdata;
>  	struct of_endpoint endpoint, rendpoint;
>  	struct device *rdev;
> -	bool found;
> -	struct device_node *dn, *np;
>  	struct device_node *ep = NULL;
>  	struct device_node *rparent = NULL;
>  	struct device_node *rport = NULL;
> @@ -176,18 +199,7 @@ struct coresight_platform_data *of_get_coresight_platform_data(
>  		} while (ep);
>  	}
>  
> -	dn = of_parse_phandle(node, "cpu", 0);
> -	for_each_possible_cpu(cpu) {
> -		np = of_get_cpu_node(cpu, NULL);
> -		found = (dn == np);
> -		of_node_put(np);
> -		if (found)
> -			break;
> -	}
> -	of_node_put(dn);
> -

Ok yeah the code is moving, so perhaps another patch to make the
changes suggested above.

> -	/* Affinity to CPU0 if no cpu nodes are found */
> -	pdata->cpu = found ? cpu : 0;
> +	pdata->cpu = of_coresight_get_cpu(node);
>  
>  	return pdata;
>  }
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 2a5982c..7b29743 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -263,9 +263,11 @@ static inline int coresight_timeout(void __iomem *addr, u32 offset,
>  #endif
>  
>  #ifdef CONFIG_OF
> +extern int of_coresight_get_cpu(struct device_node *node);
>  extern struct coresight_platform_data *of_get_coresight_platform_data(
>  				struct device *dev, struct device_node *node);
>  #else
> +static int of_coresight_get_cpu(struct device_node *node) { return 0; }

inline?

>  static inline struct coresight_platform_data *of_get_coresight_platform_data(
>  	struct device *dev, struct device_node *node) { return NULL; }
>  #endif
> -- 
> 2.7.4
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
