From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH v2 0/4] MSM8996 DT Support for ADSP PIL
Date: Thu, 20 Oct 2016 16:12:15 -0700
Message-ID: <1477005139-15564-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add various device tree nodes to lay the groundwork for
Qualcomm ADSP Peripheral Image Loader.

Sorry, I didn't send any cover letter for v1.

Changes since v1:
- Move hwlock DT node under root (/) (Bjorn and Andy)
- Rename smp2p-adsp to adsp-smp2p (Bjorn)
- Remove interrupt-parent property from node (Bjorn)

Bjorn Andersson (1):
  arm64: dts: msm8996: Add SMEM DT nodes

Sarangdhar Joshi (3):
  arm64: dts: msm8996: Add SMEM reserve-memory node
  arm64: dts: msm8996: Add reserve-memory nodes
  arm64: dts: msm8996: Add SMP2P and APCS nodes

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
