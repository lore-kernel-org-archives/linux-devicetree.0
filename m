From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 07/10] cpufreq: dt: Add support for some new Allwinner
 SoCs
Date: Mon, 24 Jul 2017 14:23:49 +0530
Message-ID: <20170724085349.GT352@vireshk-i7>
References: <20170723102749.17323-1-icenowy@aosc.io>
 <20170723102749.17323-8-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170723102749.17323-8-icenowy@aosc.io>
Sender: linux-pm-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-sunxi@googlegroups.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: devicetree@vger.kernel.org

On 23-07-17, 18:27, Icenowy Zheng wrote:
> Some new Allwinner SoCs get supported in the kernel after the
> compatibles are added to cpufreq-dt-platdev driver.
> 
> Add their compatible strings in the cpufreq-dt-platdev driver.
> 
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 2eb40d46d357..c3851453e84a 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -24,7 +24,11 @@ static const struct of_device_id machines[] __initconst = {
>  	{ .compatible = "allwinner,sun8i-a23", },
>  	{ .compatible = "allwinner,sun8i-a33", },
>  	{ .compatible = "allwinner,sun8i-a83t", },
> +	{ .compatible = "allwinner,sun8i-h2-plus", },
>  	{ .compatible = "allwinner,sun8i-h3", },
> +	{ .compatible = "allwinner,sun8i-v3s", },
> +	{ .compatible = "allwinner,sun50i-a64", },
> +	{ .compatible = "allwinner,sun50i-h5", },
>  
>  	{ .compatible = "apm,xgene-shadowcat", },
>  
> @@ -43,6 +47,8 @@ static const struct of_device_id machines[] __initconst = {
>  	{ .compatible = "marvell,pxa250", },
>  	{ .compatible = "marvell,pxa270", },
>  
> +	{ .compatible = "nextthing,gr8", },
> +
>  	{ .compatible = "samsung,exynos3250", },
>  	{ .compatible = "samsung,exynos4210", },
>  	{ .compatible = "samsung,exynos4212", },

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
