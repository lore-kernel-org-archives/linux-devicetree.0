From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/7] Add powerdomain driver for corners on msm8996
Date: Fri, 16 Mar 2018 09:38:17 +0530
Message-ID: <20180316040824.21472-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

With performance state support for genpd merged, and with some more
patches to add support for them in the OPP layer [1] under discussion,
this is an effort to model a powerdomain driver to communicate corner/level
values for qualcomm platforms to RPM (Remote Power Manager)

This series adds data specific to msm8996 and is tested on the
db820c. We also modify mmc as one of the first devices to move to
using an OPP table and vote on corners using the performance state
infrastructure.

[1] https://lwn.net/Articles/742136/

Rajendra Nayak (6):
  soc: qcom: rpmpd: Add a powerdomain driver to model corners
  dt-bindings: opp: Introduce qcom-opp bindings
  soc: qcom: rpmpd: Add support for get/set performance state
  arm64: dts: msm8996: Add rpmpd device node
  mmc: sdhci-msm: Adapt the driver to use OPPs to set clocks/performance
    state
  soc: qcom: rpmpd: Add a max vote on all corners at init

Viresh Kumar (1):
  PM / OPP: Add dev_pm_opp_get_of_node()

 Documentation/devicetree/bindings/opp/qcom-opp.txt |  25 ++
 .../devicetree/bindings/power/qcom,rpmpd.txt       |  14 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  87 +++++
 drivers/clk/qcom/gcc-msm8996.c                     |   8 +-
 drivers/mmc/host/sdhci-msm.c                       |  57 +++-
 drivers/opp/of.c                                   |  19 ++
 drivers/soc/qcom/Kconfig                           |   9 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/rpmpd.c                           | 350 +++++++++++++++++++++
 include/linux/pm_opp.h                             |   5 +
 10 files changed, 561 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 drivers/soc/qcom/rpmpd.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
