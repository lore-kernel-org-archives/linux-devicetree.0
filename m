From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFCv2 0/3] PM / devfreq: Add imx driver
Date: Wed, 24 Jul 2019 15:38:43 +0300
Message-ID: <cover.1563971855.git.leonard.crestez@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Jacky Bai <ping.bai@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Georgi Djakov <georgi.djakov@linaro.org>, Alexandre Bailon <abailon@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Frank Li <Frank.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series attempts to add devfreq support for imx8mm, covering dynamic
scaling of internal buses and dram.

Actual scaling is performed through the clk framework: The NOC and main
NICs are driven by composite clks and a new 'imx8m-dram' clk is used for
scaling dram using firmware calls.

Frequency target is set via "clk_set_min_rate", this allows an unrelated
subsystem (for example interconnect) to also request minimum rates as a
form for proactive scaling.

The dram controller (DDRC) has a performance monitoring block attached
for which a perf driver already exists. Instead of reimplementing that
as devfreq-events the perf in-kernel API is used.

Changes since v2:
* Solve review comments
* Add yaml binding doc
* Add perf event support
Link to v2: https://patchwork.kernel.org/patch/11021571/

DRAM frequency switching through clk framework is here:
* https://patchwork.kernel.org/patch/11049429/
That part might not be accepted in clk and it might have to be moved to
devfreq also.

Leonard Crestez (3):
  dt-bindings: devfreq: Add initial bindings for i.MX
  PM / devfreq: Add imx driver
  PM / devfreq: Add imx perf event support

 .../devicetree/bindings/devfreq/imx.yaml      |  59 ++++
 drivers/devfreq/Kconfig                       |  10 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/imx-devfreq.c                 | 278 ++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/imx.yaml
 create mode 100644 drivers/devfreq/imx-devfreq.c

-- 
2.17.1
