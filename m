From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [v4, 2/8] cpufreq: mediatek: add clock enable for intermediate
 clock
Date: Mon, 19 Aug 2019 15:20:02 +0530
Message-ID: <20190819095002.ncpzxzahzqfvsjba@vireshk-i7>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1565703113-31479-3-git-send-email-andrew-sh.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565703113-31479-3-git-send-email-andrew-sh.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, fan.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 13-08-19, 21:31, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Intermediate clock is not always enabled by ccf in different projects,
> so cpufreq should always enable it by itself.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index a370577ffc73..acd9539e95de 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -368,13 +368,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  		goto out_free_resources;
>  	}
>  
> +	ret = clk_prepare_enable(inter_clk);
> +	if (ret)
> +		goto out_free_opp_table;
> +
>  	/* Search a safe voltage for intermediate frequency. */
>  	rate = clk_get_rate(inter_clk);
>  	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
>  	if (IS_ERR(opp)) {
>  		pr_err("failed to get intermediate opp for cpu%d\n", cpu);
>  		ret = PTR_ERR(opp);
> -		goto out_free_opp_table;
> +		goto out_disable_clock;
>  	}
>  	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
> @@ -393,6 +397,9 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  
>  	return 0;
>  
> +out_disable_clock:
> +	clk_disable_unprepare(inter_clk);
> +
>  out_free_opp_table:
>  	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
>  
> @@ -419,6 +426,10 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
>  		clk_put(info->cpu_clk);
>  	if (!IS_ERR(info->inter_clk))
>  		clk_put(info->inter_clk);

Shouldn't you remove this part now ?

> +	if (!IS_ERR(info->inter_clk)) {
> +		clk_disable_unprepare(info->inter_clk);
> +		clk_put(info->inter_clk);
> +	}
>  
>  	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
>  }
> -- 
> 2.12.5

-- 
viresh
