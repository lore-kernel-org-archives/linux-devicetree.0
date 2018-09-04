From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v4 0/4] Add EDAC driver for QCOM SoCs
Date: Tue,  4 Sep 2018 16:22:21 -0700
Message-ID: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This series implements EDAC driver for QCOM SoCs. As of now, this driver
supports EDAC for Last Level Cache Controller (LLCC). LLCC EDAC driver is
to detect and report single and double bit errors on Last Level Cache
Controller (LLCC) cache. Interrupts are triggered when the errors happen
in the cache, the driver handles those interrupts and dumps the syndrome
registers.

The driver functionality is implemented in:
qcom_edac.c : This platform driver registers to edac framework and
handles the single and double bit errors in cache by registering
interrupt handlers.

llcc-slice.c: It invokes the llcc edac driver and passes platform
data to it.

This patchset depends on the LLCC driver, which is part of 4.19 release.
Link: https://patchwork.kernel.org/patch/10422531/
Link: http://lists-archives.com/linux-kernel/29157082-dt-bindings-documentation-for-qcom-llcc.html

Patch wise description given below:

Patch 1 adds the broadcast base regmap for broadcast writes in llcc.

Patch 2 adds the required changes to register edac driver from llcc driver.

Patch 3 adds the EDAC driver support for QCOM SoCS.

Patch 4 updates the dt bindings of llcc.

Changes since v3:
  * Updated the Kconfig and addressed minor comments in the driver

Changes since v2:
  * Modified the edac driver and Kconfig
    -  removed unnecessary header files, typecasting and redundant comments.
    -  Changed the initialization of reg_data datastructure to static,
       Also updated the llcc_edac_reg_data member names and datatypes.
    -  Removed "EDAC_QCOM_LLCC_PANIC_ON_UE" Kconfig variable

Changes since v1:
  * Modified the edac driver
    - Removed duplicate functions that are used to dump the syndrome registers,
      replaced that with a common function and a reg_data datastructure.
    - Removed structure containing function pointers.
    - Addressed comments on error handling to clear the interrupt status.
  * updated Kconfig

Changes since v0:
  * Added EDAC_QCOM config and updated the driver
  * Addressed comments related to indentation and other minor ones

Channagoud Kadabi (1):
  drivers: edac: Add EDAC driver support for QCOM SoCs

Venkata Narendra Kumar Gutta (3):
  drivers: soc: Add broadcast base for Last Level Cache Controller
    (LLCC)
  drivers: soc: Add support to register LLCC EDAC driver
  dt-bindings: msm: Update documentation of qcom,llcc

 .../devicetree/bindings/arm/msm/qcom,llcc.txt      |  19 +-
 MAINTAINERS                                        |   8 +
 drivers/edac/Kconfig                               |  14 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/qcom_edac.c                           | 420 +++++++++++++++++++++
 drivers/soc/qcom/llcc-slice.c                      |  73 ++--
 include/linux/soc/qcom/llcc-qcom.h                 |  30 +-
 7 files changed, 537 insertions(+), 28 deletions(-)
 create mode 100644 drivers/edac/qcom_edac.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
