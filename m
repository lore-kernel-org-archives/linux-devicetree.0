From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/7] Add support for Qualcomm SM8150 and SC7180 SoCs
Date: Wed,  7 Aug 2019 12:39:50 +0530
Message-ID: <20190807070957.30655-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
support on SM8150 and SC7180 SoCs.

v2:
 * re-arrange the compatible lists in sort order

Sibi Sankar (7):
  soc: qcom: smem: Update max processor count
  dt-bindings: firmware: scm: re-order compatible list
  dt-bindings: firmware: scm: Add SM8150 and SC7180 support
  dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
  mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
  dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
  soc: qcom: aoss: Add AOSS QMP support

 Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 4 +++-
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
 drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
 drivers/soc/qcom/smem.c                                      | 2 +-
 6 files changed, 14 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
