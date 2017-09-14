From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1 2/3] cpufreq: rockchip: add support for rk3328 soc
Date: Thu, 14 Sep 2017 14:24:37 -0700
Message-ID: <20170914212437.GC11836@ubuntu>
References: <1503477632-9661-1-git-send-email-cl@rock-chips.com>
 <1503477632-9661-3-git-send-email-cl@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503477632-9661-3-git-send-email-cl@rock-chips.com>
Sender: linux-pm-owner@vger.kernel.org
To: cl@rock-chips.com
Cc: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, rocky.hao@rock-chips.com, afaerber@suse.de, fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com, kever.yang@rock-chips.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23-08-17, 16:40, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Add compatible rockchip,rk3328 to the machines table to
> launch cpufreq-dt driver for rk3328 soc.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 1c26292..f16c3ba 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -76,6 +76,7 @@
>  	{ .compatible = "rockchip,rk3188", },
>  	{ .compatible = "rockchip,rk3228", },
>  	{ .compatible = "rockchip,rk3288", },
> +	{ .compatible = "rockchip,rk3328", },
>  	{ .compatible = "rockchip,rk3366", },
>  	{ .compatible = "rockchip,rk3368", },
>  	{ .compatible = "rockchip,rk3399", },

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
