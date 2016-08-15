From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: ipq4019: Added the cpu clock frequency
 change notifier
Date: Mon, 15 Aug 2016 15:26:14 -0700
Message-ID: <20160815222614.GL361@codeaurora.org>
References: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
 <1466516962-18087-6-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466516962-18087-6-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ntelkar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/21, Abhishek Sahu wrote:
> The current driver code gives the crash or gets hang while switching
> the CPU frequency some time. The APSS CPU Clock divider is not glitch
> free so it the APPS clock need to be switched for stable clock during
> the change.
> 
> This patch adds the frequency change notifier for APSS CPU clock. It
> changes the parent of this clock to stable PLL FEPLL500 when it gets
> for PRE_RATE_CHANGE event. This event will be generated before actual
> clock set operations. The clock set operation will again change its
> corresponding parent by getting the same from frequency table.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/clk/qcom/gcc-ipq4019.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index df159c2..3c014f7 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -1740,9 +1740,34 @@ static const struct of_device_id gcc_ipq4019_match_table[] = {
>  };
>  MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
>  
> +int cpu_clk_notifier_fn(struct notifier_block *nb,

static?

Please come up with a better name that is not so generic.

> +			unsigned long action, void *data)
> +{
> +	int err = 0;
> +
> +	if (action == PRE_RATE_CHANGE) {
> +		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
> +							P_FEPLL500);
> +	}
> +
> +	return notifier_from_errno(err);
> +}
> +
> +struct notifier_block cpu_clk_notifier = {

static?

> +	.notifier_call = cpu_clk_notifier_fn,
> +};
> +
>  static int gcc_ipq4019_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +	int err;
> +
> +	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +
> +	if (!err)
> +		clk_notifier_register(apps_clk_src.clkr.hw.clk,
> +					&cpu_clk_notifier);

This has to be unregistered on driver remove.

> +
> +	return err;
>  }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
