From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/4] clk: meson: meson8b: add support for the GP_PLL clock
 on Meson8m2
Date: Wed, 20 Mar 2019 09:16:12 +0100
Message-ID: <5f706640-1f39-0ebf-98d7-042300455083@baylibre.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319215121.29340-4-martin.blumenstingl@googlemail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/03/2019 22:51, Martin Blumenstingl wrote:
> Meson8m2 has a GP_PLL clock (similar to GP0_PLL on GXBB/GXL/GXM) which
> is used as input for the VPU clocks.
> The only supported frequency (based on Amlogic's vendor kernel sources)
> is 364MHz which is achieved using the following parameters:
> - input: XTAL (24MHz)
> - M = 182
> - N = 3
> - OD = 2 ^ 2
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 62 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |  5 ++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index c9e6ec67d649..0d08f1ef7af8 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1703,6 +1703,64 @@ static struct clk_regmap meson8b_mali = {
>  	},
>  };
>  
> +static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
> +	PLL_PARAMS(182, 3),
> +	{ /* sentinel */ },
> +};
> +
> +static struct clk_regmap meson8m2_gp_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 9,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HHI_GP_PLL_CNTL,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.table = meson8m2_gp_pll_params_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "xtal" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap meson8m2_gp_pll = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_GP_PLL_CNTL,
> +		.shift = 16,
> +		.width = 2,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "gp_pll_dco" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  
>  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> @@ -2338,6 +2396,8 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
>  		[CLKID_MALI_1_DIV]	    = &meson8b_mali_1_div.hw,
>  		[CLKID_MALI_1]		    = &meson8b_mali_1.hw,
>  		[CLKID_MALI]		    = &meson8b_mali.hw,
> +		[CLKID_GP_PLL_DCO]	    = &meson8m2_gp_pll_dco.hw,
> +		[CLKID_GP_PLL]		    = &meson8m2_gp_pll.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2500,6 +2560,8 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
>  	&meson8b_mali_1_div,
>  	&meson8b_mali_1,
>  	&meson8b_mali,
> +	&meson8m2_gp_pll_dco,
> +	&meson8m2_gp_pll,
>  };
>  
>  static const struct meson8b_clk_reset_line {
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index b8c58faeae52..a45f7102c558 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -19,6 +19,7 @@
>   *
>   * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
>   */
> +#define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
>  #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
>  #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
>  #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
> @@ -146,8 +147,10 @@
>  #define CLKID_MALI_1_SEL	178
>  #define CLKID_MALI_1_DIV	179
>  #define CLKID_MALI_1		180
> +#define CLKID_GP_PLL_DCO	181
> +#define CLKID_GP_PLL		182
>  
> -#define CLK_NR_CLKS		181
> +#define CLK_NR_CLKS		183
>  
>  /*
>   * include the CLKID and RESETID that have
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
