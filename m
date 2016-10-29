From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH 0/3] Remove clocks dependency from SCM driver
Date: Fri, 28 Oct 2016 17:08:46 -0700
Message-ID: <1477699729-18451-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On earlier chiptsets (APQ8064, MSM8660, MSM8690, MSM8916,
APQ8084, MSM8974) crypto operations of TZ were depends on crypto
clocks controlled by users/clients. However on MSM8996 crypto clocks
control is handled internally in TZ itself. The current series of
patches handle this clock dependency in SCM driver.

Sarangdhar Joshi (3):
  dt-bindings: firmware: scm: Add MSM8996 DT bindings
  firmware: qcom: scm: Remove core, iface and bus clocks dependency
  firmware: qcom: scm: Return PTR_ERR when devm_clk_get fails

 .../devicetree/bindings/firmware/qcom,scm.txt      |  2 +
 drivers/firmware/qcom_scm.c                        | 65 +++++++++++++++-------
 2 files changed, 48 insertions(+), 19 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
