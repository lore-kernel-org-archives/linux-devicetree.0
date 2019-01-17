From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 08/13] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date: Thu, 17 Jan 2019 15:38:07 +0530
Message-ID: <20190117100807.pmew5iqisdcc63eq@vireshk-i7>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-9-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190117063312.GE25498@builder>
 <9abbe59b-433c-4e30-1e4d-b5eed3afc695@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9abbe59b-433c-4e30-1e4d-b5eed3afc695@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17-01-19, 09:38, Jorge Ramirez wrote:
> COMMON_CLK_DISABLED_UNUSED relies on the enable_count reference counter
> to disable the clocks that were enabled by the firwmare and not by the
> drivers.
> 
> the cpufreq driver does not enable the cpu clock.
> 
> so when clk_change_rate is called, the enable_count counter is not
> incremented and therefore it just remains null since this was enabled by
> the firmware.
> 
> I tried doing:
> 
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index e58bfcb..5a9f83e 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -124,6 +124,10 @@ static int resources_available(void)
>                 return ret;
>         }
> 
> + ret = clk_prepare_enable(cpu_clk);
> + if (ret)
> +         return ret;
> +
>         clk_put(cpu_clk);
> 
>         name = find_supply_name(cpu_dev);
> 
> 
> and that removed the need for CLK_IGNORE_UNUSED. But I am not sure of
> the system wide consequences of that change to cpufreq.

If the cpufreq driver enables it then it should disable it on exit as
well, right ? And in that case if you unload your driver's module, you
will hang the system as the clock will get disabled :)

Every other platform must either be marking it with CLK_IGNORE_UNUSED
or they must be doing clk_enable from somewhere, maybe the CPU online
path, not sure though.

-- 
viresh
