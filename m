Return-Path: <SRS0=RElY=OA=samsung.com=cw00.choi@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Message-id: <5BF54E3A.60704@samsung.com>
Date: Wed, 21 Nov 2018 21:23:22 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
In-reply-to: <20181121120509.18892-2-k.konieczny@partner.samsung.com>
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
	<CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
	<20181121120509.18892-2-k.konieczny@partner.samsung.com>
To: Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 2018년 11월 21일 21:05, Kamil Konieczny wrote:
> Fix typo in imem sssx name and typo 200 switched with 266.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>

Looks good to me. 
But, You have to add the 'Fixes' information and then send this patch to stable mailing list.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
>  include/dt-bindings/clock/exynos5433.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 751e2c4fb65b..24c3360db65b 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>  	/* ENABLE_ACLK_TOP */
>  	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
>  			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
> -	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
> +	GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
>  			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
>  			29, CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
> @@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>  	GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
>  			ENABLE_ACLK_TOP, 25,
>  			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
> +	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
>  			ENABLE_ACLK_TOP, 24,
>  			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
> +	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
>  			ENABLE_ACLK_TOP, 23,
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
> index 98bd85ce1e45..87bb2b017143 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -156,7 +156,7 @@
>  #define CLK_ACLK_G2D_266		220
>  #define CLK_ACLK_G2D_400		221
>  #define CLK_ACLK_G3D_400		222
> -#define CLK_ACLK_IMEM_SSX_266		223
> +#define CLK_ACLK_IMEM_SSSX_266		223
>  #define CLK_ACLK_BUS0_400		224
>  #define CLK_ACLK_BUS1_400		225
>  #define CLK_ACLK_IMEM_200		226
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
