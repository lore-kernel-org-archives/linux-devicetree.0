From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 0/6] Add power domain driver for corners on msm8996/sdm845
Date: Wed, 27 Jun 2018 10:22:28 +0530
Message-ID: <20180627045234.27403-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Changes in v4:
* Included the patch to add qcom-opp bindings (dropped accidentally in v3)
* merged the patches to add bindings for rpm and rpmh, added consumer binding example
* Made the drivers built in, removed .remove
* Added better description in changelog for PATCH 6/6
* Updated rpmhpd_aggregate_corner() based on Davids feedback
* rpmhpd_set_performance_state() returns max corner, in cases where its called
with an INT_MAX
* Dropped the patch to max vote on all corners at init, the patch did not
work anyway, and it shouldn't be needed now

Changes in v3:
* Bindings split into seperate patches
* Bindings updated to remove duplicate OPP table phandles
* DT headers defining macros for Power domain indexes and OPP levels
* Optimisations to use rpmh_write_async() whereever applicable
* Fixed up handling of ACTIVE_ONLY/WAKE_ONLY/SLEEP voting for RPMh
* Fixed the vlvl to hlvl conversions in set_performance
* Other minor fixes based on review of v2
* TODO: This series does not handle the case where all VDD_MX votes
should be higher than VDD_CX from APPs, as pointed out
by David Collins in v2. This needs support at genpd to propogate performance
state up the parents, if we model these as Parent/Child to handle the
interdependency.

Changes in v2:
* added a power domain driver for sdm845 which supports communicating to RPMh
* dropped the changes to sdhc driver to move over to using OPP
as there is active discussion on using OPP as the interface vs
handling all of it in clock drivers
* Other minor binding updates based on review of v1

With performance state support for genpd/OPP merged, this is an effort
to model a power domain driver to communicate corner/level
values for qualcomm platforms to RPM (Remote Power Manager) and RPMh.

Rajendra Nayak (6):
  dt-bindings: opp: Introduce qcom-opp bindings
  dt-bindings: power: Add qcom rpm power domain driver bindings
  soc: qcom: rpmpd: Add a Power domain driver to model corners
  soc: qcom: rpmpd: Add support for get/set performance state
  arm64: dts: msm8996: Add rpmpd device node
  soc: qcom: rpmhpd: Add RPMh Power domain driver

 .../devicetree/bindings/opp/qcom-opp.txt      |  25 ++
 .../devicetree/bindings/power/qcom,rpmpd.txt  | 146 +++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  34 ++
 drivers/soc/qcom/Kconfig                      |  18 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/rpmhpd.c                     | 406 ++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                      | 340 +++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  39 ++
 8 files changed, 1010 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 drivers/soc/qcom/rpmhpd.c
 create mode 100644 drivers/soc/qcom/rpmpd.c
 create mode 100644 include/dt-bindings/power/qcom-rpmpd.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
