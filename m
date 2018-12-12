From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 0/2] arm64: dts: msm8996: Add display and graphics smmu
Date: Wed, 12 Dec 2018 19:06:45 +0530
Message-ID: <20181212133647.9692-1-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The driver side patches are now pulled in [1]. So, we can now enable
these smmu's used by display and graphics.
This has been lying in my test trees [2] for a while, and work well with
display and gpu enabled on msm8996.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
[2] https://github.com/vivekgautam1/linux/tree/origin/v4.20-rc5/db820c

Archit Taneja (1):
  arm64: dts: msm8996: Add display smmu node

Jordan Crouse (1):
  arm64: dts: msm8996: Add graphics smmu node

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
