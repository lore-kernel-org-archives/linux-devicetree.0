From: Sibi Sankar <sibis@codeaurora.org>
Subject: [RESEND PATCH v2 0/2] Add PDC Global and AOSS reset support
Date: Sat, 24 Aug 2019 20:54:09 +0530
Message-ID: <20190824152411.21757-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds PDC Global and AOSS reset support on SC7180 SoCs.

v2:
 * Addressed Philipp's review comments

Sibi Sankar (2):
  dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
  dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs

 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
