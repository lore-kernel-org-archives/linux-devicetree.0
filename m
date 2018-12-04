From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 0/8] Add power domain driver for corners on msm8996/sdm845
Date: Tue,  4 Dec 2018 10:51:11 +0530
Message-ID: <20181204052119.806-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

This series is mainly pending your review/ack for the DT parts.
Rest of the genpd parts are reviewed and acked by both Viresh
and Ulf.

Changes in v5:
* First 6 patches are unchanged
* Patch 7/8 adds the DT node for rpmh power-controller on sdm845 and the
corresponding OPP tables for it to describe the performance states
* Patch 8/8 adds a parent/child relationship across mx/cx and mx_ao/cx_ao
as needed on sdm845 platform. This patch is dependent on the series from
Viresh [1] which adds support to propogate performance states across the
power domain hierarchy which is still being reviewed

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

[1] https://lkml.org/lkml/2018/11/26/333

Rajendra Nayak (8):
  dt-bindings: opp: Introduce qcom-opp bindings
  dt-bindings: power: Add qcom rpm power domain driver bindings
  soc: qcom: rpmpd: Add a Power domain driver to model corners
  soc: qcom: rpmpd: Add support for get/set performance state
  arm64: dts: msm8996: Add rpmpd device node
  soc: qcom: rpmhpd: Add RPMh Power domain driver
  arm64: dts: sdm845: Add rpmh powercontroller node
  soc: qcom: rpmhpd: Mark mx as a parent for cx

 .../devicetree/bindings/opp/qcom-opp.txt      |  25 +
 .../devicetree/bindings/power/qcom,rpmpd.txt  | 146 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  34 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  51 ++
 drivers/soc/qcom/Kconfig                      |  18 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/rpmhpd.c                     | 442 ++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                      | 340 ++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  39 ++
 9 files changed, 1097 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 drivers/soc/qcom/rpmhpd.c
 create mode 100644 drivers/soc/qcom/rpmpd.c
 create mode 100644 include/dt-bindings/power/qcom-rpmpd.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
