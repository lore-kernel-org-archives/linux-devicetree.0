From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 6/6] clk: qcom: ipq4019: Add the cpu clock frequency
 change notifier
Date: Wed, 21 Dec 2016 15:56:27 -0800
Message-ID: <20161221235627.GI8288@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
 <1480088493-4590-7-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480088493-4590-7-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, snlakshm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/25, Abhishek Sahu wrote:
> @@ -1736,13 +1737,55 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  };
>  MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
>  
> +/* Contains index for safe clock during APSS freq change */
> +static int gcc_ipq4019_cpu_safe_parent;
> +static int
> +gcc_ipq4019_cpu_clk_notifier_fn(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
> +	int err = 0;
> +
> +	if (action == PRE_RATE_CHANGE)
> +		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
> +					      gcc_ipq4019_cpu_safe_parent);

Why can't we hardcode this? It's not like this safe parent is
going to change across boards.

> +
> +	return notifier_from_errno(err);
> +}
> +
> +static struct notifier_block gcc_ipq4019_cpu_clk_notifier = {
> +	.notifier_call = gcc_ipq4019_cpu_clk_notifier_fn,
> +};
> +
>  static int gcc_ipq4019_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +	int err;
> +
> +	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +	if (err)
> +		return err;
> +
> +	gcc_ipq4019_cpu_safe_parent = qcom_find_src_index(&apps_clk_src.clkr.hw,
> +						apps_clk_src.parent_map,
> +						P_FEPLL500);
> +	if (gcc_ipq4019_cpu_safe_parent < 0)
> +		err = gcc_ipq4019_cpu_safe_parent;

Then we don't need to do this.

> +
> +	if (!err)
> +		err = clk_notifier_register(apps_clk_src.clkr.hw.clk,
> +				      &gcc_ipq4019_cpu_clk_notifier);
> +
> +	return err;
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
