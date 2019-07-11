From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 08/14] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date: Thu, 11 Jul 2019 08:16:31 -0700
Message-ID: <20190711151631.GI7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-9-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-9-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
> to keep the software model of the clock in line with reality, the
> framework transverses the clock tree and disables those clocks that
> were enabled by the firmware but have not been enabled by any device
> driver.
> 
> If CPUFREQ is enabled, early during the system boot, it might attempt
> to change the CPU frequency ("set_rate"). If the HFPLL is selected as
> a provider, it will then change the rate for this clock.
> 
> As boot continues, clk_disable_unused_subtree will run. Since it wont
> find a valid counter (enable_count) for a clock that is actually
> enabled it will attempt to disable it which will cause the CPU to
> stop.

But if CPUfreq has acquired the CPU clock and the hfpll is the currently
selected input, why does the clock framework not know about this clock
being used?

> Notice that in this driver, calls to check whether the clock is
> enabled are routed via the is_enabled callback which queries the
> hardware.
> 
> The following commit, rather than marking the clock critical and
> forcing the clock to be always enabled, addresses the above scenario
> making sure the clock is not disabled but it continues to rely on the
> firmware to enable the clock.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>


I can see that we have a real issue in the case where CPUfreq is not
enabled and hence there are no clients, according to Linux. And that I
don't know another way to guard against.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/hfpll.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index 0ffed0d41c50..d5fd27938e7b 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -58,6 +58,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  		.parent_names = (const char *[]){ "xo" },
>  		.num_parents = 1,
>  		.ops = &clk_ops_hfpll,
> +		/*
> +		 * rather than marking the clock critical and forcing the clock
> +		 * to be always enabled, we make sure that the clock is not
> +		 * disabled: the firmware remains responsible of enabling this
> +		 * clock (for more info check the commit log)
> +		 */
> +		.flags = CLK_IGNORE_UNUSED,
>  	};
>  
>  	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
> -- 
> 2.21.0
> 
