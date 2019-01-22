From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 00/10] Qualcomm AOSS QMP driver and modem dts
Date: Mon, 21 Jan 2019 21:51:02 -0800
Message-ID: <20190122055112.30943-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the reserved memory map for SDM845, add the ADSP and CDSP nodes,
introduce a communication driver for the AOSS and a PD driver for this and
finally add the modem remoteproc driver.

Bjorn Andersson (8):
  arm64: dts: qcom: sdm845: Update PIL region memory map
  arm64: dts: qcom: sdm845: Define rmtfs memory
  arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP communication driver
  soc: qcom: Add AOSS QMP genpd provider
  remoteproc: q6v5-mss: Active powerdomain for SDM845
  arm64: dts: qcom: Add AOSS QMP node

Rajendra Nayak (1):
  remoteproc: q6v5-mss: Vote for rpmh power domains

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  75 +++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |   8 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 196 ++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c            | 144 +++++++-
 drivers/soc/qcom/Kconfig                      |  18 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/aoss-qmp-pd.c                | 138 ++++++++
 drivers/soc/qcom/aoss-qmp.c                   | 317 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  15 +
 include/linux/soc/qcom/aoss-qmp.h             |  14 +
 10 files changed, 920 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/aoss-qmp-pd.c
 create mode 100644 drivers/soc/qcom/aoss-qmp.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/linux/soc/qcom/aoss-qmp.h

-- 
2.18.0
