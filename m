From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH 0/4] Enable SD crd slot on msm8998 MTP
Date: Thu, 15 Nov 2018 10:18:07 -0700
Message-ID: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

A short series to enable the SD card slot on the msm8998 MTP so that there
is some storage media to play with.

Jeffrey Hugo (4):
  arm64: dts: qcom: msm8998: correct xo clock name
  arm64: dts: qcom: msm8998: Add SDCC2
  arm64: dts: qcom: msm8998: Add SDC2 control pins
  arm64: dts: qcom: msm8998-mtp: Add external SD

 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi  | 13 +++++
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 78 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 22 ++++++++-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
