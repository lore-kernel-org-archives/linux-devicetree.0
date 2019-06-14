From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 00/11] Introduce Bandwidth OPPs & interconnect devfreq driver
Date: Thu, 13 Jun 2019 21:17:22 -0700
Message-ID: <20190614041733.120807-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I replied[1] to this patch series[2] and described how I think interconnect
bandwidth voting should be captured in DT and how it should work.

So sending out a patch series implementing that. This patch series does the
following:
- Allow required-opps to point to any device's OPP
- Add support to devfreq passive governor to look at the "parent"
  devfreq's required-opps to decide the "slave" device's frequency
- Adds Bandwidth OPP table support
- Adds a devfreq library for interconnect paths

Interconnects and interconnect paths quantify they performance levels in
terms of bandwidth. So similar to how we have frequency based OPP tables
in DT and in the OPP framework, this patch series adds bandwidth OPP
table support in the OPP framework and in DT.

To simplify voting for interconnects, this patch series adds helper
functions to create devfreq devices out of interconnect paths. This
allows drivers to add a single line of code to add interconnect voting
capability.

To add devfreq device for the "gpu-mem" interconnect path and use
required OPPs to do decide gpu-mem bandwidth:
icc_create_devfreq(dev, "gpu-mem", gpu_devfreq);

To add devfreq device for the "gpu-mem" interconnect path and use some
other governor to device gpu-mem bandwidth:
icc_create_devfreq(dev, "gpu-mem", NULL);

So with the DT bindings added in this patch series, the DT for a GPU
that does bandwidth voting from GPU to Cache and GPU to DDR would look
something like this:

gpu_cache_opp_table: gpu_cache_opp_table {
	compatible = "operating-points-v2";

	gpu_cache_3000: opp-3000 {
		opp-peak-KBps = <3000>;
		opp-avg-KBps = <1000>;
	};
	gpu_cache_6000: opp-6000 {
		opp-peak-KBps = <6000>;
		opp-avg-KBps = <2000>;
	};
	gpu_cache_9000: opp-9000 {
		opp-peak-KBps = <9000>;
		opp-avg-KBps = <9000>;
	};
};

gpu_ddr_opp_table: gpu_ddr_opp_table {
	compatible = "operating-points-v2";

	gpu_ddr_1525: opp-1525 {
		opp-peak-KBps = <1525>;
		opp-avg-KBps = <452>;
	};
	gpu_ddr_3051: opp-3051 {
		opp-peak-KBps = <3051>;
		opp-avg-KBps = <915>;
	};
	gpu_ddr_7500: opp-7500 {
		opp-peak-KBps = <7500>;
		opp-avg-KBps = <3000>;
	};
};

gpu_opp_table: gpu_opp_table {
	compatible = "operating-points-v2";
	opp-shared;

	opp-200000000 {
		opp-hz = /bits/ 64 <200000000>;
		required-opps = <&gpu_cache_3000>, <&gpu_ddr_1525>;
	};
	opp-400000000 {
		opp-hz = /bits/ 64 <400000000>;
		required-opps = <&gpu_cache_6000>, <&gpu_ddr_3051>;
	};
};

gpu@7864000 {
	...
	operating-points-v2 = <&gpu_opp_table>, <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>;
	interconnects = <&mmnoc MASTER_GPU_1 &bimc SLAVE_SYSTEL_CACHE>,
			<&mmnoc MASTER_GPU_1 &bimc SLAVE_DDR>;
	interconnect-names = "gpu-cache", "gpu-mem";
	interconnect-opp-table = <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>
};

Cheers,
Saravana

[1] - https://lore.kernel.org/lkml/20190601021228.210574-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20190423132823.7915-1-georgi.djakov@linaro.org/ 


Saravana Kannan (11):
  OPP: Allow required-opps even if the device doesn't have power-domains
  OPP: Add function to look up required OPP's for a given OPP
  PM / devfreq: Add required OPPs support to passive governor
  dt-bindings: opp: Introduce opp-peak-KBps and opp-avg-KBps bindings
  OPP: Add support for bandwidth OPP tables
  OPP: Add helper function for bandwidth OPP tables
  OPP: Add API to find an OPP table from its DT node
  dt-bindings: interconnect: Add interconnect-opp-table property
  interconnect: Add OPP table support for interconnects
  OPP: Allow copying OPPs tables between devices
  interconnect: Add devfreq support

 .../bindings/interconnect/interconnect.txt    |   8 +
 Documentation/devicetree/bindings/opp/opp.txt |  15 +-
 drivers/devfreq/governor_passive.c            |  25 ++-
 drivers/interconnect/Makefile                 |   2 +-
 drivers/interconnect/core.c                   |  27 ++-
 drivers/interconnect/icc-devfreq.c            | 156 ++++++++++++++++++
 drivers/opp/core.c                            | 115 ++++++++++++-
 drivers/opp/of.c                              |  90 +++++++---
 drivers/opp/opp.h                             |   4 +-
 include/linux/interconnect.h                  |  21 +++
 include/linux/pm_opp.h                        |  44 +++++
 11 files changed, 474 insertions(+), 33 deletions(-)
 create mode 100644 drivers/interconnect/icc-devfreq.c

-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
