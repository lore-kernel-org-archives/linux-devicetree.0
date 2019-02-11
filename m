From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 2/2] clk: mediatek: correct cpu clock name for MT8173
 SoC
Date: Mon, 11 Feb 2019 10:04:32 +0100
Message-ID: <d8cf1ad8-aba1-ce9b-51fd-502cf4bed0f2@gmail.com>
References: <20190211071555.31430-1-seiya.wang@mediatek.com>
 <20190211071555.31430-2-seiya.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211071555.31430-2-seiya.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/02/2019 08:15, Seiya Wang wrote:
> Change cpu clock name from ca57 to ca72 since MT8173 does use cortex-a72.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/clk/mediatek/clk-mt8173.c      | 4 ++--
>  include/dt-bindings/clock/mt8173-clk.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 96c292c3e440..deedeb3ea33b 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -533,7 +533,7 @@ static const char * const ca53_parents[] __initconst = {
>  	"univpll"
>  };
>  
> -static const char * const ca57_parents[] __initconst = {
> +static const char * const ca72_parents[] __initconst = {
>  	"clk26m",
>  	"armca15pll",
>  	"mainpll",
> @@ -542,7 +542,7 @@ static const char * const ca57_parents[] __initconst = {
>  
>  static const struct mtk_composite cpu_muxes[] __initconst = {
>  	MUX(CLK_INFRA_CA53SEL, "infra_ca53_sel", ca53_parents, 0x0000, 0, 2),
> -	MUX(CLK_INFRA_CA57SEL, "infra_ca57_sel", ca57_parents, 0x0000, 2, 2),
> +	MUX(CLK_INFRA_CA72SEL, "infra_ca72_sel", ca72_parents, 0x0000, 2, 2),
>  };
>  
>  static const struct mtk_composite top_muxes[] __initconst = {
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
> index 8aea623dd518..f7e5356fd602 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -194,7 +194,7 @@
>  #define CLK_INFRA_PMICWRAP		11
>  #define CLK_INFRA_CLK_13M		12
>  #define CLK_INFRA_CA53SEL               13
> -#define CLK_INFRA_CA57SEL               14
> +#define CLK_INFRA_CA72SEL               14
>  #define CLK_INFRA_NR_CLK                15
>  
>  /* PERI_SYS */
> 
