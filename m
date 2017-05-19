From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: Hi3660: change to register crgctrl clock
 with CLK_OF_DECLARE_DRIVER
Date: Thu, 18 May 2017 18:51:37 -0700
Message-ID: <20170519015137.GE20170@codeaurora.org>
References: <1495072247-25217-1-git-send-email-leo.yan@linaro.org>
 <1495072247-25217-2-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495072247-25217-2-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Chen Jun <chenjun14-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/18, Leo Yan wrote:
> diff --git a/drivers/clk/hisilicon/clk-hi3660.c b/drivers/clk/hisilicon/clk-hi3660.c
> index fd5ce7f..4e5713b 100644
> --- a/drivers/clk/hisilicon/clk-hi3660.c
> +++ b/drivers/clk/hisilicon/clk-hi3660.c
> @@ -547,10 +547,10 @@ static void hi3660_clk_crgctrl_init(struct device_node *np)
>  				  ARRAY_SIZE(hi3660_crgctrl_divider_clks),
>  				  clk_data);
>  }
> +CLK_OF_DECLARE_DRIVER(hi3660_clk_crgctrl, "hisilicon,hi3660-crgctrl",
> +		      hi3660_clk_crgctrl_init);
>  
>  static const struct of_device_id hi3660_clk_match_table[] = {
> -	{ .compatible = "hisilicon,hi3660-crgctrl",
> -	  .data = hi3660_clk_crgctrl_init },

I'm slightly confused. CLK_OF_DECLARE_DRIVER is for when a
platform driver _and_ CLK_OF_DELARE need to "probe" the same
device node. But in this patch, the compatible string is being
deleted from the driver's match table. Also, are all the
registered in hi3660_clk_crgctrl_init() actually needed for the
timer? If only a subset, then I would expect to split the code
and have the CLK_OF_DECLARE_DRIVER() path register just the clks
that matter for the timer, and then leave the rest of the clks to
be registered by the probe of the platform driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
