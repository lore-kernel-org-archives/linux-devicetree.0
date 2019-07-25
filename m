From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 00/14] Add support for QCOM Core Power Reduction
Date: Thu, 25 Jul 2019 12:41:28 +0200
Message-ID: <20190725104144.22924-1-niklas.cassel@linaro.org>
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
To: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, sboyd@kernel.org, vireshk@kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, jorge.ramirez-ortiz@linaro.org, linux-arm-kernel@lists.infradead.org
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

Changes since V1:
Added a new patch implementing dev_pm_opp_find_level_exact() in order to
make the CPR OPP table in device tree cleaner.
For more detailed changes, check the "Changes since V1" as comments in
the individual patches, where applicable.

Jorge Ramirez-Ortiz (1):
  cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist

Niklas Cassel (11):
  opp: Add dev_pm_opp_find_level_exact()
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
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  142 +-
 arch/arm64/configs/defconfig                  |    2 +
 drivers/cpufreq/Kconfig.arm                   |    4 +-
 drivers/cpufreq/Makefile                      |    2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |    1 +
 drivers/cpufreq/qcom-cpufreq-kryo.c           |  249 ---
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |  352 +++
 drivers/opp/core.c                            |   48 +
 drivers/power/avs/Kconfig                     |   15 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/qcom-cpr.c                  | 1885 +++++++++++++++++
 include/linux/pm_opp.h                        |    8 +
 16 files changed, 2792 insertions(+), 267 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (87%)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
 create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
 delete mode 100644 drivers/cpufreq/qcom-cpufreq-kryo.c
 create mode 100644 drivers/cpufreq/qcom-cpufreq-nvmem.c
 create mode 100644 drivers/power/avs/qcom-cpr.c

-- 
2.21.0
