From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Thu, 10 Jan 2019 10:42:41 -0800
Message-ID: <20190110184241.GY261387@google.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <20190110022217.GX261387@google.com>
 <20190110062359.aea3tic5aw3iuocr@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110062359.aea3tic5aw3iuocr@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 11:53:59AM +0530, Viresh Kumar wrote:
> On 09-01-19, 18:22, Matthias Kaehlcke wrote:
> > Hi Amit,
> > 
> > On Thu, Jan 10, 2019 at 05:30:56AM +0530, Amit Kucheria wrote:
> > > Since the big and little cpus are in the same frequency domain, use all
> > > of them for mitigation in the cooling-map. At the lower trip points we
> > > restrict ourselves to throttling only a few OPPs. At higher trip
> > > temperatures, allow ourselves to be throttled to any extent.
> > > 
> > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 145 +++++++++++++++++++++++++++
> > >  1 file changed, 145 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 29e823b0caf4..cd6402a9aa64 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -13,6 +13,7 @@
> > >  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> > >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > >  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > > +#include <dt-bindings/thermal/thermal.h>
> > >  
> > >  / {
> > >  	interrupt-parent = <&intc>;
> > > @@ -99,6 +100,7 @@
> > >  			compatible = "qcom,kryo385";
> > >  			reg = <0x0 0x0>;
> > >  			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > >  			next-level-cache = <&L2_0>;
> > >  			L2_0: l2-cache {
> > >  				compatible = "cache";
> > > @@ -114,6 +116,7 @@
> > >  			compatible = "qcom,kryo385";
> > >  			reg = <0x0 0x100>;
> > >  			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > 
> > This is not needed (also applies to other for other non-policy
> > cores). A single cpufreq device is created per frequency domain /
> > cluster, hence a single cooling device is registered per cluster,
> > which IMO makes sense given that the CPUs of a cluster can't change
> > their frequencies independently.
>  
> > As per above, there are no cooling devices for CPU1-3 and CPU5-7.
> 
> lore.kernel.org/lkml/cover.1527244200.git.viresh.kumar@linaro.org
> lore.kernel.org/lkml/b687bb6035fbb010383f4511a206abb4006679fa.1527244201.git.viresh.kumar@linaro.org

Thanks for the pointer, there's always something new to learn!

Ok, so the policy CPU and hence the CPU registered as cooling
device may vary. I understand that this requires to list all possible
cooling devices, even though only one will be active at any given
time. However I wonder if we could change this:


>From 103703a46495ff210a521b5b6fbf32632053c64f Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka@chromium.org>
Date: Thu, 10 Jan 2019 09:48:38 -0800
Subject: [PATCH] thermal: cpu_cooling: always use first CPU of a freq domain
 as cooling device

For all CPUs of a frequency domain a single cooling device is
registered, since the CPUs can't switch their frequencies
independently from each other. The cpufreq policy CPU is used to
represent cooling device of the frequency domain. Which CPU is the
policy CPU may vary based on the order of initialization or CPU
hotplug.

For device tree based platform the above implies that cooling maps
must include a list of all possible cooling devices of a frequency
domain, even though only one of them will exist at any given time.

For example:

cooling-maps {
	map0 {
		trip = <&cpu_alert0>;
		cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
				 <&CPU1 THERMAL_NO_LIMIT 4>,
				 <&CPU2 THERMAL_NO_LIMIT 4>,
				 <&CPU3 THERMAL_NO_LIMIT 4>;
	};
	map1 {
		trip = <&cpu_crit0>;
		cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
				 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
				 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
				 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
	};
};

This can be avoided by using always the first CPU of a frequency
domain as cooling device. It may happen that the first CPU is offline
when the cooling device is registered (e.g. CPU2 is initialized
first in the above example), hence the nominal cooling device might
be offline. This may seem odd, however it is not really different from
the current behavior: when the policy CPU is taking offline the cooling
device corresponding to it remains active, unless it is unregistered
because all other CPUs of the frequency domain are offline too.

A single cooling device associated with a specific CPU of the frequency
domain reduces redundant device tree clutter in CPU nodes and cooling
maps.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/thermal/cpu_cooling.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cooling.c
index dfd23245f778a..bb5ea06f893a2 100644
--- a/drivers/thermal/cpu_cooling.c
+++ b/drivers/thermal/cpu_cooling.c
@@ -758,13 +758,14 @@ EXPORT_SYMBOL_GPL(cpufreq_cooling_register);
 struct thermal_cooling_device *
 of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 {
-	struct device_node *np = of_get_cpu_node(policy->cpu, NULL);
+	unsigned int first_cpu = cpumask_first(policy->related_cpus);
+	struct device_node *np = of_get_cpu_node(first_cpu, NULL);
 	struct thermal_cooling_device *cdev = NULL;
 	u32 capacitance = 0;
 
 	if (!np) {
 		pr_err("cpu_cooling: OF node not available for cpu%d\n",
-		       policy->cpu);
+		       first_cpu);
 		return NULL;
 	}
 
@@ -775,7 +776,7 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 		cdev = __cpufreq_cooling_register(np, policy, capacitance);
 		if (IS_ERR(cdev)) {
 			pr_err("cpu_cooling: cpu%d is not running as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			       first_cpu, PTR_ERR(cdev));
 			cdev = NULL;
 		}
 	}


Would that make sense or is there something I'm overlooking?

Cheers

Matthias
