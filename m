From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 00/13] Add support for QCOM Core Power Reduction
Date: Fri,  5 Jul 2019 11:57:11 +0200
Message-ID: <20190705095726.21433-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds support for Core Power Reduction (CPR), a form of
Adaptive Voltage Scaling (AVS), found on certain Qualcomm SoCs.

This series is based on top of the qcs404 cpufreq patch series that
hasn't landed yet:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=137809

CPR is a technology that reduces core power on a CPU or on other device.
It reads voltage settings from efuses (that have been written in
production), it uses these voltage settings as initial values, for each
OPP.

After moving to a certain OPP, CPR monitors dynamic factors such as
temperature, etc. and adjusts the voltage for that frequency accordingly
to save power and meet silicon characteristic requirements.

This driver has been developed together with Jorge Ramirez-Ortiz, and
is based on an RFC by Stephen Boyd[1], which in turn is based on work
by others on codeaurora.org[2].

[1] https://lkml.org/lkml/2015/9/18/833
[2] https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/regulator/cpr-regulator.c?h=msm-3.10

Jorge Ramirez-Ortiz (1):
  cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist

Niklas Cassel (10):
  dt-bindings: cpufreq: qcom-nvmem: Make speedbin related properties
    optional
  cpufreq: qcom: Refactor the driver to make it easier to extend
  dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power
    domain
  cpufreq: qcom: Add support for qcs404 on nvmem driver
  dt-bindings: opp: Add qcom-opp bindings with properties needed for CPR
  dt-bindings: power: avs: Add support for CPR (Core Power Reduction)
  power: avs: Add support for CPR (Core Power Reduction)
  arm64: dts: qcom: qcs404: Add CPR and populate OPP table
  arm64: defconfig: enable CONFIG_QCOM_CPR
  arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM

Sricharan R (2):
  dt-bindings: cpufreq: Re-organise kryo cpufreq to use it for other
    nvmem based qcom socs
  cpufreq: qcom: Re-organise kryo cpufreq to use it for other nvmem
    based qcom socs

 ...ryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} |  125 +-
 .../devicetree/bindings/opp/qcom-opp.txt      |   19 +
 .../bindings/power/avs/qcom,cpr.txt           |  193 ++
 MAINTAINERS                                   |   13 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  145 +-
 arch/arm64/configs/defconfig                  |    2 +
 drivers/cpufreq/Kconfig.arm                   |    4 +-
 drivers/cpufreq/Makefile                      |    2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |    1 +
 drivers/cpufreq/qcom-cpufreq-kryo.c           |  249 ---
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |  351 ++++
 drivers/power/avs/Kconfig                     |   15 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/qcom-cpr.c                  | 1839 +++++++++++++++++
 14 files changed, 2692 insertions(+), 267 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (87%)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
 delete mode 100644 drivers/cpufreq/qcom-cpufreq-kryo.c
 create mode 100644 drivers/cpufreq/qcom-cpufreq-nvmem.c
 create mode 100644 drivers/power/avs/qcom-cpr.c

-- 
2.21.0
