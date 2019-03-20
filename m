From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/4] clk: meson: meson8b: add the VPU clock trees
Date: Wed, 20 Mar 2019 09:18:27 +0100
Message-ID: <0439a93e-8338-efca-9a7d-8285710400fb@baylibre.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319215121.29340-5-martin.blumenstingl@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/03/2019 22:51, Martin Blumenstingl wrote:
> The VPU clock tree is slightly different on all three supported SoCs:
> 
> Meson8 only has an input mux (which chooses between "fclk_div4",
> "fclk_div3", "fclk_div5" and "fclk_div7"), a divider and a gate.
> 
> Meson8b has two VPU clock trees, each with an input mux (using the same
> parents as the input mux on Meson8), divider and a gates. The final VPU
> clock is a glitch-free mux which chooses between VPU_1 and VPU_2.
> 
> Meson8m2 uses a similar clock tree as Meson8b but the last input clock
> is different: instead of using "fclk_div7" as input Meson8m2 uses
> "gp_pll". This was probably done in hardware to improve the accuracy of
> the clock because fclk_div7 gives us 2550MHz / 7 = 364.286MHz while
> GP_PLL can achieve 364.0MHz.

This could be a reason, but they only implement frequency scaling for the VPU
in the recent 4.9 kernel releases... but we should also implement it upstream
once we solve how to switch these dual clocks in a clean fashion.

> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 167 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |   9 +-
>  2 files changed, 175 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 0d08f1ef7af8..8e091c2d10e6 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1761,6 +1761,147 @@ static struct clk_regmap meson8m2_gp_pll = {
>  	},
>  };
>  
> +static const char * const mmeson8b_vpu_0_1_parent_names[] = {
> +	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> +};
> +
> +static const char * const mmeson8m2_vpu_0_1_parent_names[] = {
> +	"fclk_div4", "fclk_div3", "fclk_div5", "gp_pll"
> +};
> +
> +static struct clk_regmap meson8b_vpu_0_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 9,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_0_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = mmeson8b_vpu_0_1_parent_names,
> +		.num_parents = ARRAY_SIZE(mmeson8b_vpu_0_1_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8m2_vpu_0_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 9,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_0_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = mmeson8m2_vpu_0_1_parent_names,
> +		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu_0_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_0_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vpu_0_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu_0 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vpu_0",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vpu_0_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu_1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 25,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_1_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = mmeson8b_vpu_0_1_parent_names,
> +		.num_parents = ARRAY_SIZE(mmeson8b_vpu_0_1_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8m2_vpu_1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 25,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_1_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = mmeson8m2_vpu_0_1_parent_names,
> +		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu_1_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.shift = 16,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_1_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vpu_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu_1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vpu_1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vpu_1_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vpu = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VPU_CLK_CNTL,
> +		.mask = 1,
> +		.shift = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = (const char *[]){ "vpu_0", "vpu_1" },
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  
>  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> @@ -2024,6 +2165,9 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
>  		[CLKID_MALI_0_SEL]	    = &meson8b_mali_0_sel.hw,
>  		[CLKID_MALI_0_DIV]	    = &meson8b_mali_0_div.hw,
>  		[CLKID_MALI]		    = &meson8b_mali_0.hw,
> +		[CLKID_VPU_0_SEL]	    = &meson8b_vpu_0_sel.hw,
> +		[CLKID_VPU_0_DIV]	    = &meson8b_vpu_0_div.hw,
> +		[CLKID_VPU]		    = &meson8b_vpu_0.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2210,6 +2354,13 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
>  		[CLKID_MALI_1_DIV]	    = &meson8b_mali_1_div.hw,
>  		[CLKID_MALI_1]		    = &meson8b_mali_1.hw,
>  		[CLKID_MALI]		    = &meson8b_mali.hw,
> +		[CLKID_VPU_0_SEL]	    = &meson8b_vpu_0_sel.hw,
> +		[CLKID_VPU_0_DIV]	    = &meson8b_vpu_0_div.hw,
> +		[CLKID_VPU_0]		    = &meson8b_vpu_0.hw,
> +		[CLKID_VPU_1_SEL]	    = &meson8b_vpu_1_sel.hw,
> +		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
> +		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
> +		[CLKID_VPU]		    = &meson8b_vpu.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2398,6 +2549,13 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
>  		[CLKID_MALI]		    = &meson8b_mali.hw,
>  		[CLKID_GP_PLL_DCO]	    = &meson8m2_gp_pll_dco.hw,
>  		[CLKID_GP_PLL]		    = &meson8m2_gp_pll.hw,
> +		[CLKID_VPU_0_SEL]	    = &meson8m2_vpu_0_sel.hw,
> +		[CLKID_VPU_0_DIV]	    = &meson8b_vpu_0_div.hw,
> +		[CLKID_VPU_0]		    = &meson8b_vpu_0.hw,
> +		[CLKID_VPU_1_SEL]	    = &meson8m2_vpu_1_sel.hw,
> +		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
> +		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
> +		[CLKID_VPU]		    = &meson8b_vpu.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2562,6 +2720,15 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
>  	&meson8b_mali,
>  	&meson8m2_gp_pll_dco,
>  	&meson8m2_gp_pll,
> +	&meson8b_vpu_0_sel,
> +	&meson8m2_vpu_0_sel,
> +	&meson8b_vpu_0_div,
> +	&meson8b_vpu_0,
> +	&meson8b_vpu_1_sel,
> +	&meson8m2_vpu_1_sel,
> +	&meson8b_vpu_1_div,
> +	&meson8b_vpu_1,
> +	&meson8b_vpu,
>  };
>  
>  static const struct meson8b_clk_reset_line {
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index a45f7102c558..e775f91ccce9 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -35,6 +35,7 @@
>  #define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
>  #define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
>  #define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
> +#define HHI_VPU_CLK_CNTL		0x1bc /* 0x6f offset in data sheet */
>  #define HHI_HDMI_CLK_CNTL		0x1cc /* 0x73 offset in data sheet */
>  #define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
>  #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
> @@ -149,8 +150,14 @@
>  #define CLKID_MALI_1		180
>  #define CLKID_GP_PLL_DCO	181
>  #define CLKID_GP_PLL		182
> +#define CLKID_VPU_0_SEL		183
> +#define CLKID_VPU_0_DIV		184
> +#define CLKID_VPU_0		185
> +#define CLKID_VPU_1_SEL		186
> +#define CLKID_VPU_1_DIV		187
> +#define CLKID_VPU_1		189
>  
> -#define CLK_NR_CLKS		183
> +#define CLK_NR_CLKS		191
>  
>  /*
>   * include the CLKID and RESETID that have
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
