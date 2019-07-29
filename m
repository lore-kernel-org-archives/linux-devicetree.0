From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/3] Introduce Bandwidth OPPs for interconnects
Date: Mon, 29 Jul 2019 15:05:45 +0530
Message-ID: <20190729093545.kvnqxjkyx4nogddk@vireshk-i7>
References: <20190726231558.175130-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190726231558.175130-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26-07-19, 16:15, Saravana Kannan wrote:
> Interconnects and interconnect paths quantify their performance levels in
> terms of bandwidth and not in terms of frequency. So similar to how we have
> frequency based OPP tables in DT and in the OPP framework, we need
> bandwidth OPP table support in DT and in the OPP framework.
> 
> So with the DT bindings added in this patch series, the DT for a GPU
> that does bandwidth voting from GPU to Cache and GPU to DDR would look
> something like this:
> 
> gpu_cache_opp_table: gpu_cache_opp_table {
> 	compatible = "operating-points-v2";
> 
> 	gpu_cache_3000: opp-3000 {
> 		opp-peak-KBps = <3000000>;
> 		opp-avg-KBps = <1000000>;
> 	};
> 	gpu_cache_6000: opp-6000 {
> 		opp-peak-KBps = <6000000>;
> 		opp-avg-KBps = <2000000>;
> 	};
> 	gpu_cache_9000: opp-9000 {
> 		opp-peak-KBps = <9000000>;
> 		opp-avg-KBps = <9000000>;
> 	};
> };
> 
> gpu_ddr_opp_table: gpu_ddr_opp_table {
> 	compatible = "operating-points-v2";
> 
> 	gpu_ddr_1525: opp-1525 {
> 		opp-peak-KBps = <1525000>;
> 		opp-avg-KBps = <452000>;
> 	};
> 	gpu_ddr_3051: opp-3051 {
> 		opp-peak-KBps = <3051000>;
> 		opp-avg-KBps = <915000>;
> 	};
> 	gpu_ddr_7500: opp-7500 {
> 		opp-peak-KBps = <7500000>;
> 		opp-avg-KBps = <3000000>;
> 	};
> };
> 
> gpu_opp_table: gpu_opp_table {
> 	compatible = "operating-points-v2";
> 	opp-shared;
> 
> 	opp-200000000 {
> 		opp-hz = /bits/ 64 <200000000>;
> 	};
> 	opp-400000000 {
> 		opp-hz = /bits/ 64 <400000000>;
> 	};
> };
> 
> gpu@7864000 {
> 	...
> 	operating-points-v2 = <&gpu_opp_table>, <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>;
> 	...
> };

One feedback I missed giving earlier. Will it be possible to get some
user code merged along with this ? I want to make sure anything we add
ends up getting used.

That also helps understanding the problems you are facing in a better
way, i.e. with real examples.

-- 
viresh
