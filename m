From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/4] Add PDC Global and AOSS reset support
Date: Wed, 21 Aug 2019 15:24:38 +0530
Message-ID: <20190821095442.24495-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds PDC Global and AOSS reset support on SC7180 SoCs.

Sibi Sankar (4):
  dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
  reset: qcom: aoss: Add support for SC7180 SoCs
  dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs
  reset: qcom: pdc: Add support for SC7180 SoCs

 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 3 ++-
 drivers/reset/reset-qcom-aoss.c                             | 1 +
 drivers/reset/reset-qcom-pdc.c                              | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
