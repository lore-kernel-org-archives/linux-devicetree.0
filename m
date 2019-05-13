From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: fix MPLL 50M binding id typo
Date: Mon, 13 May 2019 11:18:07 +0200
Message-ID: <44902731-313b-8e8c-669c-4f15c5b98a55@baylibre.com>
References: <20190512205743.24131-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512205743.24131-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On 12/05/2019 22:57, Jerome Brunet wrote:
> MPLL_5OM (the capital letter o) should indeed be MPLL_50M (the number)
> Fix this before it gets used.
> 
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: 25db146aa726 ("dt-bindings: clk: meson: add g12a periph clock controller bindings")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c              | 4 ++--
>  drivers/clk/meson/g12a.h              | 2 +-
>  include/dt-bindings/clock/g12a-clkc.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 739f64fdf1e3..206fafd299ea 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2734,8 +2734,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>  		[CLKID_MALI_1]			= &g12a_mali_1.hw,
>  		[CLKID_MALI]			= &g12a_mali.hw,
> -		[CLKID_MPLL_5OM_DIV]		= &g12a_mpll_50m_div.hw,
> -		[CLKID_MPLL_5OM]		= &g12a_mpll_50m.hw,
> +		[CLKID_MPLL_50M_DIV]		= &g12a_mpll_50m_div.hw,
> +		[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
>  		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>  		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
>  		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index 39c41af70804..bcc05cd9882f 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -166,7 +166,7 @@
>  #define CLKID_HDMI_DIV				167
>  #define CLKID_MALI_0_DIV			170
>  #define CLKID_MALI_1_DIV			173
> -#define CLKID_MPLL_5OM_DIV			176
> +#define CLKID_MPLL_50M_DIV			176
>  #define CLKID_SYS_PLL_DIV16_EN			178
>  #define CLKID_SYS_PLL_DIV16			179
>  #define CLKID_CPU_CLK_DYN0_SEL			180
> diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
> index 82c9e0c020b2..e10470ed7c4f 100644
> --- a/include/dt-bindings/clock/g12a-clkc.h
> +++ b/include/dt-bindings/clock/g12a-clkc.h
> @@ -130,7 +130,7 @@
>  #define CLKID_MALI_1_SEL			172
>  #define CLKID_MALI_1				174
>  #define CLKID_MALI				175
> -#define CLKID_MPLL_5OM				177
> +#define CLKID_MPLL_50M				177
>  #define CLKID_CPU_CLK				187
>  #define CLKID_PCIE_PLL				201
>  #define CLKID_VDEC_1				204
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
