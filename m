From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 05/10] clk: iproc: Add PLL base write function
Date: Fri, 9 Oct 2015 17:21:06 -0700
Message-ID: <20151010002106.GZ26883@codeaurora.org>
References: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
 <1443826665-17570-6-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443826665-17570-6-git-send-email-jonmason@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/02, Jon Mason wrote:
> diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
> index e029ab3..a4602aa 100644
> --- a/drivers/clk/bcm/clk-iproc-pll.c
> +++ b/drivers/clk/bcm/clk-iproc-pll.c
> @@ -137,6 +137,18 @@ static int pll_wait_for_lock(struct iproc_pll *pll)
>  	return -EIO;
>  }
>  
> +static void iproc_pll_write(struct iproc_pll *pll, void __iomem *base,
> +			    u32 offset, u32 val)
> +{
> +	const struct iproc_pll_ctrl *ctrl = pll->ctrl;
> +
> +	writel(val, base + offset);
> +
> +	if (unlikely(ctrl->flags & IPROC_CLK_NEEDS_READ_BACK &&
> +		     base == pll->pll_base))
> +		val = readl(base + offset);

Is there any point to assign val here?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
