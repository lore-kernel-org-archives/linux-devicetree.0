From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 0/3] Enable SD card slot on msm8998 MTP
Date: Thu, 15 Nov 2018 13:44:52 -0700
Message-ID: <1542314695-24071-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

A short series to enable the SD card slot on the msm8998 MTP so that there
is some storage media to play with.

[v2]
-Added Bjorn's reviewed by tags
-Fixed white space issues in patch 4
-Refactored pin declarations
-Squashed patches 3 and 4

Jeffrey Hugo (3):
  arm64: dts: qcom: msm8998: correct xo clock name
  arm64: dts: qcom: msm8998: Add SDCC2
  arm64: dts: qcom: msm8998-mtp: Add external SD

 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 65 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 20 +++++++++-
 2 files changed, 84 insertions(+), 1 deletion(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
