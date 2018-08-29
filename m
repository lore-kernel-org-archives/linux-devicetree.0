From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/6] Add support for PDC Global on SDM845 SoCs
Date: Thu, 30 Aug 2018 00:42:09 +0530
Message-ID: <20180829191215.10071-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, mka@chromium.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series add support for PDC Global (Power Domain Controller)
on SDM845 SoCs and adds pdc reset lines assert/deassert to remoteproc
Q6v5 modem-pil. The first two patches adds PDC Global reset driver to
control reset signals of Modem, Compute, Display, GPU, Debug, AOP,
Sensors, Audio, SP and APPS. The last four patches (cleans up)/adds pdc
reset lines to q6v5 bindings and asserts/deasserts in modem start/stop
path.

V3:
  refactored pdc reset driver to remove unused layer of indirection
  as suggested by Matthias
  Other minor fixes suggested by Matthias/Bjorn

V2:
  Incorporated Philipp/Bjorn/Rob suggestions
  Renamed reset binding to pdc-global.txt
  replaced offset with #define of register name
  replaced with devm_reset_control_get_exclusive()
  Separted dt binding from the drivers

Sibi Sankar (6):
  dt-bindings: reset: Add PDC Global binding for SDM845 SoCs
  reset: qcom: PDC Global (Power Domain Controller) reset controller
  dt-bindings: remoteproc: qcom: Remove additional definition tag
  dt-bindings: remoteproc: Add PDC reset binding for Q6V5 PIL
  remoteproc: qcom: q6v5-pil: Explicitly get mss_restart line
  remoteproc: qcom: q6v5-pil: Add PDC reset for modem on SDM845 SoCs

 .../bindings/remoteproc/qcom,q6v5.txt         |   8 +-
 .../bindings/reset/qcom,pdc-global.txt        |  52 ++++++++
 drivers/remoteproc/qcom_q6v5_pil.c            |  31 ++++-
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-qcom-pdc.c                | 124 ++++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h   |  20 +++
 7 files changed, 237 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 drivers/reset/reset-qcom-pdc.c
 create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
