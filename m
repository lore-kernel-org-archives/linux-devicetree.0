From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 08/13] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date: Thu, 17 Jan 2019 09:38:16 +0100
Message-ID: <9abbe59b-433c-4e30-1e4d-b5eed3afc695@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-9-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190117063312.GE25498@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117063312.GE25498@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/17/19 07:33, Bjorn Andersson wrote:
> On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:
> 
>> When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
>> to keep the software model of the clock in line with reality, the
>> framework transverses the clock tree and disables those clocks that
>> were enabled by the firmware but have not been enabled by any device
>> driver.
>>
>> If CPUFREQ is enabled, early during the system boot, it might attempt
>> to change the CPU frequency ("set_rate"). If the HFPLL is selected as
>> a provider, it will then change the rate for this clock.
>>
>> As boot continues, clk_disable_unused_subtree will run. Since it wont
>> find a valid counter (enable_count) for a clock that is actually
>> enabled it will attempt to disable it which will cause the CPU to
>> stop. Notice that in this driver, calls to check whether the clock is
>> enabled are routed via the is_enabled callback which queries the
>> hardware.
>>
> 
> With the CPUFREQ referencing the CPU clock driver, that has decided to
> run off this clock, why is it not refcounted?

COMMON_CLK_DISABLED_UNUSED relies on the enable_count reference counter
to disable the clocks that were enabled by the firwmare and not by the
drivers.

the cpufreq driver does not enable the cpu clock.

so when clk_change_rate is called, the enable_count counter is not
incremented and therefore it just remains null since this was enabled by
the firmware.

I tried doing:

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index e58bfcb..5a9f83e 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -124,6 +124,10 @@ static int resources_available(void)
                return ret;
        }

+ ret = clk_prepare_enable(cpu_clk);
+ if (ret)
+         return ret;
+
        clk_put(cpu_clk);

        name = find_supply_name(cpu_dev);


and that removed the need for CLK_IGNORE_UNUSED. But I am not sure of
the system wide consequences of that change to cpufreq.

maybe Viresh can comment?

> 
> Regards,
> Bjorn
> 
>> The following commit, rather than marking the clock critical and
>> forcing the clock to be always enabled, addresses the above scenario
>> making sure the clock is not disabled but it continues to rely on the
>> firmware to enable the clock.
>>
>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  drivers/clk/qcom/hfpll.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
>> index 0ffed0d..9d92f5d 100644
>> --- a/drivers/clk/qcom/hfpll.c
>> +++ b/drivers/clk/qcom/hfpll.c
>> @@ -58,6 +58,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>>  		.parent_names = (const char *[]){ "xo" },
>>  		.num_parents = 1,
>>  		.ops = &clk_ops_hfpll,
>> +		.flags = CLK_IGNORE_UNUSED,
>>  	};
>>  
>>  	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
>> -- 
>> 2.7.4
>>
> 
