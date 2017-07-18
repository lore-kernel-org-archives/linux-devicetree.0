From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: imx: imx7d: Fix parent clock for OCRAM_CLK
Date: Tue, 18 Jul 2017 16:10:55 -0700
Message-ID: <20170718231055.GG18179@codeaurora.org>
References: <1500363892-1173-1-git-send-email-adriana.reus@nxp.com>
 <1500363892-1173-2-git-send-email-adriana.reus@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500363892-1173-2-git-send-email-adriana.reus@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: Adriana Reus <adriana.reus@nxp.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, fabio.estevam@nxp.com, shawnguo@kernel.org, anson.huang@nxp.com
List-Id: devicetree@vger.kernel.org

On 07/18, Adriana Reus wrote:
> The parent of OCRAM_CLK should be axi_main_root_clk
> and not axi_post_div.
> 
> before:
> 
>     axi_src                     1       1       332307692       0 0
>       axi_cg                    1       1       332307692       0 0
>         axi_pre_div             1       1       332307692       0 0
>           axi_post_div          1       1       332307692       0 0
>             ocram_clk           0       0       332307692       0 0
>             main_axi_root_clk   1       1       332307692       0 0
> 
> after:
> 
>     axi_src                     1       1       332307692       0 0
>       axi_cg                    1       1       332307692       0 0
>         axi_pre_div             1       1       332307692       0 0
>           axi_post_div          1       1       332307692       0 0
>             main_axi_root_clk   1       1       332307692       0 0
>               ocram_clk         0       0       332307692       0 0
> 
> Signed-off-by: Adriana Reus <adriana.reus@nxp.com>

Fixes: tag?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
