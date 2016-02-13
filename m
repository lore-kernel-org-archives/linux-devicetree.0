From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v42 3/6] clk: Provide OF helper to mark clocks as CRITICAL
Date: Fri, 12 Feb 2016 17:09:41 -0800
Message-ID: <20160213010941.GH4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org, maxime.ripard@free-electrons.com, maxime.coquelin@st.com, geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com, rklein@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/11, Michael Turquette wrote:
> +int of_clk_mark_if_critical(struct device_node *np,
> +					  int index, unsigned long *flags)
> +{
> +	struct property *prop;
> +	const __be32 *cur;
> +	uint32_t idx;
> +
> +	if (!np || !flags)
> +		return -EINVAL;
> +
> +	of_property_for_each_u32(np, "clock-critical", prop, cur, idx)
> +		if (index == idx)
> +			*flags |= CLK_IS_CRITICAL;
> +
> +	return 0;
> +}

I hope we don't have to export this to modules...

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
