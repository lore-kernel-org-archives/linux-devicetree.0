From: Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add video nodes
Date: Thu, 27 Jun 2019 12:55:33 +0530
Message-ID: <1561620334-17642-1-git-send-email-amasule@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Aniket Masule <amasule@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This adds video nodes to sdm845 based on the examples
in the bindings.

Changes since v1:
 - Corrected the Signed-off-by ordering.
 - Corrected the node position based on the address.

Aniket Masule (1):
  arm64: dts: sdm845: Add video nodes

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
