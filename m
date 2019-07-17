From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Date: Wed, 17 Jul 2019 16:02:20 +0530
Message-ID: <20190717103220.f7cys267hq23fbsb@vireshk-i7>
References: <20190703011020.151615-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703011020.151615-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02-07-19, 18:10, Saravana Kannan wrote:
> Interconnects and interconnect paths quantify their performance levels in
> terms of bandwidth and not in terms of frequency. So similar to how we have
> frequency based OPP tables in DT and in the OPP framework, we need
> bandwidth OPP table support in the OPP framework and in DT. Since there can
> be more than one interconnect path used by a device, we also need a way to
> assign a bandwidth OPP table to an interconnect path.
> 
> This patch series:
> - Adds opp-peak-KBps and opp-avg-KBps properties to OPP DT bindings
> - Adds interconnect-opp-table property to interconnect DT bindings
> - Adds OPP helper functions for bandwidth OPP tables
> - Adds icc_get_opp_table() to get the OPP table for an interconnect path
> 
> So with the DT bindings added in this patch series, the DT for a GPU
> that does bandwidth voting from GPU to Cache and GPU to DDR would look
> something like this:
> 
> gpu_cache_opp_table: gpu_cache_opp_table {
> 	compatible = "operating-points-v2";
> 
> 	gpu_cache_3000: opp-3000 {
> 		opp-peak-KBps = <3000>;
> 		opp-avg-KBps = <1000>;
> 	};
> 	gpu_cache_6000: opp-6000 {
> 		opp-peak-KBps = <6000>;
> 		opp-avg-KBps = <2000>;
> 	};
> 	gpu_cache_9000: opp-9000 {
> 		opp-peak-KBps = <9000>;
> 		opp-avg-KBps = <9000>;
> 	};
> };
> 
> gpu_ddr_opp_table: gpu_ddr_opp_table {
> 	compatible = "operating-points-v2";
> 
> 	gpu_ddr_1525: opp-1525 {
> 		opp-peak-KBps = <1525>;
> 		opp-avg-KBps = <452>;
> 	};
> 	gpu_ddr_3051: opp-3051 {
> 		opp-peak-KBps = <3051>;
> 		opp-avg-KBps = <915>;
> 	};
> 	gpu_ddr_7500: opp-7500 {
> 		opp-peak-KBps = <7500>;
> 		opp-avg-KBps = <3000>;
> 	};
> };

Who is going to use the above tables and how ? These are the maximum
BW available over these paths, right ?

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

Shouldn't this link back to the above tables via required-opp, etc ?
How will we know how much BW is required by the GPU device for all the
paths ?

> gpu@7864000 {
> 	...
> 	operating-points-v2 = <&gpu_opp_table>, <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>;
> 	interconnects = <&mmnoc MASTER_GPU_1 &bimc SLAVE_SYSTEM_CACHE>,
> 			<&mmnoc MASTER_GPU_1 &bimc SLAVE_DDR>;
> 	interconnect-names = "gpu-cache", "gpu-mem";
> 	interconnect-opp-table = <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>
> };

-- 
viresh
