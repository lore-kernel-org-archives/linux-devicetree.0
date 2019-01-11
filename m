From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Fri, 11 Jan 2019 09:16:53 +0530
Message-ID: <20190111034653.6dstox4c6hpjum4f@vireshk-i7>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <20190110022217.GX261387@google.com>
 <20190110062359.aea3tic5aw3iuocr@vireshk-i7>
 <20190110184241.GY261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110184241.GY261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10-01-19, 10:42, Matthias Kaehlcke wrote:
> Thanks for the pointer, there's always something new to learn!
> 
> Ok, so the policy CPU and hence the CPU registered as cooling
> device may vary. I understand that this requires to list all possible
> cooling devices,

I won't say that I changed DT because of a design issue with kernel,
rather the DT shall be complete by itself and that's why that change
was made.

And then we can have more things going on. For example with cpuidle
cooling, we can individually control each CPU (and force idle on that)
even if all CPUs are part of the same freq-domain. Each CPU shall
expose its capabilities.

> even though only one will be active at any given
> time. However I wonder if we could change this:

I won't say it that way. I see it as all the CPUs are active during a
cooling state, i.e. they are all participating.
 
> >From 103703a46495ff210a521b5b6fbf32632053c64f Mon Sep 17 00:00:00 2001
> From: Matthias Kaehlcke <mka@chromium.org>
> Date: Thu, 10 Jan 2019 09:48:38 -0800
> Subject: [PATCH] thermal: cpu_cooling: always use first CPU of a freq domain
>  as cooling device
> 
> For all CPUs of a frequency domain a single cooling device is
> registered, since the CPUs can't switch their frequencies
> independently from each other. The cpufreq policy CPU is used to
> represent cooling device of the frequency domain. Which CPU is the
> policy CPU may vary based on the order of initialization or CPU
> hotplug.
> 
> For device tree based platform the above implies that cooling maps
> must include a list of all possible cooling devices of a frequency
> domain, even though only one of them will exist at any given time.
> 
> For example:
> 
> cooling-maps {
> 	map0 {
> 		trip = <&cpu_alert0>;
> 		cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
> 				 <&CPU1 THERMAL_NO_LIMIT 4>,
> 				 <&CPU2 THERMAL_NO_LIMIT 4>,
> 				 <&CPU3 THERMAL_NO_LIMIT 4>;
> 	};
> 	map1 {
> 		trip = <&cpu_crit0>;
> 		cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> 				 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> 				 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> 				 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

This is the right thing to do hardware description wise, no matter
what the kernel does.

> 	};
> };
> 
> This can be avoided by using always the first CPU of a frequency
> domain as cooling device. It may happen that the first CPU is offline
> when the cooling device is registered (e.g. CPU2 is initialized
> first in the above example), hence the nominal cooling device might
> be offline. This may seem odd, however it is not really different from
> the current behavior: when the policy CPU is taking offline the cooling
> device corresponding to it remains active, unless it is unregistered
> because all other CPUs of the frequency domain are offline too.
> 
> A single cooling device associated with a specific CPU of the frequency
> domain reduces redundant device tree clutter in CPU nodes and cooling
> maps.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/thermal/cpu_cooling.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
> index dfd23245f778a..bb5ea06f893a2 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -758,13 +758,14 @@ EXPORT_SYMBOL_GPL(cpufreq_cooling_register);
>  struct thermal_cooling_device *
>  of_cpufreq_cooling_register(struct cpufreq_policy *policy)
>  {
> -	struct device_node *np = of_get_cpu_node(policy->cpu, NULL);
> +	unsigned int first_cpu = cpumask_first(policy->related_cpus);
> +	struct device_node *np = of_get_cpu_node(first_cpu, NULL);
>  	struct thermal_cooling_device *cdev = NULL;
>  	u32 capacitance = 0;
>  
>  	if (!np) {
>  		pr_err("cpu_cooling: OF node not available for cpu%d\n",
> -		       policy->cpu);
> +		       first_cpu);
>  		return NULL;
>  	}
>  
> @@ -775,7 +776,7 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
>  		cdev = __cpufreq_cooling_register(np, policy, capacitance);
>  		if (IS_ERR(cdev)) {
>  			pr_err("cpu_cooling: cpu%d is not running as cooling device: %ld\n",
> -			       policy->cpu, PTR_ERR(cdev));
> +			       first_cpu, PTR_ERR(cdev));
>  			cdev = NULL;
>  		}
>  	}
> 
> 
> Would that make sense or is there something I'm overlooking?

I don't see any benefits of this to be honest. Even if we make this
change, the DT should remain in its current form.

-- 
viresh
