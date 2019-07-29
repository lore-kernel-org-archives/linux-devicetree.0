From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/6] Add support for Qualcomm SM8150 and SC7180 SoCs
Date: Mon, 29 Jul 2019 17:36:27 +0530
Message-ID: <20190729120633.20451-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
support on SM8150 and SC7180 SoCs.

Sibi Sankar (6):
  soc: qcom: smem: Update max processor count
  dt-bindings: firmware: scm: Add SM8150 and SC7180 support
  dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
  mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
  dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
  soc: qcom: aoss: Add AOSS QMP support

 Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 2 ++
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
 drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
 drivers/soc/qcom/smem.c                                      | 2 +-
 6 files changed, 13 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
