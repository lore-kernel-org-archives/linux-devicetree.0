From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V2 5/7] clk: imx8mn: Add missing rate_count
 assignment for each PLL structure
Date: Mon, 19 Aug 2019 15:38:28 +0200
Message-ID: <20190819133827.GN5999@X250>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
 <1566109945-11149-5-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566109945-11149-5-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, leonard.crestez@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Sun, Aug 18, 2019 at 02:32:23AM -0400, Anson Huang wrote:
> Add .rate_count assignment which is necessary for searching required
> PLL rate from the each PLL table.
> 
> Fixes: 96d6392b54db ("clk: imx: Add support for i.MX8MN clock driver")

The commit ID is not stable before the commit lands on mainline, so I
dropped it and applied the patch.

Shawn

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- split the patch into 2 patches, #1 fixed those missing .rate_count assignment,
> 	  #2 add missing frequency points.
> ---
>  drivers/clk/imx/clk-imx8mn.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index ecd1062..b5a027c 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -67,36 +67,43 @@ static const struct imx_pll14xx_rate_table imx8mn_drampll_tbl[] = {
>  static struct imx_pll14xx_clk imx8mn_audio_pll = {
>  		.type = PLL_1443X,
>  		.rate_table = imx8mn_audiopll_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_audiopll_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_video_pll = {
>  		.type = PLL_1443X,
>  		.rate_table = imx8mn_videopll_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_videopll_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_dram_pll = {
>  		.type = PLL_1443X,
>  		.rate_table = imx8mn_drampll_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_drampll_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_arm_pll = {
>  		.type = PLL_1416X,
>  		.rate_table = imx8mn_pll1416x_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_pll1416x_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_gpu_pll = {
>  		.type = PLL_1416X,
>  		.rate_table = imx8mn_pll1416x_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_pll1416x_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_vpu_pll = {
>  		.type = PLL_1416X,
>  		.rate_table = imx8mn_pll1416x_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_pll1416x_tbl),
>  };
>  
>  static struct imx_pll14xx_clk imx8mn_sys_pll = {
>  		.type = PLL_1416X,
>  		.rate_table = imx8mn_pll1416x_tbl,
> +		.rate_count = ARRAY_SIZE(imx8mn_pll1416x_tbl),
>  };
>  
>  static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
> -- 
> 2.7.4
> 
