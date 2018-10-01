From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 0/2] arm64: dts: add prng-ee nodes
Date: Mon,  1 Oct 2018 11:51:49 +0530
Message-ID: <20181001062151.27607-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds prng-ee nodes for msm8996 and sdm845

changes in v6:
 - Fix comments given by Stan

changes in v5:
 - Add more description in patch logs

changes in v4:
 - Fix node address on sdm845

changes in v3:
 - Add Bjorn's reviewed-by
 - Update patch titles to reflect that they add nodes

changes in v2:
 - rebase on v4.19-rc1

Vinod Koul (2):
  arm64: dts: msm8996: add prng-ee node
  arm64: dts: sdm845: add prng-ee node

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 8 ++++++++
 2 files changed, 15 insertions(+)

-- 
2.14.4
