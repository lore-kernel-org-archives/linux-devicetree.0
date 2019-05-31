From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v8 0/4] Qualcomm AOSS QMP driver
Date: Thu, 30 May 2019 20:00:53 -0700
Message-ID: <20190531030057.18328-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce a driver implementing Qualcomm Messaging Protocol (QMP) to
communicate with the Always On Subsystem (AOSS) and expose the low-power
states for the remoteprocs as a set of power-domains and the QDSS clock
as a clock.

Changes since v7:
- Minor tweaks code style tweaks and error handling

Changes since v6:
- First couple of patches merged for v5.2
- Squashed the qmp and qmp-pd driver into one and by that moved it all
  to one file
- Expose QDSS clock as a clock instead of a power domain

Bjorn Andersson (3):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP driver
  arm64: dts: qcom: Add AOSS QMP node

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  81 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  68 +++
 drivers/soc/qcom/Kconfig                      |  12 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_aoss.c                  | 479 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  14 +
 6 files changed, 655 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/qcom_aoss.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
2.18.0
