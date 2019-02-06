From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v6 00/8] Qualcomm AOSS QMP driver and modem dts
Date: Tue,  5 Feb 2019 21:13:27 -0800
Message-ID: <20190206051335.23799-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the reserved memory map for SDM845, add the ADSP and CDSP nodes,
introduce a communication driver for the AOSS and a PD driver for this and
finally add the modem remoteproc driver.

Bjorn Andersson (7):
  arm64: dts: qcom: sdm845: Update reserved memory map
  arm64: dts: qcom: sdm845: Define rmtfs memory
  arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP communication driver
  soc: qcom: Add AOSS QMP genpd provider
  arm64: dts: qcom: Add AOSS QMP node

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  76 ++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |   8 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 209 ++++++++++-
 drivers/soc/qcom/Kconfig                      |  18 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/aoss-qmp-pd.c                | 158 +++++++++
 drivers/soc/qcom/aoss-qmp.c                   | 326 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  15 +
 include/linux/soc/qcom/aoss-qmp.h             |  14 +
 9 files changed, 819 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/aoss-qmp-pd.c
 create mode 100644 drivers/soc/qcom/aoss-qmp.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/linux/soc/qcom/aoss-qmp.h

-- 
2.18.0
