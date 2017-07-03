From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v2 0/2] IPQ4019 dts fixes
Date: Mon,  3 Jul 2017 13:04:42 +0530
Message-ID: <1499067284-21008-1-git-send-email-varada@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

v2:
  * Incorporate Stephen Boyd's comment as a separate patch

v1:
  * Moved the xo and timer nodes to SoC dts file from board dts file.

Varadarajan Narayanan (2):
  dts: ipq4019: Fix pinctrl node name
  Subject: [PATCH] dts: ipq4019: Move xo and timer nodes to SoC dtsi

 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 21 +--------------------
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 21 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
