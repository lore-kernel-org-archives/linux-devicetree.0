From: Subhash Jadavani <subhashj-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/4] phy: qcom-ufs: Remove -always-on property
Date: Fri, 20 Jan 2017 14:53:46 -0800
Message-ID: <cd2e1326e865890baedab5777e3c0474@codeaurora.org>
References: <20170119104739.4376-1-bjorn.andersson@linaro.org>
 <20170119104739.4376-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119104739.4376-3-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017-01-19 02:47, Bjorn Andersson wrote:
> The fact that a regulator is always-on is a property of the regulator,
> not a specific consumer. Implementing this in the driver leads to a
> system behaviour that is dependent on if the Qualcomm UFS PHY was ever
> (partially) probed.
> 
> If the specific regulator should be always on in a particular device,
> mark it so by specifying "regulator-always-on" in the regulator node.
> 
> Cc: Subhash Jadavani <subhashj-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufs-qcom.txt | 1 -
>  drivers/phy/phy-qcom-ufs-i.h                       | 1 -
>  drivers/phy/phy-qcom-ufs.c                         | 5 +----
>  3 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> index b6b5130e5f65..1f69ee1a61ea 100644
> --- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> @@ -29,7 +29,6 @@ Optional properties:
>  - vdda-pll-max-microamp : specifies max. load that can be drawn from 
> pll supply
>  - vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power 
> supply
>  - vddp-ref-clk-max-microamp : specifies max. load that can be drawn
> from this supply
> -- vddp-ref-clk-always-on : specifies if this supply needs to be kept 
> always on
> 
>  Example:
> 
> diff --git a/drivers/phy/phy-qcom-ufs-i.h 
> b/drivers/phy/phy-qcom-ufs-i.h
> index d505d98cf5f8..13b02b7de30b 100644
> --- a/drivers/phy/phy-qcom-ufs-i.h
> +++ b/drivers/phy/phy-qcom-ufs-i.h
> @@ -77,7 +77,6 @@ struct ufs_qcom_phy_vreg {
>  	int min_uV;
>  	int max_uV;
>  	bool enabled;
> -	bool is_always_on;
>  };
> 
>  struct ufs_qcom_phy {
> diff --git a/drivers/phy/phy-qcom-ufs.c b/drivers/phy/phy-qcom-ufs.c
> index bbd317158084..c145fa6e824c 100644
> --- a/drivers/phy/phy-qcom-ufs.c
> +++ b/drivers/phy/phy-qcom-ufs.c
> @@ -242,9 +242,6 @@ static int ufs_qcom_phy_init_vreg(struct device 
> *dev,
>  			}
>  			err = 0;
>  		}
> -		snprintf(prop_name, MAX_PROP_NAME, "%s-always-on", name);
> -		vreg->is_always_on = of_property_read_bool(dev->of_node,
> -							   prop_name);
>  	}
> 
>  	if (!strcmp(name, "vdda-pll")) {
> @@ -402,7 +399,7 @@ static int ufs_qcom_phy_disable_vreg(struct device 
> *dev,
>  {
>  	int ret = 0;
> 
> -	if (!vreg || !vreg->enabled || vreg->is_always_on)
> +	if (!vreg || !vreg->enabled)
>  		goto out;
> 
>  	ret = regulator_disable(vreg->reg);

Looks good to me.
Reviewed-by: Subhash Jadavani <subhashj-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
