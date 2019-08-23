From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFCv4 0/7] interconnect: Add imx support via devfreq
Date: Fri, 23 Aug 2019 17:36:53 +0300
Message-ID: <cover.1566570260.git.leonard.crestez@nxp.com>
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
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

This series add imx support for interconnect via devfreq: the ICC
framework is used to aggregate requests from devices and then those are
converted to DEV_PM_QOS_MIN_FREQUENCY requests for devfreq.

The devfreq parts are posted separately, this series only intersects in
devicetree: https://patchwork.kernel.org/cover/11104113/

Since there is no single devicetree node that can represent the "interconnect"
new API is added to allow individual devfreq nodes to act as parsing proxies
all mapping to a single soc-level icc provider. This is still RFC
because this

The rest of the changes are small and deal with review comments.

Changes since RFCv3:
* Remove the virtual "icc" node and add devfreq nodes as proxy providers
* Fix build on 32-bit arm (reported by kbuilt test robot)
* Remove ARCH_MXC_ARM64 (never existed in upstream)
* Remove _numlinks, calculate instead
* Replace __BUSFREQ_H header guard
* Improve commit message and comment spelling
* Fix checkpatch issues
Link to RFCv3: https://patchwork.kernel.org/cover/11078671/

Changes since RFCv2 and initial work by Alexandre Bailon:
* Relying on devfreq and dev_pm_qos instead of CLK
* No more "platform opp" stuff
* No more special suspend handling: use suspend-opp on devfreq instead.
* Replace all mentions of "busfreq" with "interconnect"
Link to v2: https://patchwork.kernel.org/patch/11056789/

Leonard Crestez (7):
  PM / devfreq: Add devfreq_get_devfreq_by_node
  interconnect: Add of_icc_add_proxy
  dt-bindings: devfreq: imx: Describe interconnect properties
  interconnect: Add imx core driver
  interconnect: imx: Add platform driver for imx8mm
  soc: imx8mm: Register interconnect platform device
  arm64: dts: imx8mm: Add interconnect properties

 .../devicetree/bindings/devfreq/imx-ddrc.yaml |   5 +
 .../devicetree/bindings/devfreq/imx.yaml      |   5 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |   5 +
 drivers/devfreq/devfreq.c                     |  42 ++-
 drivers/interconnect/Kconfig                  |   1 +
 drivers/interconnect/Makefile                 |   1 +
 drivers/interconnect/core.c                   |  88 +++++-
 drivers/interconnect/imx/Kconfig              |   9 +
 drivers/interconnect/imx/Makefile             |   2 +
 drivers/interconnect/imx/imx.c                | 279 ++++++++++++++++++
 drivers/interconnect/imx/imx.h                |  60 ++++
 drivers/interconnect/imx/imx8mm.c             | 105 +++++++
 drivers/soc/imx/soc-imx8.c                    |   4 +
 include/dt-bindings/interconnect/imx8mm.h     |  49 +++
 include/linux/devfreq.h                       |   1 +
 include/linux/interconnect-provider.h         |   7 +
 16 files changed, 645 insertions(+), 18 deletions(-)
 create mode 100644 drivers/interconnect/imx/Kconfig
 create mode 100644 drivers/interconnect/imx/Makefile
 create mode 100644 drivers/interconnect/imx/imx.c
 create mode 100644 drivers/interconnect/imx/imx.h
 create mode 100644 drivers/interconnect/imx/imx8mm.c
 create mode 100644 include/dt-bindings/interconnect/imx8mm.h

-- 
2.17.1
