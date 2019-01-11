From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Fri, 11 Jan 2019 11:58:13 -0800
Message-ID: <20190111195813.GF261387@google.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <20190110022217.GX261387@google.com>
 <20190110062359.aea3tic5aw3iuocr@vireshk-i7>
 <20190110184241.GY261387@google.com>
 <20190111034653.6dstox4c6hpjum4f@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111034653.6dstox4c6hpjum4f@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 09:16:53AM +0530, Viresh Kumar wrote:
> On 10-01-19, 10:42, Matthias Kaehlcke wrote:
> > Thanks for the pointer, there's always something new to learn!
> > 
> > Ok, so the policy CPU and hence the CPU registered as cooling
> > device may vary. I understand that this requires to list all possible
> > cooling devices,
> 
> I won't say that I changed DT because of a design issue with kernel,
> rather the DT shall be complete by itself and that's why that change
> was made.

fair enough

> And then we can have more things going on. For example with cpuidle
> cooling, we can individually control each CPU (and force idle on that)
> even if all CPUs are part of the same freq-domain. Each CPU shall
> expose its capabilities.

Just to gain a better understanding: is cpuidle cooling already
available for arm64 (or is there a patch set)? I came across the
relatively new idle injecting framework but it seems currently the
only user is the Intel powerclamp driver.

> > even though only one will be active at any given
> > time. However I wonder if we could change this:
> 
> I won't say it that way. I see it as all the CPUs are active during a
> cooling state, i.e. they are all participating.

agreed, I was referring to the CPU cooling device, which (without
cpuidle injection) could be considered a single device per freq domain.

> > For device tree based platform the above implies that cooling maps
> > must include a list of all possible cooling devices of a frequency
> > domain, even though only one of them will exist at any given time.
> > 
> > For example:
> > 
> > cooling-maps {
> > 	map0 {
> > 		trip = <&cpu_alert0>;
> > 		cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
> > 				 <&CPU1 THERMAL_NO_LIMIT 4>,
> > 				 <&CPU2 THERMAL_NO_LIMIT 4>,
> > 				 <&CPU3 THERMAL_NO_LIMIT 4>;
> > 	};
> > 	map1 {
> > 		trip = <&cpu_crit0>;
> > 		cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > 				 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > 				 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > 				 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> This is the right thing to do hardware description wise, no matter
> what the kernel does.

Not sure I would call it a hardware description. I'd say we pretend
the thermal configuration is a hardware description so the DT folks
don't yell at us ;-) IMO a CPU cooling device is an abstraction, I
think there is no such IP block on most systems.

It seems with cpuidle injection CPUs can perform cooling actions
individually, with that I agree that representing them as individual
cooling devices in the DT makes sense. Without that a cooling device
per freq domain would seem a resonable abstraction.

One of the reasons I dislike the above list of cooling devices is that
it is repeated for different thermal-zone/cooling-maps, but I guess
we have to live with that, would be nice if the DT would allow to do
something like this:

thermal-zones {
	cooling_maps_fd0 : cooling-maps {
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

	cpu0-thermal {
		...
		cooling-maps = @cooling_maps_fd0;
		...
	};

	cpu1-thermal {
		...
		cooling-maps = @cooling_maps_fd0;
		...
	};

	...
};

Cheers

Matthias
