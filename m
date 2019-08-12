From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 0/7] PM / devfreq: Add initial imx support
Date: Mon, 12 Aug 2019 21:49:44 +0300
Message-ID: <cover.1565633880.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <Anson.Huang@nxp.com>, linux-arm-kernel@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org, linux-imx@nxp.com, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Will Deacon <will@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>
List-Id: devicetree@vger.kernel.org

This adds devfreq support for imx8mm, covering dynamic scaling of
internal NOC and DDR Controller

Scaling for simple busses (NIC/NOC) is done through the clk framework
while DRAM scaling is performed in firmware with an "imx-ddrc" wrapper
for devfreq.

Changes since RFCv3:
 * Implement passive support and set NOC parent to DDRC
 * Drop scaling AHB/AXI for now (NOC/DDRC use most power anyway)
 * Split into two devreq drivers (and bindings) because the ddrc is
really a distinct piece of hardware.
 * Stop relying on clk_min_rate
 * Fetch info about dram clk parents from firmware instead of
hardcoding in driver. This can more easily support additional rates.
 * Perform DRAM frequency inside devfreq instead of clk, mostly due to
objections to earlier RFCs for "imx8m-dram-clk"
 * Link: https://patchwork.kernel.org/cover/11056779/
 * Link: https://patchwork.kernel.org/patch/11049429/

Stephen: It would be very helpful if you could comment on the dram
frequency switching code. I moved it outside of clk but now I have to
use provider APIs outside of drivers/clk for parent manipulation. Few
other drivers do that so maybe it's OK?

Scaling buses can cause problems for devices with realtime bandwith
requirements such as display, the intention is to use the interconnect
framework to make DEV_PM_QOS_MIN_FREQUENCY to devfreq. There are
separate patches for that:

 * https://patchwork.kernel.org/patch/11084279/
 * https://patchwork.kernel.org/cover/11078671/

Leonard Crestez (7):
  clk: imx8m: Set CLK_GET_RATE_NOCACHE on dram_alt/apb
  dt-bindings: devfreq: Add bindings for generic imx buses
  PM / devfreq: Add generic imx bus driver
  dt-bindings: devfreq: Add bindings for imx ddr controller
  PM / devfreq: Add dynamic scaling for imx ddr controller
  PM / devfreq: imx-ddrc: Measure bandwidth with perf
  arm64: dts: imx8mm: Add devfreq nodes

 .../devicetree/bindings/devfreq/imx-ddrc.yaml |  53 ++
 .../devicetree/bindings/devfreq/imx.yaml      |  50 ++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  51 +-
 drivers/clk/imx/clk-imx8mm.c                  |   6 +-
 drivers/clk/imx/clk-imx8mn.c                  |   6 +-
 drivers/clk/imx/clk-imx8mq.c                  |   7 +-
 drivers/devfreq/Kconfig                       |  12 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/imx-ddrc.c                    | 511 ++++++++++++++++++
 drivers/devfreq/imx-devfreq.c                 | 148 +++++
 10 files changed, 837 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
 create mode 100644 Documentation/devicetree/bindings/devfreq/imx.yaml
 create mode 100644 drivers/devfreq/imx-ddrc.c
 create mode 100644 drivers/devfreq/imx-devfreq.c

-- 
2.17.1
