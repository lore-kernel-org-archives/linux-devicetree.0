From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v0 0/4] Add cache erp driver for Last Level Cache Controller (LLCC)
Date: Wed, 25 Jul 2018 10:44:53 -0700
Message-ID: <1532540697-26630-1-git-send-email-vnkgutta@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org, robh@kernel.org, bp@alien8.de, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org
List-Id: devicetree@vger.kernel.org

This series implements cache erp driver for Last Level Cache Controller 
(LLCC). Cache erp driver is to detect and report single and double bit
errors on Last Level Cache Controller (LLCC) cache. This driver also takes
care of dumping registers and have config options to enable and disable
panic when these errors happen in LLCC.

The driver functionality is implemented in:
qcom_llcc_edac.c : This platform driver registers to edac framework and
handles the single and double bit errors in llcc cache by registering
interrupt handlers. 

llcc-slice.c: It invokes the llcc cache erp driver and passes platform
data to it. 

This patchset depends on the LLCC driver, which is yet to be merged.
Link: https://patchwork.kernel.org/patch/10422531/
Link: Link: http://lists-archives.com/linux-kernel/29157082-dt-bindings-documentation-for-qcom-llcc.html

Venkata Narendra Kumar Gutta (4):
  drivers: soc: Add broadcast base for Last Level Cache Controller
    (LLCC)
  drivers: soc: Support to add cache erp driver for Last Level Cache
    Controller (LLCC)
  drivers: edac: Add cache erp driver for Last Level Cache Controller
    (LLCC)
  dt-bindigs: Update documentation of qcom,llcc

 .../devicetree/bindings/arm/msm/qcom,llcc.txt      |  41 ++
 drivers/edac/Kconfig                               |  21 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/qcom_llcc_edac.c                      | 523 +++++++++++++++++++++
 drivers/soc/qcom/llcc-slice.c                      |  74 ++-
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +-
 6 files changed, 640 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
 create mode 100644 drivers/edac/qcom_llcc_edac.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
