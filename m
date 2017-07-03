From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v3 0/2] IPQ4019 dts fixes
Date: Mon,  3 Jul 2017 13:17:11 +0530
Message-ID: <1499068033-24000-1-git-send-email-varada@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

v3:
  * Fix commit subject for
	dts: ipq4019: Move xo and timer nodes to SoC dtsi

v2:
  * Incorporate Stephen Boyd's comment as a separate patch
    (i.e. fix pinctrl node name)

v1:
  * Moved the xo and timer nodes to SoC dts file from board dts file.

Varadarajan Narayanan (2):
  dts: ipq4019: Fix pinctrl node name
  dts: ipq4019: Move xo and timer nodes to SoC dtsi

 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 21 +--------------------
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 21 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
