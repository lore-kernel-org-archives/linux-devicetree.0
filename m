From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: sdm845: Fix DTS warnings
Date: Mon, 22 Jul 2019 18:04:17 +0530
Message-ID: <20190722123422.4571-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

So this is an attempt to fix some warns on sdm845 dts. We still have bunch
of warnings to fix after this series (dupplicate adress and node names
having underscores etc).

lets get long hanging ones fixed, we can see the warns with W=1 or W=2

Vinod Koul (5):
  arm64: dts: qcom: sdm845: Add unit name to soc node
  arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
  arm64: dts: qcom: sdm845: remove unit name for thermal trip points
  arm64: dts: qcom: sdm845: remove macro from unit name
  arm64: dts: qcom: sdm845-cheza: remove macro from unit name

 arch/arm64/boot/dts/qcom/pm8998.dtsi       |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 66 ++++++++++------------
 3 files changed, 36 insertions(+), 42 deletions(-)

Thanks
-- 
2.20.1
